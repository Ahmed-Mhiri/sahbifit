import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';

@injectable
class MarkAttendance implements UseCase<void, MarkAttendanceParams> {
  final SessionRepository _repository;

  MarkAttendance(this._repository);

  @override
  Future<void> call(MarkAttendanceParams params) async {
    return _repository.markAttendance(
      params.sessionId,
      params.userId,
      params.status,
    );
  }
}

class MarkAttendanceParams extends Equatable {
  final String sessionId;
  final String userId;
  final ParticipantStatus status;

  const MarkAttendanceParams({
    required this.sessionId,
    required this.userId,
    required this.status,
  });

  @override
  List<Object?> get props => [sessionId, userId, status];
}