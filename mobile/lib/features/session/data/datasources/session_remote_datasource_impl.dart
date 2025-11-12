import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/session/data/datasources/session_remote_datasource.dart';
import 'package:sahbifit/features/session/data/models/create_session_model.dart';
import 'package:sahbifit/features/session/data/models/mark_attendance_model.dart';
import 'package:sahbifit/features/session/data/models/session_model.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

@Injectable(as: SessionRemoteDatasource)
class SessionRemoteDatasourceImpl implements SessionRemoteDatasource {
  final ApiClient _apiClient;

  SessionRemoteDatasourceImpl(this._apiClient);

  @override
  Future<List<SessionModel>> getActiveSessions(VerifiedGender? genderFilter) async {
    try {
      final Map<String, dynamic> queryParams = {};
      if (genderFilter != null) {
        queryParams['genderFilter'] = genderFilter.name;
      }

      final response = await _apiClient.dio.get(
        ApiEndpoints.sessions,
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );

      return (response.data as List)
          .map((json) => SessionModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<SessionModel> createSession(CreateSessionModel request) async {
    try {
      final response = await _apiClient.dio.post(
        ApiEndpoints.createSession,
        data: request.toJson(),
      );
      // Backend returns the created session
      return SessionModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> joinSession(String sessionId) async {
    try {
      await _apiClient.dio.post(
        ApiEndpoints.joinSession(sessionId), // Use function for dynamic URL
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> markAttendance(MarkAttendanceModel request) async {
    try {
      await _apiClient.dio.put(
        ApiEndpoints.markAttendance,
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}