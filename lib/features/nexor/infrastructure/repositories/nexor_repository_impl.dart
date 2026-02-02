import 'package:uuid/uuid.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/nexor_repository.dart';

class NexorRepositoryImpl implements NexorRepository {
  final List<Chat> _chats = [];
  final _uuid = const Uuid();

  @override
  Future<Chat> createChat(String title) async {
    final chat = Chat(
      id: _uuid.v4(),
      title: title,
      messages: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _chats.add(chat);
    return chat;
  }

  @override
  Future<List<Chat>> getChats() async {
    return List.from(_chats);
  }

  @override
  Future<Chat?> getChat(String id) async {
    try {
      return _chats.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> updateChat(Chat chat) async {
    final index = _chats.indexWhere((c) => c.id == chat.id);
    if (index != -1) {
      _chats[index] = chat.copyWith(updatedAt: DateTime.now());
    }
  }

  @override
  Future<void> deleteChat(String id) async {
    _chats.removeWhere((c) => c.id == id);
  }

  @override
  Future<void> addMessage(String chatId, Message message) async {
    final chat = await getChat(chatId);
    if (chat != null) {
      final updatedChat = chat.copyWith(
        messages: [...chat.messages, message],
        updatedAt: DateTime.now(),
      );
      await updateChat(updatedChat);
    }
  }
}
