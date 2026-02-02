import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/entities/nexi_agent.dart';
import '../infrastructure/nexi_registry.dart';
import '../agents/code_review_agent.dart';
import '../agents/debugging_agent.dart';
import '../agents/documentation_agent.dart';

final nexiRegistryProvider = Provider((ref) {
  final registry = NexiRegistry();
  registerCodeReviewAgent();
  registerDebuggingAgent();
  registerDocumentationAgent();
  return registry;
});

final activeNexiProvider = StateProvider<NexiAgent?>((ref) => null);

class NexiMarketplace extends ConsumerWidget {
  const NexiMarketplace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registry = ref.watch(nexiRegistryProvider);
    final agents = registry.getAll();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nexi Marketplace'),
      ),
      body: agents.isEmpty
          ? const Center(child: Text('No agents available'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: agents.length,
              itemBuilder: (context, index) {
                return _NexiCard(agent: agents[index]);
              },
            ),
    );
  }
}

class _NexiCard extends ConsumerWidget {
  final NexiAgent agent;

  const _NexiCard({required this.agent});

  Color _parseColor(String colorStr) {
    return Color(int.parse(colorStr.substring(1), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeNexi = ref.watch(activeNexiProvider);
    final isActive = activeNexi?.config.id == agent.config.id;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          ref.read(activeNexiProvider.notifier).state = agent;
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _parseColor(agent.config.color).withValues(alpha: 0.1),
                _parseColor(agent.config.color).withValues(alpha: 0.05),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _parseColor(agent.config.color),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        _getIcon(agent.config.icon),
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    if (isActive)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Active',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  agent.config.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  agent.config.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.build,
                      size: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${agent.tools.length} tools',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
}
