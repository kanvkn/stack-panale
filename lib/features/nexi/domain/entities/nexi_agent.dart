import 'package:freezed_annotation/freezed_annotation.dart';

part 'nexi_agent.freezed.dart';

enum NexiCategory { development, analysis, testing, documentation, other }

@freezed
class NexiConfig with _$NexiConfig {
  const factory NexiConfig({
    required String id,
    required String name,
    required String description,
    required String icon,
    required String color,
    required String gradient,
    required NexiCategory category,
    required String version,
    String? author,
  }) = _NexiConfig;
}

@freezed
class NexiAgent with _$NexiAgent {
  const factory NexiAgent({
    required NexiConfig config,
    required List<String> tools,
    required String systemPrompt,
    String? welcomeMessage,
    String? placeholderText,
    List<String>? capabilities,
  }) = _NexiAgent;
}
