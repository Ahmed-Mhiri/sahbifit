import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahbifit/core/error/failure.dart';
import 'package:sahbifit/core/usecase/usecase.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

class UpdateFcmToken implements UseCase<void, UpdateFcmTokenParams> {
  final UserRepository repository;

  UpdateFcmToken(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateFcmTokenParams params) async {
    return await repository.updateFcmToken(params.token);
  }
}

class UpdateFcmTokenParams extends Equatable {
  final String token;

  const UpdateFcmTokenParams({required this.token});

  @override
  List<Object> get props => [token];
}