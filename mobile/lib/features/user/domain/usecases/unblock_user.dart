import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

@injectable
class UnblockUser implements UseCase<void, UnblockUserParams> {
  final UserRepository _repository;

  UnblockUser(this._repository);

  @override
  Future<void> call(UnblockUserParams params) async {
    return _repository.unblockUser(params.userId);
  }
}

class UnblockUserParams extends Equatable {
  final String userId;
  const UnblockUserParams({required this.userId});
  @override
  List<Object?> get props => [userId];
}