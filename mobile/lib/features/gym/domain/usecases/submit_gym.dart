import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/gym/domain/entities/gym_submission.dart';
import 'package:sahbifit/features/gym/domain/repositories/gym_repository.dart';

@injectable
class SubmitGym implements UseCase<void, GymSubmission> {
  final GymRepository _repository;

  SubmitGym(this._repository);

  // ---
  // 💡 3. YOUR FIX: The call is now much simpler
  // ---
  @override
  Future<void> call(GymSubmission params) async {
    return _repository.submitGym(params);
  }
}