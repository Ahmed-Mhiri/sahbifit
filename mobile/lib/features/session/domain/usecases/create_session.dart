import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/session/data/models/create_session_model.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';

@injectable
class CreateSession implements UseCase<Session, CreateSessionParams> {
  final SessionRepository _repository;

  CreateSession(this._repository);

  @override
  Future<Session> call(CreateSessionParams params) async {
    // Map from clean params to the data model
    final requestModel = CreateSessionModel(
      gymId: params.gymId,
      sessionType: params.sessionType,
      title: params.title,
      startTime: params.startTime.toIso8601String(), // Convert DateTime to String
      endTime: params.endTime.toIso8601String(),     // Convert DateTime to String
      maxParticipants: params.maxParticipants,
    );
    return _repository.createSession(requestModel);
  }
}

class CreateSessionParams extends Equatable {
  final String gymId;
  final SessionType sessionType;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final int maxParticipants;

  const CreateSessionParams({
    required this.gymId,
    required this.sessionType,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.maxParticipants,
  });

  @override
  List<Object?> get props => [
        gymId,
        sessionType,
        title,
        startTime,
        endTime,
        maxParticipants,
      ];
}