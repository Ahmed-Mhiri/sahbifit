import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/domain/repositories/gym_repository.dart';

@injectable
class GetApprovedGyms implements UseCase<List<Gym>, NoParams> {
  final GymRepository _repository;

  GetApprovedGyms(this._repository);

  @override
  Future<List<Gym>> call(NoParams params) async {
    return _repository.getApprovedGyms();
  }
}
