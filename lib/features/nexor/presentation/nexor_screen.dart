import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../domain/entities/message.dart';
import '../infrastructure/repositories/nexor_repository_impl.dart';
import '../infrastructure/providers/qwen_provider.dart';
import '../infrastructure/tools/tool_registry.dart';
import '../../setup/presentation/connection_provider.dart';
import '../../nexi/presentation/nexi_marketplace.dart';
import '../../../shared/widgets/settings_screen.dart';

final nexorRepositoryProvider = Provider((ref) => NexorRepositoryImpl());

final qwenProviderProvider = Provider((ref) {
  final apiKey = ref.watch(apiKeyProvider);
  return QwenProvider(apiKey: apiKey);
});

final currentChatIdProvider = StateProvider<String?>((ref) => null);

final messagesProvider = StateProvider<List<Message>>((ref) => []);

class NexorScreen extends ConsumerStatefulWidget {
  const NexorScreen({super.key});

  @override
  ConsumerState<NexorScreen> createState() => _NexorScreenState();
}

class _NexorScreenState extends ConsumerState<NexorScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    registerDefaultTools();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    _controller.clear();
    setState(() => _isLoading = true);

    final userMessage = Message(
      id: const Uuid().v4(),
      role: MessageRole.user,
      content: text,
      timestamp: DateTime.now(),
    );

    final messages = ref.read(messagesProvider);
    ref.read(messagesProvider.notifier).state = [...messages, userMessage];

    _scrollToBottom();

    try {
      final provider = ref.read(qwenProviderProvider);
      final activeNexi = ref.read(activeNexiProvider);
      
      if (!provider.isConfigured) {
        _addAssistantMessage('Qwen API key not configured. Please add your API key in settings.');
        return;
      }

      // Use Nexi system prompt if active
      final systemMessage = activeNexi != null
          ? Message(
              id: const Uuid().v4(),
              role: MessageRole.system,
              content: activeNexi.systemPrompt,
            )
          : null;

      final conversationMessages = systemMessage != null
          ? [systemMessage, ...messages, userMessage]
          : [...messages, userMessage];

      // Use Nexi tools if active
      final tools = activeNexi != null
          ? ToolRegistry.getAvailableTools()
              .where((t) => activeNexi.tools.contains(t.name))
              .toList()
          : ToolRegistry.getAvailableTools();

      final stream = await provider.chat(
        messages: conversationMessages,
        tools: tools,
      );

      final buffer = StringBuffer();
      await for (final chunk in stream) {
        buffer.write(chunk);
      }

      final assistantMessage = Message(
        id: const Uuid().v4(),
        role: MessageRole.assistant,
        content: buffer.toString(),
        timestamp: DateTime.now(),
      );

      final updatedMessages = ref.read(messagesProvider);
      ref.read(messagesProvider.notifier).state = [...updatedMessages, assistantMessage];
      
      _scrollToBottom();
    } catch (e) {
      _addAssistantMessage('Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _addAssistantMessage(String content) {
    final message = Message(
      id: const Uuid().v4(),
      role: MessageRole.assistant,
      content: content,
      timestamp: DateTime.now(),
    );
    final messages = ref.read(messagesProvider);
    ref.read(messagesProvider.notifier).state = [...messages, message];
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(messagesProvider);
    final activeNexi = ref.watch(activeNexiProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(activeNexi != null ? activeNexi.config.name : 'Nexor AI'),
        actions: [
          if (activeNexi != null)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                ref.read(activeNexiProvider.notifier).state = null;
              },
              tooltip: 'Clear Agent',
            ),
          IconButton(
            icon: const Icon(Icons.apps),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NexiMarketplace()),
              );
            },
            tooltip: 'Select Agent',
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              ref.read(messagesProvider.notifier).state = [];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (activeNexi != null) _buildNexiHeader(activeNexi),
          Expanded(
            child: messages.isEmpty
                ? _buildEmptyState(activeNexi)
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return _MessageBubble(message: messages[index]);
                    },
                  ),
          ),
          _buildInputArea(activeNexi),
        ],
      ),
    );
  }

  Widget _buildNexiHeader(dynamic nexi) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _parseColor(nexi.config.color),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getIcon(nexi.config.icon),
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nexi.config.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  '${nexi.tools.length} tools available',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _parseColor(String colorStr) {
    return Color(int.parse(colorStr.substring(1), radix: 16) + 0xFF000000);
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'search_code':
        return Icons.search;
      case 'bug_report':
        return Icons.bug_report;
      case 'description':
        return Icons.description;
      default:
        return Icons.smart_toy;
    }
  }

  Widget _buildEmptyState(dynamic activeNexi) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            activeNexi != null ? _getIcon(activeNexi.config.icon) : Icons.chat_bubble_outline,
            size: 80,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            activeNexi != null ? activeNexi.config.name : 'Start a conversation',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            activeNexi?.welcomeMessage ?? 'Ask me anything about your code',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea(dynamic activeNexi) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: activeNexi?.placeholderText ?? 'Type your message...',
                border: const OutlineInputBorder(),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            icon: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            onPressed: _isLoading ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Message message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == MessageRole.user;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message.content,
          style: TextStyle(
            color: isUser
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
