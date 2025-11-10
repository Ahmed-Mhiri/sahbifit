import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

/// Clean domain entity for a Chat Message.
@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String senderId,
    required String senderName,
    required String text,
    required DateTime timestamp,
  }) = _Message;
}