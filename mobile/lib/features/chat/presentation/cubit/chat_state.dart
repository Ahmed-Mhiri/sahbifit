part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  /// Chat has not been initialized or connected.
  const factory ChatState.initial() = _Initial;

  /// Connecting to the chat stream.
  const factory ChatState.loading() = _Loading;

  /// Successfully connected and listening for messages.
  const factory ChatState.loaded({required List<Message> messages}) = _Loaded;

  /// An error occurred (either connecting or sending a message).
  const factory ChatState.error(String message) = _Error;
}