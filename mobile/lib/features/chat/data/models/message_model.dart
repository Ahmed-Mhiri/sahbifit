import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit_mobile/features/chat/domain/entities/message.dart';
import 'package:sahbifit_mobile/features/user/domain/entities/user.dart'; // To get sender info

part 'message_model.freezed.dart';
part 'message_model.g.dart';

/// Helper function to convert Firestore Timestamp to DateTime
DateTime _timestampFromJson(dynamic json) => (json as Timestamp).toDate();

/// Helper function to convert DateTime to Firestore Timestamp
Timestamp _timestampToJson(DateTime date) => Timestamp.fromDate(date);

/// Data Transfer Object for a chat message from Firestore.
@freezed
class MessageModel with _$MessageModel {
  @JsonSerializable(
    createToJson: false, // We only need fromJson
    fieldRename: FieldRename.none,
  )
  const factory MessageModel({
    @JsonKey(includeFromJson: false) String? id, // Document ID
    required String senderId,
    required String senderName,
    required String text,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required DateTime timestamp,
  }) = _MessageModel;

  const MessageModel._(); // Private constructor for extensions

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  /// Creates a [MessageModel] from a Firestore document snapshot.
  factory MessageModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return MessageModel.fromJson(data).copyWith(id: snapshot.id);
  }

  /// Maps the Data-layer model to a Domain-layer entity.
  Message toDomain() {
    return Message(
      id: id ?? '',
      senderId: senderId,
      senderName: senderName,
      text: text,
      timestamp: timestamp,
    );
  }
}

/// DTO for creating a new message.
/// We use a simple Map to include FieldValue.serverTimestamp()
class CreateMessageModel {
  final String senderId;
  final String senderName;
  final String text;

  CreateMessageModel({
    required this.senderId,
    required this.senderName,
    required this.text,
  });

  /// Converts this DTO to a Map for Firestore.
  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'text': text,
      'timestamp':
          FieldValue.serverTimestamp(), // Automatically set by Firestore
    };
  }
}