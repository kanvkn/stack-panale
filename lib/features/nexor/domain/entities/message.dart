import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

enum MessageRole { user, assistant, system, tool }

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required MessageRole role,
    required String content,
    DateTime? timestamp,
    String? toolCallId,
    Map<String, dynamic>? metadata,
  }) = _Message;
}

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String id,
    required String title,
    required List<Message> messages,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Chat;
}

@freezed
class Tool with _$Tool {
  const factory Tool({
    required String id,
    required String name,
    required String description,
    required Map<String, dynamic> parameters,
  }) = _Tool;
}

@freezed
class ToolCall with _$ToolCall {
  const factory ToolCall({
    required String id,
    required String toolName,
    required Map<String, dynamic> parameters,
  }) = _ToolCall;
}

@freezed
class ToolResult with _$ToolResult {
  const factory ToolResult({
    required String toolCallId,
    required bool success,
    required String result,
    String? error,
  }) = _ToolResult;
}
