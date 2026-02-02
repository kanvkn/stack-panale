import '../entities/file_node.dart';

abstract class FileRepository {
  Future<List<FileNode>> listFiles(String path);
  Future<String> readFile(String path);
  Future<void> writeFile(String path, String content);
  Future<void> deleteFile(String path);
  Future<void> createDirectory(String path);
  Future<void> renameFile(String oldPath, String newPath);
}
