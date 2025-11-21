import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/session/data/datasources/session_remote_datasource.dart';
import 'package:sahbifit/features/session/data/models/create_session_model.dart';
import 'package:sahbifit/features/session/data/models/mark_attendance_model.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart'; // --- ADDED ---
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

@Injectable(as: SessionRepository)
class SessionRepositoryImpl implements SessionRepository {
  final SessionRemoteDatasource _remoteDatasource;

  SessionRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<Session>> getActiveSessions(VerifiedGender? genderFilter) async {
    try {
      final sessionModels =
          await _remoteDatasource.getActiveSessions(genderFilter);
      return sessionModels.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<Session> getSessionById(String sessionId) async {
    try {
      final sessionModel = await _remoteDatasource.getSessionById(sessionId);
      return sessionModel.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<Session> createSession(CreateSessionModel request) async {
    try {
      final sessionModel = await _remoteDatasource.createSession(request);
      return sessionModel.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> joinSession(String sessionId) async {
    try {
      await _remoteDatasource.joinSession(sessionId);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> markAttendance(
      String sessionId, String userId, ParticipantStatus status) async {
    try {
      final requestModel = MarkAttendanceModel(
        sessionId: sessionId,
        participantUserId: userId,
        status: status,
      );
      await _remoteDatasource.markAttendance(requestModel);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  // --- ADDED ---
  @override
  // Note: Ensure the return type is Future<List<SessionParticipant>> matches the interface
  Future<List<SessionParticipant>> getSessionParticipants(String sessionId) async {
    try {
      // 1. Get models from Remote Data Source
      final models = await _remoteDatasource.getSessionParticipants(sessionId);
      
      // 2. Map to Entity, passing the sessionId manually
      return models.map((model) => model.toEntity(sessionId)).toList();
      
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<List<Session>> getMySessions() async {
    try {
      final sessionModels = await _remoteDatasource.getMySessions();
      return sessionModels.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> leaveSession(String sessionId) async {
    try {
      await _remoteDatasource.leaveSession(sessionId);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
}