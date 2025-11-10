import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit_mobile/features/gym/domain/entities/gym.dart'; // Stubbed
import 'package:sahbifit_mobile/features/session/domain/entities/enums/session_status.dart';
import 'package:sahbifit_mobile/features/session/domain/entities/enums/session_type.dart';
import 'package:sahbifit_mobile/features/user/domain/entities/user.dart'; // Stubbed
part 'session.freezed.dart';

/// Clean domain entity for a Session.
/// This is what the UI will consume.
@freezed
class Session with _$Session {
  const factory Session({
    required String sessionId,
    required User creator,
    required Gym gym,
    required SessionType sessionType,
    required SessionStatus status,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
    required int maxParticipants,
    required int participantCount,
    String? firestoreChatId,
    required bool isChatActive,
  }) = _Session;
}