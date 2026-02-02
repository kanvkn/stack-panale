import 'dart:async';
import 'package:flutter/services.dart';
import '../../../core/domain/entities/connection_config.dart';
import '../../../core/domain/entities/connection_status.dart';
import '../../../core/domain/entities/command_result.dart';
import '../../../core/domain/repositories/connection_provider.dart';

class TermuxConnectionProvider implements ConnectionProvider {
  static const platform = MethodChannel('com.stackmobile/termux');
  
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
      
      // Check if Termux:API is available
      final result = await platform.invokeMethod('checkTermuxAPI');
      
      if (result == true) {
        _updateStatus(ConnectionStatus(
          state: ConnectionState.connected,
          connectedAt: DateTime.now(),
        ));
      } else {
        throw Exception('Termux:API not installed');
      }
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
    _updateStatus(const ConnectionStatus(state: ConnectionState.disconnected));
  }

  @override
  Future<CommandResult> executeCommand(String command) async {
    try {
      final result = await platform.invokeMethod('executeCommand', {
        'command': command,
      });
      
      return CommandResult(
        success: result['exitCode'] == 0,
        output: result['output'] ?? '',
        error: result['error'],
        exitCode: result['exitCode'],
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
    try {
      final result = await platform.invokeMethod('readFile', {'path': path});
      return result as String;
    } catch (e) {
      throw Exception('Failed to read file: $e');
    }
  }

  @override
  Future<void> writeFile(String path, String content) async {
    try {
      await platform.invokeMethod('writeFile', {
        'path': path,
        'content': content,
      });
    } catch (e) {
      throw Exception('Failed to write file: $e');
    }
  }

  @override
  Future<List<String>> listFiles(String path) async {
    try {
      final result = await platform.invokeMethod('listFiles', {'path': path});
      return List<String>.from(result as List);
    } catch (e) {
      throw Exception('Failed to list files: $e');
    }
  }

  void dispose() {
    _statusController.close();
  }
}
