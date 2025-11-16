import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';

@injectable
class GetSessionById implements UseCase<Session, GetSessionByIdParams> {
  final SessionRepository _repository;

  GetSessionById(this._repository);

  @override
  Future<Session> call(GetSessionByIdParams params) async {
    return _repository.getSessionById(params.sessionId);
  }
}

class GetSessionByIdParams extends Equatable {
  final String sessionId;

  const GetSessionByIdParams({required this.sessionId});

  @override
  List<Object?> get props => [sessionId];
}