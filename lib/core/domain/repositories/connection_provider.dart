import '../entities/connection_config.dart';
import '../entities/connection_status.dart';
import '../entities/command_result.dart';

abstract class ConnectionProvider {
  Future<void> connect(ConnectionConfig config);
  Future<void> disconnect();
  Future<CommandResult> executeCommand(String command);
  Future<String> readFile(String path);
  Future<void> writeFile(String path, String content);
  Future<List<String>> listFiles(String path);
  Stream<ConnectionStatus> get statusStream;
  ConnectionStatus get currentStatus;
}
