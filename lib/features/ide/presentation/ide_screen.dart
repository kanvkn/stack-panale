import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'file_explorer.dart';
import 'code_editor_widget.dart';
import 'tab_state.dart';
import '../../terminal/presentation/terminal_widget.dart';

class IDEScreen extends ConsumerStatefulWidget {
  const IDEScreen({super.key});

  @override
  ConsumerState<IDEScreen> createState() => _IDEScreenState();
}

class _IDEScreenState extends ConsumerState<IDEScreen> {
  bool _showTerminal = false;

  @override
  Widget build(BuildContext context) {
    final tabs = ref.watch(tabsProvider);
    final activeTabId = ref.watch(activeTabIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack IDE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.smart_toy),
            onPressed: () => context.push('/nexor'),
            tooltip: 'Nexor AI',
          ),
          IconButton(
            icon: const Icon(Icons.apps),
            onPressed: () => context.push('/nexi'),
            tooltip: 'Nexi Marketplace',
          ),
          IconButton(
            icon: Icon(_showTerminal ? Icons.code : Icons.terminal),
            onPressed: () {
              setState(() {
                _showTerminal = !_showTerminal;
              });
            },
            tooltip: _showTerminal ? 'Hide Terminal' : 'Show Terminal',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 280,
            child: _FileExplorerPanel(
              onFileSelected: (path, name, content) {
                ref.read(tabsProvider.notifier).openTab(path, name, content);
                final newTab = ref.read(tabsProvider).firstWhere((t) => t.path == path);
                ref.read(activeTabIdProvider.notifier).state = newTab.id;
              },
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Column(
              children: [
                if (tabs.isNotEmpty) _TabBar(tabs: tabs, activeTabId: activeTabId),
                Expanded(
                  child: _showTerminal
                      ? Column(
                          children: [
                            if (tabs.isNotEmpty && activeTabId != null)
                              Expanded(child: _EditorArea(tabs: tabs, activeTabId: activeTabId)),
                            const Divider(height: 1),
                            const SizedBox(
                              height: 300,
                              child: TerminalWidget(),
                            ),
                          ],
                        )
                      : tabs.isEmpty
                          ? const _EmptyState()
                          : activeTabId == null
                              ? const _EmptyState()
                              : _EditorArea(tabs: tabs, activeTabId: activeTabId),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FileExplorerPanel extends ConsumerWidget {
  final Function(String path, String name, String content) onFileSelected;

  const _FileExplorerPanel({required this.onFileSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Row(
            children: [
              Text(
                'Files',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        const Expanded(child: FileExplorer()),
      ],
    );
  }
}

class _TabBar extends ConsumerWidget {
  final List<EditorTab> tabs;
  final String? activeTabId;

  const _TabBar({required this.tabs, required this.activeTabId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 40,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isActive = tab.id == activeTabId;

          return InkWell(
            onTap: () {
              ref.read(activeTabIdProvider.notifier).state = tab.id;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).colorScheme.surface
                    : Colors.transparent,
                border: Border(
                  right: BorderSide(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    tab.name,
                    style: TextStyle(
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (tab.isDirty) ...[
                    const SizedBox(width: 4),
                    const Text('•'),
                  ],
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      ref.read(tabsProvider.notifier).closeTab(tab.id);
                      if (isActive && tabs.length > 1) {
                        final nextTab = tabs.firstWhere((t) => t.id != tab.id);
                        ref.read(activeTabIdProvider.notifier).state = nextTab.id;
                      } else if (tabs.length == 1) {
                        ref.read(activeTabIdProvider.notifier).state = null;
                      }
                    },
                    child: const Icon(Icons.close, size: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EditorArea extends ConsumerWidget {
  final List<EditorTab> tabs;
  final String activeTabId;

  const _EditorArea({required this.tabs, required this.activeTabId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = tabs.firstWhere((tab) => tab.id == activeTabId);

    return CodeEditorWidget(
      key: ValueKey(activeTab.id),
      filePath: activeTab.path,
      initialContent: activeTab.content,
      onChanged: (content) {
        ref.read(tabsProvider.notifier).updateTabContent(activeTab.id, content);
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.code,
            size: 80,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No file open',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Select a file from the explorer to start editing',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
