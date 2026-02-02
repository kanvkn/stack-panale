import 'dart:convert';
import 'package:dio/dio.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/nexor_repository.dart';

class QwenProvider implements AIProvider {
  final Dio _dio;
  final String? apiKey;
  final String baseUrl;

  QwenProvider({
    this.apiKey,
    this.baseUrl = 'https://dashscope.aliyuncs.com/api/v1',
  }) : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type': 'application/json',
            if (apiKey != null) 'Authorization': 'Bearer $apiKey',
          },
        ));

  @override
  String get name => 'Qwen';

  @override
  bool get isConfigured => apiKey != null && apiKey!.isNotEmpty;

  @override
  Future<Stream<String>> chat({
    required List<Message> messages,
    List<Tool>? tools,
    double temperature = 0.7,
    int maxTokens = 4096,
  }) async {
    if (!isConfigured) {
      throw Exception('Qwen API key not configured');
    }

    final response = await _dio.post(
      '/services/aigc/text-generation/generation',
      data: {
        'model': 'qwen-turbo',
        'input': {
          'messages': messages.map((m) => {
            'role': m.role.name,
            'content': m.content,
          }).toList(),
        },
        'parameters': {
          'temperature': temperature,
          'max_tokens': maxTokens,
          'stream': true,
        },
      },
      options: Options(
        responseType: ResponseType.stream,
      ),
    );

    final stream = (response.data as ResponseBody).stream;
    return stream
        .cast<List<int>>()
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .where((line) => line.startsWith('data:'))
        .map((line) {
          try {
            final json = jsonDecode(line.substring(5));
            return json['output']['text'] as String? ?? '';
          } catch (_) {
            return '';
          }
        });
  }
}
