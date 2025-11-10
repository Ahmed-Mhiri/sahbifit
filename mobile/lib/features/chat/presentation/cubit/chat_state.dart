import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit_mobile/features/chat/domain/entities/message.dart';

part 'chat_state.freezed.dart';

/// State for the Chat UI.
@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.success(List<Message> messages) = _Success;
  const factory ChatState.error(String message) = _Error;
}