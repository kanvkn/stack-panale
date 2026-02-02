import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:re_editor/re_editor.dart';

final editorControllerProvider = Provider.family<CodeLineEditingController, String>((ref, content) {
  return CodeLineEditingController.fromText(content);
});

class CodeEditorWidget extends ConsumerStatefulWidget {
  final String filePath;
  final String initialContent;
  final Function(String)? onChanged;

  const CodeEditorWidget({
    super.key,
    required this.filePath,
    required this.initialContent,
    this.onChanged,
  });

  @override
  ConsumerState<CodeEditorWidget> createState() => _CodeEditorWidgetState();
}

class _CodeEditorWidgetState extends ConsumerState<CodeEditorWidget> {
  late CodeLineEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CodeLineEditingController.fromText(widget.initialContent);
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    widget.onChanged?.call(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return CodeEditor(
      controller: _controller,
      style: CodeEditorStyle(
        fontSize: 14,
        fontFamily: 'monospace',
        backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
        textColor: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF0F172A),
        selectionColor: isDark 
            ? const Color(0xFF6366F1).withValues(alpha: 0.3)
            : const Color(0xFF6366F1).withValues(alpha: 0.2),
      ),
      indicatorBuilder: (context, editingController, chunkController, notifier) {
        return Row(
          children: [
            DefaultCodeLineNumber(
              controller: editingController,
              notifier: notifier,
            ),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }
}
