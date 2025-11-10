import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/chat/domain/entities/message.dart';
import 'package:sahbifit_mobile/features/chat/domain/repositories/chat_repository.dart';

/// Use case for getting the chat message stream.
class GetChatStream {
  final ChatRepository repository;

  GetChatStream(this.repository);

  ResultStream<List<Message>> call(String sessionId) {
    return repository.getChatStream(sessionId);
  }
}