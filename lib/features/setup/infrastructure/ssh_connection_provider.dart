import 'dart:async';
import 'dart:convert';
import 'package:dartssh2/dartssh2.dart';
import '../../../core/domain/entities/connection_config.dart';
import '../../../core/domain/entities/connection_status.dart';
import '../../../core/domain/entities/command_result.dart';
import '../../../core/domain/repositories/connection_provider.dart';

class SSHConnectionProvider implements ConnectionProvider {
  SSHClient? _client;
  SftpClient? _sftp;
  
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
    try {
      _updateStatus(const ConnectionStatus(state: ConnectionState.connecting));
      
      final sshConfig = config.metadata!;
      final socket = await SSHSocket.connect(
        sshConfig['host'],
        sshConfig['port'] ?? 22,
      );

      _client = SSHClient(
        socket,
        username: sshConfig['username'],
        onPasswordRequest: () => sshConfig['password'] ?? '',
      );

      _sftp = await _client!.sftp();

      _updateStatus(ConnectionStatus(
        state: ConnectionState.connected,
        connectedAt: DateTime.now(),
      ));
    } catch (e) {
      _updateStatus(ConnectionStatus(
        state: ConnectionState.error,
        message: e.toString(),
      ));
      rethrow;
    }
  }

  @override
  Future<void> disconnect() async {
    _client?.close();
    _client = null;
    _sftp = null;
    _updateStatus(const ConnectionStatus(state: ConnectionState.disconnected));
  }

  @override
  Future<CommandResult> executeCommand(String command) async {
    if (_client == null) {
      return const CommandResult(
        success: false,
        output: '',
        error: 'Not connected',
      );
    }

    try {
      final session = await _client!.execute(command);
      final output = await utf8.decoder.bind(session.stdout).join();
      final error = await utf8.decoder.bind(session.stderr).join();
      final exitCode = session.exitCode;

      return CommandResult(
        success: exitCode == 0,
        output: output,
        error: error.isEmpty ? null : error,
        exitCode: exitCode,
      );
    } catch (e) {
      return CommandResult(
        success: false,
        output: '',
        error: e.toString(),
      );
    }
  }

  @override
  Future<String> readFile(String path) async {
    if (_sftp == null) throw Exception('Not connected');
    
    try {
      final file = await _sftp!.open(path);
      final content = await file.readBytes();
      await file.close();
      return utf8.decode(content);
    } catch (e) {
      throw Exception('Failed to read file: $e');
    }
  }

  @override
  Future<void> writeFile(String path, String content) async {
    if (_sftp == null) throw Exception('Not connected');
    
    try {
      final file = await _sftp!.open(
        path,
        mode: SftpFileOpenMode.create | SftpFileOpenMode.write | SftpFileOpenMode.truncate,
      );
      await file.writeBytes(utf8.encode(content));
      await file.close();
    } catch (e) {
      throw Exception('Failed to write file: $e');
    }
  }

  @override
  Future<List<String>> listFiles(String path) async {
    if (_sftp == null) throw Exception('Not connected');
    
    try {
      final items = await _sftp!.listdir(path);
      return items.map((item) => item.filename).toList();
    } catch (e) {
      throw Exception('Failed to list files: $e');
    }
  }

  void dispose() {
    disconnect();
    _statusController.close();
  }
}
