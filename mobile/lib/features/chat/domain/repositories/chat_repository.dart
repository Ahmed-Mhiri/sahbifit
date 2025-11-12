import 'package:sahbifit/features/chat/domain/entities/message.dart';

abstract class ChatRepository {
  Stream<List<Message>> getChatStream(String sessionId);
  Future<void> sendMessage({
    required String sessionId,
    required String senderId,
    required String text,
  });
}