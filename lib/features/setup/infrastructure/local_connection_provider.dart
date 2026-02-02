import 'dart:async';
import 'dart:io';
import '../../../core/domain/entities/connection_config.dart';
import '../../../core/domain/entities/connection_status.dart';
import '../../../core/domain/entities/command_result.dart';
import '../../../core/domain/repositories/connection_provider.dart';

class LocalConnectionProvider implements ConnectionProvider {
  final _statusController = StreamController<ConnectionStatus>.broadcast();
  ConnectionStatus _currentStatus = const ConnectionStatus(
    state: ConnectionState.disconnected,
  );

  @override
  Stream<ConnectionStatus> get statusStream => _statusController.stream;

  @override
  ConnectionStatus get currentStatus => _currentStatus;

  void _updateStatus(ConnectionStatus status) {
    _currentStatus = status;
    _statusController.add(status);
  }

  @override
  Future<void> connect(ConnectionConfig config) async {
    _updateStatus(const ConnectionStatus(
      state: ConnectionState.connected,
      message: 'Local mode - Limited functionality',
    ));
  }

  @override
  Future<void> disconnect() async {
    _updateStatus(const ConnectionStatus(state: ConnectionState.disconnected));
  }

  @override
  Future<CommandResult> executeCommand(String command) async {
    return const CommandResult(
      success: false,
      output: '',
      error: 'Command execution not available in local mode (Under Development)',
    );
  }

  @override
  Future<String> readFile(String path) async {
    try {
      final file = File(path);
      return await file.readAsString();
    } catch (e) {
      throw Exception('Failed to read file: $e');
    }
  }

  @override
  Future<void> writeFile(String path, String content) async {
    try {
      final file = File(path);
      await file.writeAsString(content);
    } catch (e) {
      throw Exception('Failed to write file: $e');
    }
  }

  @override
  Future<List<String>> listFiles(String path) async {
    try {
      final dir = Directory(path);
      final entities = await dir.list().toList();
      return entities.map((e) => e.path).toList();
    } catch (e) {
      throw Exception('Failed to list files: $e');
    }
  }

  void dispose() {
    _statusController.close();
  }
}
