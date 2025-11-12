import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

@injectable
class GetMyProfile implements UseCase<User, NoParams> {
  final UserRepository _repository;

  GetMyProfile(this._repository);

  @override
  Future<User> call(NoParams params) async {
    return _repository.getMyProfile();
  }
}