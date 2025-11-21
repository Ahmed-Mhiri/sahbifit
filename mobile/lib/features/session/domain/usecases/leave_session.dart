import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';

@injectable
class LeaveSession implements UseCase<void, LeaveSessionParams> {
  final SessionRepository _repository;

  LeaveSession(this._repository);

  @override
  Future<void> call(LeaveSessionParams params) async {
    return _repository.leaveSession(params.sessionId);
  }
}

class LeaveSessionParams extends Equatable {
  final String sessionId;

  const LeaveSessionParams({required this.sessionId});

  @override
  List<Object?> get props => [sessionId];
}