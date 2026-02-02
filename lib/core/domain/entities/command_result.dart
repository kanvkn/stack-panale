import 'package:freezed_annotation/freezed_annotation.dart';

part 'command_result.freezed.dart';

@freezed
class CommandResult with _$CommandResult {
  const factory CommandResult({
    required bool success,
    required String output,
    String? error,
    int? exitCode,
  }) = _CommandResult;
}
