import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/session/domain/repositories/session_repository.dart';

/// Use case for joining a session.
class JoinSession {
  final SessionRepository repository;

  JoinSession(this.repository);

  Future<Result<void>> call(String sessionId) async {
    return await repository.joinSession(sessionId);
  }
}