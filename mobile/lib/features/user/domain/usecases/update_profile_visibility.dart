import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

@injectable
class UpdateProfileVisibility implements UseCase<void, UpdateProfileVisibilityParams> {
  final UserRepository _repository;

  UpdateProfileVisibility(this._repository);

  @override
  Future<void> call(UpdateProfileVisibilityParams params) async {
    return _repository.updateProfileVisibility(params.visibility);
  }
}

class UpdateProfileVisibilityParams extends Equatable {
  final ProfileVisibility visibility;
  const UpdateProfileVisibilityParams({required this.visibility});
  @override
  List<Object?> get props => [visibility];
}
