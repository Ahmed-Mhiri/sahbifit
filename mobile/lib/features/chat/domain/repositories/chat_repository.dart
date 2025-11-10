import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/chat/domain/entities/message.dart';
import 'package:sahbifit_mobile/features/user/domain/entities/user.dart';

/// Abstract repository interface for the Chat domain.
abstract class ChatRepository {
  /// Get a stream of messages for a session.
  ResultStream<List<Message>> getChatStream(String sessionId);

  /// Send a message to a session's chat.
  Future<Result<void>> sendMessage({
    required String sessionId,
    required String text,
    required User sender,
  });
}