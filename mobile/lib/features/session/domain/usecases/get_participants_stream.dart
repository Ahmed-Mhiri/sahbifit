import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart'; // Import UseCase interface
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';

@injectable
class GetSessionParticipants implements UseCase<List<SessionParticipant>, GetSessionParticipantsParams> {
  final SessionRepository _repository;

  GetSessionParticipants(this._repository);

  @override
  Future<List<SessionParticipant>> call(GetSessionParticipantsParams params) {
    return _repository.getSessionParticipants(params.sessionId);
  }
}

class GetSessionParticipantsParams extends Equatable {
  final String sessionId;

  const GetSessionParticipantsParams({required this.sessionId});

  @override
  List<Object?> get props => [sessionId];
}