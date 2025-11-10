import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart'; // Assuming you use Dio
import 'package:sahbifit_mobile/core/errors/failure.dart';
import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/session/data/datasources/session_remote_datasource.dart';
import 'package:sahbifit_mobile/features/session/data/models/create_session_model.dart';
import 'package:sahbifit_mobile/features/session/data/models/mark_attendance_model.dart';
import 'package:sahbifit_mobile/features/session/data/models/session_model.dart';
import 'package:sahbifit_mobile/features/session/domain/entities/session.dart';
import 'package:sahbifit_mobile/features/session/domain/repositories/session_repository.dart';
import 'package:sahbifit_mobile/features/verification/domain/enums/verified_gender_enum.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionRemoteDataSource remoteDataSource;

  SessionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<List<Session>>> getActiveSessions(
      {VerifiedGender? genderFilter}) async {
    try {
      final sessionModels =
          await remoteDataSource.getActiveSessions(genderFilter: genderFilter);
      // Map from Data Models to Domain Entities
      final sessions = sessionModels.map((model) => model.toDomain()).toList();
      return Right(sessions);
    } on DioException catch (e) {
      // Handle API errors
      return Left(ServerFailure(e.message ?? 'Failed to fetch sessions'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<Session>> createSession(
      CreateSessionModel createSessionModel) async {
    try {
      final sessionModel =
          await remoteDataSource.createSession(createSessionModel);
      // Map from Data Model to Domain Entity
      return Right(sessionModel.toDomain());
    } on DioException catch (e) {
      // Handle specific backend errors (like "IllegalStateException")
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        // You can parse the error response from Spring Boot
        final errorMessage =
            e.response?.data['message'] ?? 'Failed to create session.';
        return Left(ServerFailure(errorMessage));
      }
      return Left(ServerFailure(e.message ?? 'Failed to create session'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> joinSession(String sessionId) async {
    try {
      await remoteDataSource.joinSession(sessionId);
      return const Right(null);
    } on DioException catch (e) {
      // Handle specific backend errors
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage =
            e.response?.data['message'] ?? 'Failed to join session.';
        return Left(ServerFailure(errorMessage));
      }
      return Left(ServerFailure(e.message ?? 'Failed to join session'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> markAttendance(
      MarkAttendanceModel markAttendanceModel) async {
    try {
      await remoteDataSource.markAttendance(markAttendanceModel);
      return const Right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Left(ServerFailure('You are not allowed to mark attendance.'));
      }
      return Left(ServerFailure(e.message ?? 'Failed to mark attendance'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}