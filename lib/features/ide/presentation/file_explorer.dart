import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/entities/file_node.dart';
import '../../../core/domain/repositories/file_repository.dart';
import '../../../core/infrastructure/repositories/file_repository_impl.dart';
import '../../setup/presentation/connection_provider.dart';

final fileRepositoryProvider = Provider<FileRepository?>((ref) {
  final connection = ref.watch(connectionProvider.notifier).provider;
  if (connection == null) return null;
  return FileRepositoryImpl(connection);
});

final currentPathProvider = StateProvider<String>((ref) => '/');

final filesProvider = FutureProvider.family<List<FileNode>, String>((ref, path) async {
  final repo = ref.watch(fileRepositoryProvider);
  if (repo == null) return [];
  return await repo.listFiles(path);
});

class FileExplorer extends ConsumerStatefulWidget {
  const FileExplorer({super.key});

  @override
  ConsumerState<FileExplorer> createState() => _FileExplorerState();
}

class _FileExplorerState extends ConsumerState<FileExplorer> {
  final Set<String> _expandedPaths = {};

  @override
  Widget build(BuildContext context) {
    final currentPath = ref.watch(currentPathProvider);
    final filesAsync = ref.watch(filesProvider(currentPath));

    return Column(
      children: [
        _buildPathBar(currentPath),
        Expanded(
          child: filesAsync.when(
            data: (files) => _buildFileList(files),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Text('Error: $error'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPathBar(String path) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: path != '/' ? () {
              final parent = path.substring(0, path.lastIndexOf('/'));
              ref.read(currentPathProvider.notifier).state = parent.isEmpty ? '/' : parent;
            } : null,
          ),
          Expanded(
            child: Text(
              path,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(filesProvider(path)),
          ),
        ],
      ),
    );
  }

  Widget _buildFileList(List<FileNode> files) {
    if (files.isEmpty) {
      return const Center(child: Text('Empty directory'));
    }

    return ListView.builder(
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        return _FileItem(
          file: file,
          onTap: () {
            if (file.isDirectory) {
              ref.read(currentPathProvider.notifier).state = file.path;
            }
          },
        );
      },
    );
  }
}

class _FileItem extends StatelessWidget {
  final FileNode file;
  final VoidCallback onTap;

  const _FileItem({
    required this.file,
    required this.onTap,
  });

  IconData _getIcon() {
    if (file.isDirectory) return Icons.folder;
    final ext = file.name.split('.').last.toLowerCase();
    switch (ext) {
      case 'dart': return Icons.code;
      case 'js': case 'ts': case 'jsx': case 'tsx': return Icons.javascript;
      case 'py': return Icons.code;
      case 'json': return Icons.data_object;
      case 'md': return Icons.description;
      case 'png': case 'jpg': case 'jpeg': case 'gif': return Icons.image;
      default: return Icons.insert_drive_file;
    }
  }

  Color _getIconColor(BuildContext context) {
    if (file.isDirectory) return Theme.of(context).colorScheme.primary;
    return Theme.of(context).colorScheme.onSurfaceVariant;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(_getIcon(), color: _getIconColor(context)),
      title: Text(file.name),
      subtitle: file.size != null ? Text(_formatSize(file.size!)) : null,
      onTap: onTap,
      trailing: file.isDirectory ? const Icon(Icons.chevron_right) : null,
    );
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
