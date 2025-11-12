import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/chat/domain/entities/message.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

// Helper function to convert Firestore Timestamp to DateTime
DateTime _timestampFromFirestore(Timestamp timestamp) => timestamp.toDate();
// Helper function to convert DateTime to Firestore Timestamp
Timestamp _timestampToFirestore(DateTime time) => Timestamp.fromDate(time);
// Helper function to handle server-side timestamps for writing
FieldValue _serverTimestamp() => FieldValue.serverTimestamp();

@freezed
class MessageModel with _$MessageModel {
  const MessageModel._();

  @JsonSerializable(
    fieldRename: FieldRename.snake, // Firestore often uses snake_case
    converters: [TimestampConverter()], // Use our custom converter
  )
  const factory MessageModel({
    @JsonKey(ignore: true) String? id, // We'll get the ID from the doc snapshot
    required String senderId,
    required String text,
    // When reading, 'timestamp' will be a Timestamp.
    // When writing, we'll set this to null so the server generates it.
    required DateTime? timestamp, 
  }) = _MessageModel;

  /// Special factory for creating a model to *send* to Firestore
  /// This sets the timestamp to null, so we can use a server timestamp.
  factory MessageModel.forSending({
    required String senderId,
    required String text,
  }) => MessageModel(
    senderId: senderId,
    text: text,
    timestamp: null, // Will be replaced by server timestamp
  );

  /// Factory for creating a model from a Firestore snapshot
  factory MessageModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel.fromJson(data).copyWith(id: doc.id);
  }

  /// Converts this model into a Map to *write* to Firestore
  Map<String, dynamic> toFirestore() {
    final json = toJson();
    // Replace our null timestamp with the server's command
    json['timestamp'] = FieldValue.serverTimestamp(); 
    json.remove('id'); // Don't write the ID back into the document
    return json;
  }

  // Converts the data-layer model to a domain-layer entity
  Message toEntity() {
    return Message(
      messageId: id ?? '', // Use the ID from the snapshot
      senderId: senderId,
      text: text,
      timestamp: timestamp ?? DateTime.now(), // Fallback if timestamp is null
    );
  }
}

// This is the custom converter for handling Firestore Timestamps
class TimestampConverter implements JsonConverter<DateTime?, Object> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object json) {
    if (json is Timestamp) {
      return json.toDate();
    }
    return null;
  }

  @override
  Object toJson(DateTime? time) {
    // When sending, we send a ServerTimestamp command, not the time itself
    // The `toFirestore` method handles this logic.
    return time ?? FieldValue.serverTimestamp();
  }
}