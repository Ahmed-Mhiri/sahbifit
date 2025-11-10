import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahbifit/core/error/failure.dart';
import 'package:sahbifit/core/usecase/usecase.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

class BlockUser implements UseCase<void, BlockUserParams> {
  final UserRepository repository;

  BlockUser(this.repository);

  @override
  Future<Either<Failure, void>> call(BlockUserParams params) async {
    return await repository.blockUser(params.userId);
  }
}

class BlockUserParams extends Equatable {
  final String userId;

  const BlockUserParams({required this.userId});

  @override
  List<Object> get props => [userId];
}