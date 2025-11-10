import 'package:sahbifit_mobile/features/session/data/models/create_session_model.dart';
import 'package:sahbifit_mobile/features/session/data/models/mark_attendance_model.dart';
import 'package:sahbifit_mobile/features/session/data/models/session_model.dart';
import 'package:sahbifit_mobile/features/verification/domain/enums/verified_gender_enum.dart';

/// Abstract interface for the session API.
/// This will be implemented using Dio or Http.
abstract class SessionRemoteDataSource {
  /// Corresponds to [GET /api/sessions]
  Future<List<SessionModel>> getActiveSessions(
      {VerifiedGender? genderFilter});

  /// Corresponds to [POST /api/sessions]
  Future<SessionModel> createSession(CreateSessionModel createSessionModel);

  /// Corresponds to [POST /api/sessions/{sessionId}/join]
  Future<void> joinSession(String sessionId);

  /// Corresponds to [PUT /api/sessions/attendance]
  Future<void> markAttendance(MarkAttendanceModel markAttendanceModel);
}

/*
// Example implementation using Dio (add to a different file)
class SessionRemoteDataSourceImpl implements SessionRemoteDataSource {
  final Dio dio;
  SessionRemoteDataSourceImpl(this.dio);

  @override
  Future<List<SessionModel>> getActiveSessions({VerifiedGender? genderFilter}) async {
    final Map<String, dynamic> queryParams = {};
    if (genderFilter != null) {
      queryParams['genderFilter'] = genderFilter.toJson();
    }
    
    final response = await dio.get(
      '/api/sessions',
      queryParameters: queryParams,
    );
    
    return (response.data as List)
        .map((json) => SessionModel.fromJson(json))
        .toList();
  }

  @override
  Future<SessionModel> createSession(CreateSessionModel createSessionModel) async {
    final response = await dio.post(
      '/api/sessions',
      data: createSessionModel.toJson(),
    );
    return SessionModel.fromJson(response.data);
  }

  @override
  Future<void> joinSession(String sessionId) async {
    await dio.post('/api/sessions/$sessionId/join');
  }

  @override
  Future<void> markAttendance(MarkAttendanceModel markAttendanceModel) async {
    await dio.put(
      '/api/sessions/attendance',
      data: markAttendanceModel.toJson(),
    );
  }
}
*/