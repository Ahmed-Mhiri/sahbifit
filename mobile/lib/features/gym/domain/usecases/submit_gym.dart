import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahbifit_mobile/core/usecases/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/gym_submission.dart';
import '../repositories/gym_repository.dart';

class SubmitGym implements UseCase<void, SubmitGymParams> {
  final GymRepository repository;

  SubmitGym(this.repository);

  @override
  Future<Either<Failure, void>> call(SubmitGymParams params) async {
    final submission = GymSubmission(
      name: params.name,
      address: params.address,
    );
    return await repository.submitGym(submission);
  }
}

class SubmitGymParams extends Equatable {
  final String name;
  final String address;

  const SubmitGymParams({required this.name, required this.address});

  @override
  List<Object?> get props => [name, address];
}