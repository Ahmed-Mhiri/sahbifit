import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahbifit/core/error/failure.dart';
import 'package:sahbifit/core/usecase/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

class UpdateProfileVisibility
    implements UseCase<void, UpdateProfileVisibilityParams> {
  final UserRepository repository;

  UpdateProfileVisibility(this.repository);

  @override
  Future<Either<Failure, void>> call(
      UpdateProfileVisibilityParams params) async {
    return await repository.updateProfileVisibility(params.visibility);
  }
}

class UpdateProfileVisibilityParams extends Equatable {
  final ProfileVisibility visibility;

  const UpdateProfileVisibilityParams({required this.visibility});

  @override
  List<Object> get props => [visibility];
}