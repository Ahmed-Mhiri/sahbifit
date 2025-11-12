import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/gym/data/models/gym_model.dart'; // We'll re-use the GymModel
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/enums/session_status.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
import 'package:sahbifit/features/user/data/models/user_model.dart'; // We'll re-use the UserModel

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
class SessionModel with _$SessionModel {
  const SessionModel._(); // Private constructor for methods

  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory SessionModel({
    required String sessionId,
    required String title,
    required SessionType sessionType,
    required SessionStatus status,
    required String startTime, // Receive as ISO 8601 String
    required String endTime,   // Receive as ISO 8601 String
    required int maxParticipants,
    required int participantCount,
    required UserModel creator, // Nested JSON object
    required GymModel gym,       // Nested JSON object
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  // Converts the data-layer model to a domain-layer entity
  Session toEntity() {
    return Session(
      sessionId: sessionId,
      title: title,
      sessionType: sessionType,
      status: status,
      startTime: DateTime.parse(startTime), // Convert String to DateTime
      endTime: DateTime.parse(endTime),     // Convert String to DateTime
      maxParticipants: maxParticipants,
      participantCount: participantCount,
      creator: creator.toEntity(), // Convert nested model to entity
      gym: gym.toEntity(),         // Convert nested model to entity
    );
  }
}