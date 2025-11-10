import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahbifit/core/error/failure.dart';
import 'package:sahbifit/core/usecase/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

class GetUserProfile implements UseCase<User, GetUserProfileParams> {
  final UserRepository repository;

  GetUserProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(GetUserProfileParams params) async {
    return await repository.getUserProfile(params.userId);
  }
}

class GetUserProfileParams extends Equatable {
  final String userId;

  const GetUserProfileParams({required this.userId});

  @override
  List<Object> get props => [userId];
}