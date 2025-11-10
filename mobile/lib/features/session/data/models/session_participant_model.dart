import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit_mobile/features/user/data/models/user_model.dart'; // Assuming you have this
import 'package:sahbifit_mobile/features/session/domain/entities/session_participant.dart';


/// Data model for a [SessionParticipant], mapping to [SessionParticipant.java].
/// This model is likely nested within a full session details response.
@freezed
class SessionParticipantModel with _$SessionParticipantModel {
  @JsonSerializable(
    createToJson: false, // We only need fromJson
    fieldRename: FieldRename.none,
  )
  const factory SessionParticipantModel({
    required UserModel user,
    required ParticipantStatus status,
  }) = _SessionParticipantModel;

  factory SessionParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$SessionParticipantModelFromJson(json);
}

// Extension to map the Data-layer model to a Domain-layer entity
extension SessionParticipantModelX on SessionParticipantModel {
  /// Maps the [SessionParticipantModel] (data) to a [SessionParticipant] (domain).
  /// This flattens the nested user object to match the UI's needs.
  SessionParticipant toDomain() {
    return SessionParticipant(
      id: user.userId,
      name: user.firstName, // Or user.fullName if you have it
      avatarUrl: user.avatarUrl,
      isVerified: user.isVerified,
      status: status,
    );
  }
}