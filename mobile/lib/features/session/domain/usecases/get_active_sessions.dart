import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

@injectable
class GetActiveSessions implements UseCase<List<Session>, GetActiveSessionsParams> {
  final SessionRepository _repository;

  GetActiveSessions(this._repository);

  @override
  Future<List<Session>> call(GetActiveSessionsParams params) async {
    return _repository.getActiveSessions(params.genderFilter);
  }
}

class GetActiveSessionsParams extends Equatable {
  final VerifiedGender? genderFilter;

  const GetActiveSessionsParams({this.genderFilter});

  @override
  List<Object?> get props => [genderFilter];
}