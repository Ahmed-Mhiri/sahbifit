import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit_mobile/features/gym/data/models/gym_model.dart'; // Assuming you have this
import 'package:sahbifit_mobile/features/user/data/models/user_model.dart'; // Assuming you have this
import 'package:sahbifit_mobile/features/session/domain/entities/session.dart';

/// Data model for a [Session], mapping directly to the API response
/// and [Session.java] entity.
@freezed
class SessionModel with _$SessionModel {
  @JsonSerializable(
    createToJson: false, // We only need fromJson for receiving data
    fieldRename: FieldRename.none, // Java fields are already camelCase
  )
  const factory SessionModel({
    required String sessionId,
    required UserModel creator,
    required GymModel gym,
    required SessionType sessionType,
    required SessionStatus status,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
    required int maxParticipants,
    required int participantCount, // From the @Formula
    String? firestoreChatId,
    required bool isChatActive,
    required bool isChatProcessed,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}

// Extension to map the Data-layer model to a Domain-layer entity
extension SessionModelX on SessionModel {
  /// Maps the [SessionModel] (data layer) to a [Session] (domain layer) entity.
  Session toDomain() {
    return Session(
      sessionId: sessionId,
      // Map nested models to their domain entities
      creator: creator.toDomain(),
      gym: gym.toDomain(),
      sessionType: sessionType,
      status: status,
      title: title,
      startTime: startTime,
      endTime: endTime,
      maxParticipants: maxParticipants,
      participantCount: participantCount,
      firestoreChatId: firestoreChatId,
      isChatActive: isChatActive,
    );
  }
}