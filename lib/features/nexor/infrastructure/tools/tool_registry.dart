import '../../domain/entities/message.dart';
import '../../domain/repositories/nexor_repository.dart';
import '../../../../core/domain/repositories/connection_provider.dart';

class ToolRegistry {
  static final Map<String, Future<ToolResult> Function(Map<String, dynamic>, ConnectionProvider?)> _tools = {};

  static void register(
    String name,
    Future<ToolResult> Function(Map<String, dynamic>, ConnectionProvider?) handler,
  ) {
    _tools[name] = handler;
  }

  static Future<ToolResult> execute(
    String name,
    Map<String, dynamic> params,
    ConnectionProvider? provider,
  ) async {
    final handler = _tools[name];
    if (handler == null) {
      return ToolResult(
        toolCallId: '',
        success: false,
        result: '',
        error: 'Tool not found: $name',
      );
    }

    try {
      return await handler(params, provider);
    } catch (e) {
      return ToolResult(
        toolCallId: '',
        success: false,
        result: '',
        error: e.toString(),
      );
    }
  }

  static List<Tool> getAvailableTools() {
    return [
      const Tool(
        id: 'read_file',
        name: 'read_file',
        description: 'Read content of a file',
        parameters: {'path': 'string'},
      ),
      const Tool(
        id: 'list_files',
        name: 'list_files',
        description: 'List files in a directory',
        parameters: {'path': 'string'},
      ),
      const Tool(
        id: 'write_file',
        name: 'write_file',
        description: 'Write content to a file',
        parameters: {'path': 'string', 'content': 'string'},
      ),
      const Tool(
        id: 'execute_command',
        name: 'execute_command',
        description: 'Execute a shell command',
        parameters: {'command': 'string'},
      ),
    ];
  }
}

// Register default tools
void registerDefaultTools() {
  ToolRegistry.register('read_file', (params, provider) async {
    if (provider == null) throw Exception('No connection');
    final path = params['path'] as String;
    final content = await provider.readFile(path);
    return ToolResult(
      toolCallId: '',
      success: true,
      result: content,
    );
  });

  ToolRegistry.register('list_files', (params, provider) async {
    if (provider == null) throw Exception('No connection');
    final path = params['path'] as String;
    final files = await provider.listFiles(path);
    return ToolResult(
      toolCallId: '',
      success: true,
      result: files.join('\n'),
    );
  });

  ToolRegistry.register('write_file', (params, provider) async {
    if (provider == null) throw Exception('No connection');
    final path = params['path'] as String;
    final content = params['content'] as String;
    await provider.writeFile(path, content);
    return ToolResult(
      toolCallId: '',
      success: true,
      result: 'File written successfully',
    );
  });

  ToolRegistry.register('execute_command', (params, provider) async {
    if (provider == null) throw Exception('No connection');
    final command = params['command'] as String;
    final result = await provider.executeCommand(command);
    return ToolResult(
      toolCallId: '',
      success: result.success,
      result: result.output,
      error: result.error,
    );
  });
}
