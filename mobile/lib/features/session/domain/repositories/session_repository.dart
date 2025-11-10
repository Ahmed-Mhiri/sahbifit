import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/session/data/models/create_session_model.dart';
import 'package:sahbifit_mobile/features/session/data/models/mark_attendance_model.dart';
import 'package:sahbifit_mobile/features/session/domain/entities/session.dart';
import 'package:sahbifit_mobile/features/verification/domain/enums/verified_gender_enum.dart';

/// Abstract repository interface for the Domain layer.
/// Defines *what* can be done, not *how*.
abstract class SessionRepository {
  /// Get the list of active sessions for the feed.
  Future<Result<List<Session>>> getActiveSessions(
      {VerifiedGender? genderFilter});

  /// Create a new session.
  Future<Result<Session>> createSession(CreateSessionModel createSessionModel);

  /// Join an existing session.
  Future<Result<void>> joinSession(String sessionId);

  /// Mark a participant's attendance.
  Future<Result<void>> markAttendance(MarkAttendanceModel markAttendanceModel);
}