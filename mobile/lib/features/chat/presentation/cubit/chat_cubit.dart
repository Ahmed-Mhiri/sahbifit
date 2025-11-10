import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit_mobile/features/chat/domain/usecases/get_chat_stream.dart';
import 'package:sahbifit_mobile/features/chat/domain/usecases/send_message.dart';
import 'package:sahbifit_mobile/features/chat/presentation/cubit/chat_state.dart';
import 'package:sahbifit_mobile/features/user/domain/entities/user.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetChatStream _getChatStream;
  final SendMessage _sendMessage;
  final User _currentUser; // Passed in from the AppBloc

  StreamSubscription? _chatSubscription;

  ChatCubit({
    required GetChatStream getChatStream,
    required SendMessage sendMessage,
    required User currentUser,
  })  : _getChatStream = getChatStream,
        _sendMessage = sendMessage,
        _currentUser = currentUser,
        super(const ChatState.initial());

  /// Starts listening to the message stream for the given session.
  void loadMessages(String sessionId) {
    emit(const ChatState.loading());
    _chatSubscription?.cancel();
    _chatSubscription = _getChatStream(sessionId).listen(
      (result) {
        result.fold(
          (failure) => emit(ChatState.error(failure.message)),
          (messages) => emit(ChatState.success(messages)),
        );
      },
      onError: (error) {
        emit(ChatState.error(error.toString()));
      },
    );
  }

  /// Sends a new message.
  Future<void> sendMessage(String sessionId, String text) async {
    final params = SendMessageParams(
      sessionId: sessionId,
      text: text,
      sender: _currentUser,
    );

    // We don't need to emit a new state, the stream will do it.
    // We can handle the error case if we want to show a toast, etc.
    final result = await _sendMessage(params);
    result.fold(
      (failure) {
        // Optional: emit a temporary error state or show a snackbar
        print("Failed to send message: ${failure.message}");
      },
      (success) {
        // Message sent, stream will update the UI
      },
    );
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }
}