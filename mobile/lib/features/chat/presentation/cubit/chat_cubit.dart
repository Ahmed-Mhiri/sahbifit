import 'dart:async'; // Required for StreamSubscription

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/chat/domain/entities/message.dart';
import 'package:sahbifit/features/chat/domain/usecases/get_chat_stream.dart';
import 'package:sahbifit/features/chat/domain/usecases/send_message.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final GetChatStream _getChatStream;
  final SendMessage _sendMessage;

  // This subscription needs to be stored so we can cancel it later.
  StreamSubscription<List<Message>>? _messageSubscription;

  ChatCubit(
    this._getChatStream,
    this._sendMessage,
  ) : super(const ChatState.initial());

  /// Connects to the real-time message stream for a specific session.
  Future<void> listenToChat(String sessionId) async {
    // Cancel any previous subscription before starting a new one
    await _messageSubscription?.cancel();
    emit(const ChatState.loading());

    try {
      // 1. Call the use case to get the stream
      final messageStream = await _getChatStream(
        ChatStreamParams(sessionId: sessionId),
      );

      // 2. Listen to the stream
      _messageSubscription = messageStream.listen(
        (messages) {
          // 3. Every time new data comes in, emit a 'loaded' state
          emit(ChatState.loaded(messages: messages));
        },
        onError: (error) {
          // 4. Handle any errors that occur on the stream
          emit(ChatState.error(error.toString()));
        },
      );
    } on ServerFailure catch (e) {
      emit(ChatState.error(e.message));
    } catch (e) {
      emit(ChatState.error(e.toString()));
    }
  }

  /// Sends a new chat message.
  Future<void> sendMessage({
    required String sessionId,
    required String senderId, // This should be the ID of the logged-in user
    required String text,
  }) async {
    // Don't emit a loading state here.
    // The UI will update optimistically when the stream listener
    // receives the new message from Firestore.
    try {
      final params = SendMessageParams(
        sessionId: sessionId,
        senderId: senderId,
        text: text,
      );
      await _sendMessage(params);
      // On success, do nothing. The stream listener will update the state.
    } on ServerFailure catch (e) {
      // If sending fails, emit an error state
      emit(ChatState.error(e.message));
    } catch (e) {
      emit(ChatState.error(e.toString()));
    }
  }

  /// Overrides the [close] method to cancel the stream subscription
  /// when the Cubit is disposed. This is CRITICAL to prevent memory leaks.
  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    return super.close();
  }
}
