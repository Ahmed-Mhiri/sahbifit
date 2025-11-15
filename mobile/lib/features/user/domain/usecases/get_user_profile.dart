import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

@injectable
class GetUserProfile implements UseCase<User, GetUserProfileParams> {
  final UserRepository _repository;

  GetUserProfile(this._repository);

  @override
  Future<User> call(GetUserProfileParams params) async {
    return _repository.getUserProfile(params.userId);
  }
}

class GetUserProfileParams extends Equatable {
  final String userId;
  const GetUserProfileParams({required this.userId});
  @override
  List<Object?> get props => [userId];
}
