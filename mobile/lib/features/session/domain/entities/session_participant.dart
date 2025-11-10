import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit_mobile/features/session/domain/entities/enums/participant_status.dart';


/// Clean domain entity for a SessionParticipant.
/// This is flattened for the UI, as seen in [SessionParticipantList].
@freezed
class SessionParticipant with _$SessionParticipant {
  const factory SessionParticipant({
    required String id, // This is the User's ID
    required String name,
    String? avatarUrl,
    required bool isVerified,
    required ParticipantStatus status,
  }) = _SessionParticipant;
}

// Helper extension for the UI
extension ParticipantStatusX on ParticipantStatus {
  String get displayName {
    switch (this) {
      case ParticipantStatus.joined:
        return 'Joined';
      case ParticipantStatus.attended:
        return 'Attended';
      case ParticipantStatus.noShow:
        return 'No Show';
      case ParticipantStatus.left:
        return 'Left';
    }
  }
}