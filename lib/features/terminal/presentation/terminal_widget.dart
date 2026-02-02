import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xterm/xterm.dart';
import '../../setup/presentation/connection_provider.dart';

class TerminalWidget extends ConsumerStatefulWidget {
  const TerminalWidget({super.key});

  @override
  ConsumerState<TerminalWidget> createState() => _TerminalWidgetState();
}

class _TerminalWidgetState extends ConsumerState<TerminalWidget> {
  late Terminal _terminal;
  final _inputBuffer = StringBuffer();

  @override
  void initState() {
    super.initState();
    _terminal = Terminal(
      maxLines: 10000,
    );
    
    _terminal.write('Stack Mobile Terminal\r\n');
    _terminal.write('Type commands and press Enter\r\n\r\n');
    _terminal.write('\$ ');

    _terminal.onOutput = (data) {
      _handleInput(data);
    };
  }

  void _handleInput(String data) async {
    final provider = ref.read(connectionProvider.notifier).provider;
    if (provider == null) return;

    for (var char in data.runes) {
      if (char == 13) { // Enter
        _terminal.write('\r\n');
        final command = _inputBuffer.toString();
        _inputBuffer.clear();
        
        if (command.isNotEmpty) {
          try {
            final result = await provider.executeCommand(command);
            _terminal.write(result.output);
            if (result.error != null) {
              _terminal.write('\r\n${result.error}');
            }
          } catch (e) {
            _terminal.write('\r\nError: $e');
          }
        }
        _terminal.write('\r\n\$ ');
      } else if (char == 127) { // Backspace
        if (_inputBuffer.isNotEmpty) {
          _inputBuffer.write(String.fromCharCode(char));
        }
      } else {
        _inputBuffer.write(String.fromCharCode(char));
      }
    }
  }

  @override
  void dispose() {
    _terminal.onOutput = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: const Center(
        child: Text('Terminal - Coming Soon'),
      ),
    );
  }
}
