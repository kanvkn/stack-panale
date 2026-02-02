import '../entities/message.dart';
import '../repositories/nexor_repository.dart';

class SendMessageUseCase {
  final NexorRepository repository;
  SendMessageUseCase(this.repository);
  
  Future<void> call(String chatId, Message message) async {
    await repository.addMessage(chatId, message);
  }
}

class CreateChatUseCase {
  final NexorRepository repository;
  CreateChatUseCase(this.repository);
  
  Future<Chat> call(String title) async {
    return await repository.createChat(title);
  }
}

class GetChatsUseCase {
  final NexorRepository repository;
  GetChatsUseCase(this.repository);
  
  Future<List<Chat>> call() async {
    return await repository.getChats();
  }
}
