import '../entities/file_node.dart';
import '../repositories/file_repository.dart';

class ListFilesUseCase {
  final FileRepository repository;
  ListFilesUseCase(this.repository);
  
  Future<List<FileNode>> call(String path) => repository.listFiles(path);
}

class ReadFileUseCase {
  final FileRepository repository;
  ReadFileUseCase(this.repository);
  
  Future<String> call(String path) => repository.readFile(path);
}

class WriteFileUseCase {
  final FileRepository repository;
  WriteFileUseCase(this.repository);
  
  Future<void> call(String path, String content) => 
      repository.writeFile(path, content);
}

class DeleteFileUseCase {
  final FileRepository repository;
  DeleteFileUseCase(this.repository);
  
  Future<void> call(String path) => repository.deleteFile(path);
}
