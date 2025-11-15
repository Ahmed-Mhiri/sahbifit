import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

@injectable
class GetMyBlockedUsers implements UseCase<List<User>, NoParams> {
  final UserRepository _repository;

  GetMyBlockedUsers(this._repository);

  @override
  Future<List<User>> call(NoParams params) async {
    return _repository.getMyBlockedUsers();
  }
}