import 'package:dartz/dartz.dart';
import 'package:sahbifit_mobile/core/usecases/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/gym.dart';
import '../repositories/gym_repository.dart';

class GetApprovedGyms implements UseCase<List<Gym>, NoParams> {
  final GymRepository repository;

  GetApprovedGyms(this.repository);

  @override
  Future<Either<Failure, List<Gym>>> call(NoParams params) async {
    return await repository.getApprovedGyms();
  }
}