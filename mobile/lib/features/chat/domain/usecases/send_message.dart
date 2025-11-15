import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/chat/domain/repositories/chat_repository.dart';

@injectable
class SendMessage implements UseCase<void, SendMessageParams> {
  final ChatRepository _repository;

  SendMessage(this._repository);

  @override
  Future<void> call(SendMessageParams params) async {
    return _repository.sendMessage(
      sessionId: params.sessionId,
      senderId: params.senderId,
      text: params.text,
    );
  }
}

class SendMessageParams extends Equatable {
  final String sessionId;
  final String senderId; // The ID of the currently logged-in user
  final String text;

  const SendMessageParams({
    required this.sessionId,
    required this.senderId,
    required this.text,
  });

  @override
  List<Object?> get props => [sessionId, senderId, text];
}
