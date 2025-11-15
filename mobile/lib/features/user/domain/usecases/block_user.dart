import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

@injectable
class BlockUser implements UseCase<void, BlockUserParams> {
  final UserRepository _repository;

  BlockUser(this._repository);

  @override
  Future<void> call(BlockUserParams params) async {
    return _repository.blockUser(params.userId);
  }
}

class BlockUserParams extends Equatable {
  final String userId;
  const BlockUserParams({required this.userId});
  @override
  List<Object?> get props => [userId];
}
