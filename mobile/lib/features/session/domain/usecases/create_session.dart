import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/session/data/models/create_session_model.dart';
import 'package:sahbifit_mobile/features/session/domain/entities/session.dart';
import 'package:sahbifit_mobile/features/session/domain/repositories/session_repository.dart';

/// Use case for creating a session.
class CreateSession {
  final SessionRepository repository;

  CreateSession(this.repository);

  Future<Result<Session>> call(CreateSessionModel params) async {
    return await repository.createSession(params);
  }
}