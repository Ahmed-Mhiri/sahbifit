import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart'; 
import 'package:sahbifit/features/chat/domain/entities/message.dart';
import 'package:sahbifit/features/chat/domain/repositories/chat_repository.dart';

@injectable
class GetChatStream implements UseCase<Stream<List<Message>>, ChatStreamParams> {
  final ChatRepository _repository;

  GetChatStream(this._repository);

  //
  // 💡 THIS IS THE FIX:
  // 1. Add 'async'
  // 2. Change the return type to 'Future<Stream<List<Message>>>'
  //
  @override
  Future<Stream<List<Message>>> call(ChatStreamParams params) async {
    // By making the function 'async' and returning the stream,
    // Dart automatically wraps the stream in a Future,
    // which satisfies the UseCase contract.
    return _repository.getChatStream(params.sessionId);
  }
}

class ChatStreamParams extends Equatable {
  final String sessionId;

  const ChatStreamParams({required this.sessionId});

  @override
  List<Object?> get props => [sessionId];
}
