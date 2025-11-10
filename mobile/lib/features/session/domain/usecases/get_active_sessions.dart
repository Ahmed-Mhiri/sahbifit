import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/session/domain/entities/session.dart';
import 'package:sahbifit_mobile/features/session/domain/repositories/session_repository.dart';
import 'package:sahbifit_mobile/features/verification/domain/enums/verified_gender_enum.dart';

/// Use case for getting the active session feed.
class GetActiveSessions {
  final SessionRepository repository;

  GetActiveSessions(this.repository);

  Future<Result<List<Session>>> call(GetActiveSessionsParams params) async {
    return await repository.getActiveSessions(
        genderFilter: params.genderFilter);
  }
}

class GetActiveSessionsParams {
  final VerifiedGender? genderFilter;
  const GetActiveSessionsParams({this.genderFilter});
}