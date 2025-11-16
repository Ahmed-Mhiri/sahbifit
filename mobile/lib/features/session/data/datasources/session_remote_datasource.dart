import 'package:sahbifit/features/session/data/models/create_session_model.dart';
import 'package:sahbifit/features/session/data/models/mark_attendance_model.dart';
import 'package:sahbifit/features/session/data/models/session_model.dart';
// --- ADD THIS IMPORT ---
import 'package:sahbifit/features/session/data/models/session_participant_model.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

abstract class SessionRemoteDatasource {
  Future<List<SessionModel>> getActiveSessions(VerifiedGender? genderFilter);
  Future<SessionModel> createSession(CreateSessionModel request);
  Future<void> joinSession(String sessionId);
  Future<void> markAttendance(MarkAttendanceModel request);
  Future<SessionModel> getSessionById(String sessionId);

  // --- ADD THIS LINE ---
  Stream<List<SessionParticipantModel>> getParticipantsStream(String sessionId);
}