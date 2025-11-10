import 'package:dartz/dartz.dart';
import 'package:sahbifit/core/error/failure.dart';
import 'package:sahbifit/core/usecase/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

class GetMyProfile implements UseCase<User, NoParams> {
  final UserRepository repository;

  GetMyProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getMyProfile();
  }
}