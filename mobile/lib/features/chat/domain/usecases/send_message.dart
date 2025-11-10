import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/chat/domain/repositories/chat_repository.dart';
import 'package:sahbifit_mobile/features/user/domain/entities/user.dart';

/// Use case for sending a message.
class SendMessage {
  final ChatRepository repository;

  SendMessage(this.repository);

  Future<Result<void>> call(SendMessageParams params) async {
    return await repository.sendMessage(
      sessionId: params.sessionId,
      text: params.text,
      sender: params.sender,
    );
  }
}

class SendMessageParams {
  final String sessionId;
  final String text;
  final User sender;

  SendMessageParams({
    required this.sessionId,
    required this.text,
    required this.sender,
  });
}