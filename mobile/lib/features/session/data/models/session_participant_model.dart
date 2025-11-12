import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
import 'package:sahbifit/features/user/data/models/user_model.dart';

part 'session_participant_model.freezed.dart';
part 'session_participant_model.g.dart';

// This model maps to the backend's SessionParticipantId.java
@freezed
class SessionParticipantIdModel with _$SessionParticipantIdModel {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory SessionParticipantIdModel({
    required String sessionId,
    required String userId,
  }) = _SessionParticipantIdModel;

  factory SessionParticipantIdModel.fromJson(Map<String, dynamic> json) =>
      _$SessionParticipantIdModelFromJson(json);
}

// This model maps to the backend's SessionParticipant.java
@freezed
class SessionParticipantModel with _$SessionParticipantModel {
  const SessionParticipantModel._();

  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory SessionParticipantModel({
    required SessionParticipantIdModel id,
    required UserModel user, // The user who joined
    required ParticipantStatus status,
    required String joinedAt, // Received as ISO 8601 String
  }) = _SessionParticipantModel;

  factory SessionParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$SessionParticipantModelFromJson(json);

  // Converts the data model to the domain entity
  SessionParticipant toEntity() {
    return SessionParticipant(
      sessionId: id.sessionId,
      userId: id.userId,
      user: user.toEntity(),
      status: status,
      joinedAt: DateTime.parse(joinedAt),
    );
  }
}