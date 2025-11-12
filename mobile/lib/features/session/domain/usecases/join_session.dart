import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';

@injectable
class JoinSession implements UseCase<void, JoinSessionParams> {
  final SessionRepository _repository;

  JoinSession(this._repository);

  @override
  Future<void> call(JoinSessionParams params) async {
    return _repository.joinSession(params.sessionId);
  }
}

class JoinSessionParams extends Equatable {
  final String sessionId;

  const JoinSessionParams({required this.sessionId});

  @override
  List<Object?> get props => [sessionId];
}