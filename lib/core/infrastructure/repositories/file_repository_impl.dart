import '../../../core/domain/entities/file_node.dart';
import '../../../core/domain/repositories/file_repository.dart';
import '../../../core/domain/repositories/connection_provider.dart';

class FileRepositoryImpl implements FileRepository {
  final ConnectionProvider connectionProvider;

  FileRepositoryImpl(this.connectionProvider);

  @override
  Future<List<FileNode>> listFiles(String path) async {
    final files = await connectionProvider.listFiles(path);
    return files.map((file) {
      final isDir = !file.contains('.');
      return FileNode(
        name: file.split('/').last,
        path: file,
        isDirectory: isDir,
      );
    }).toList();
  }

  @override
  Future<String> readFile(String path) => connectionProvider.readFile(path);

  @override
  Future<void> writeFile(String path, String content) =>
      connectionProvider.writeFile(path, content);

  @override
  Future<void> deleteFile(String path) async {
    await connectionProvider.executeCommand('rm -rf "$path"');
  }

  @override
  Future<void> createDirectory(String path) async {
    await connectionProvider.executeCommand('mkdir -p "$path"');
  }

  @override
  Future<void> renameFile(String oldPath, String newPath) async {
    await connectionProvider.executeCommand('mv "$oldPath" "$newPath"');
  }
}
