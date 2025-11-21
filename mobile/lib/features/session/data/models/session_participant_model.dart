import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
import 'package:sahbifit/features/user/data/models/user_summary_model.dart'; // Changed from UserModel

part 'session_participant_model.freezed.dart';
part 'session_participant_model.g.dart';

@freezed
abstract class SessionParticipantModel with _$SessionParticipantModel {
  const SessionParticipantModel._();

  const factory SessionParticipantModel({
    // Removed 'id' field - it is not in the API response
    required UserSummaryModel user, // Changed from UserModel to UserSummaryModel
    required ParticipantStatus status,
    required String joinedAt,
  }) = _SessionParticipantModel;

  factory SessionParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$SessionParticipantModelFromJson(json);

  // We must pass sessionId here because it's not in the JSON object
  SessionParticipant toEntity(String sessionId) {
    return SessionParticipant(
      sessionId: sessionId,
      userId: user.userId, // Get ID from the user object
      user: user.toEntity(), // Convert Summary to User Entity
      status: status,
      joinedAt: DateTime.parse(joinedAt),
    );
  }
}