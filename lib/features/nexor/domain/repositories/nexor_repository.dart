import '../entities/message.dart';

abstract class AIProvider {
  Future<Stream<String>> chat({
    required List<Message> messages,
    List<Tool>? tools,
    double temperature = 0.7,
    int maxTokens = 4096,
  });
  
  String get name;
  bool get isConfigured;
}

abstract class NexorRepository {
  Future<Chat> createChat(String title);
  Future<List<Chat>> getChats();
  Future<Chat?> getChat(String id);
  Future<void> updateChat(Chat chat);
  Future<void> deleteChat(String id);
  Future<void> addMessage(String chatId, Message message);
}
