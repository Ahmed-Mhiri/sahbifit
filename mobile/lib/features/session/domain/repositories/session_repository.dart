// FILE: lib/features/session/domain/repositories/session_repository.dart
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/data/models/create_session_model.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

abstract class SessionRepository {
  Future<List<Session>> getActiveSessions(VerifiedGender? genderFilter);
  Future<Session> createSession(CreateSessionModel request);
  Future<void> joinSession(String sessionId);
  Future<void> leaveSession(String sessionId); // <--- ADDED
  Future<void> markAttendance(String sessionId, String userId, ParticipantStatus status);
  Future<Session> getSessionById(String sessionId);
  Future<List<SessionParticipant>> getSessionParticipants(String sessionId);
  Future<List<Session>> getMySessions();
}