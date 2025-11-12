import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String messageId;
  final String senderId;
  final String text;
  final DateTime timestamp;

  const Message({
    required this.messageId,
    required this.senderId,
    required this.text,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [messageId, senderId, text, timestamp];
}