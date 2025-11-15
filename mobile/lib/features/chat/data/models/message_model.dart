import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/chat/domain/entities/message.dart'; // Ensure this path is correct

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const MessageModel._();

  @JsonSerializable( // <-- MOVED HERE
    fieldRename: FieldRename.snake,
    converters: [TimestampConverter()],
    explicitToJson: true,
  )
  const factory MessageModel({
    String? id,
    required String senderId,
    required String text,
    // When reading, 'timestamp' will be a Timestamp.
    // When writing, this will be null and replaced by toFirestore
    required DateTime? timestamp,
  }) = _MessageModel;

  /// Special factory for creating a model to *send* to Firestore
  /// This sets the timestamp to null, so we can use a server timestamp.
  factory MessageModel.forSending({
    required String senderId,
    required String text,
  }) =>
      MessageModel(
        senderId: senderId,
        text: text,
        timestamp: null, // Will be replaced by server timestamp
      );

  /// Factory for creating a model from a Firestore snapshot
  factory MessageModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    // Use the generated fromJson factory, then add the doc ID
    return MessageModel.fromJson(data).copyWith(id: doc.id);
  }

  /// Factory for creating a model from a JSON map (required by freezed)
  // <-- Annotation removed from here
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  /// Converts this model into a Map to *write* to Firestore
  Map<String, dynamic> toFirestore() {
    // toJson() will now exist thanks to the .fromJson factory being added
    // and build_runner being run.
    final json = toJson();

    // Replace our null timestamp with the server's command
    json['timestamp'] = FieldValue.serverTimestamp();

    // Don't write the 'id' field back into the document data
    json.remove('id');

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
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json is Timestamp) {
      return json.toDate();
    }
    // Handle cases where it might already be null
    if (json == null) {
      return null;
    }
    // You could add more robust parsing here if needed, e.g., from String
    return null;
  }

  @override
  Object toJson(DateTime? time) {
    // If a time is provided, convert it to a Timestamp
    if (time != null) {
      return Timestamp.fromDate(time);
    }
    // If time is null, we intend to use a server timestamp.
    // The `toFirestore` method handles this explicitly, but setting
    // it here ensures consistency if toJson() were called directly.
    return FieldValue.serverTimestamp();
  }
}