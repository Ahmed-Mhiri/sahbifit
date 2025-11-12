import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

@injectable
class UpdateFcmToken implements UseCase<void, UpdateFcmTokenParams> {
  final UserRepository _repository;

  UpdateFcmToken(this._repository);

  @override
  Future<void> call(UpdateFcmTokenParams params) async {
    return _repository.updateFcmToken(params.token);
  }
}

class UpdateFcmTokenParams extends Equatable {
  final String token;
  const UpdateFcmTokenParams({required this.token});
  @override
  List<Object?> get props => [token];
}