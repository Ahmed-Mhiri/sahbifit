import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
// Usecase import removed
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';

@injectable
class GetParticipantsStream { // 'implements UseCase' removed
  final SessionRepository _repository;

  GetParticipantsStream(this._repository);

  // '@override' removed
  Stream<List<SessionParticipant>> call(GetParticipantsStreamParams params) {
    return _repository.getParticipantsStream(params.sessionId);
  }
}

class GetParticipantsStreamParams extends Equatable {
  final String sessionId;

  const GetParticipantsStreamParams({required this.sessionId});

  @override
  List<Object?> get props => [sessionId];
}