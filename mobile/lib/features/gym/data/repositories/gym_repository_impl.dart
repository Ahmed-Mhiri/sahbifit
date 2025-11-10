// Imports from external packages

// Imports from your project (using package-relative paths is safer)
import 'package:dartz/dartz.dart';
import 'package:sahbifit_mobile/core/errors/exceptions.dart';
import 'package:sahbifit_mobile/core/errors/failure.dart';
import 'package:sahbifit_mobile/features/gym/domain/entities/gym.dart';
import 'package:sahbifit_mobile/features/gym/domain/entities/gym_submission.dart';
import 'package:sahbifit_mobile/features/gym/domain/repositories/gym_repository.dart';
import 'package:sahbifit_mobile/features/gym/data/datasources/gym_remote_datasource.dart';
import 'package:sahbifit_mobile/features/gym/data/models/gym_submission_model.dart';

class GymRepositoryImpl implements GymRepository {
  final GymRemoteDataSource remoteDataSource;
  // You could add a localDataSource here for caching

  GymRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Gym>>> getApprovedGyms() async {
    try {
      // The remoteDataSource returns GymModel, but the
      // repository returns the domain entity Gym.
      
      // This line assumes that your `GymModel` class `extends` your `Gym` entity.
      // e.g. class GymModel extends Gym { ... }
      // If not, you must map the list:
      // final gymModels = await remoteDataSource.getApprovedGyms();
      // final List<Gym> gyms = gymModels.map((model) => model.toEntity()).toList();
      final List<Gym> gyms = await remoteDataSource.getApprovedGyms();
      
      return Right(gyms);

    } on ServerException {
      // --- FIX ---
      // You must provide an error message to ServerFailure.
      return Left(ServerFailure('Failed to fetch gyms from the server.'));
    }
  }

  @override
  Future<Either<Failure, void>> submitGym(GymSubmission submission) async {
    try {
      // Convert domain entity to data model for the request
      final submissionModel = GymSubmissionModel(
        name: submission.name,
        address: submission.address,
      );
      
      await remoteDataSource.submitGym(submissionModel);
      
      // Using const Right(null) for a 'void' success is perfectly fine.
      return const Right(null);

    } on ServerException {
      // --- FIX ---
      // You must provide an error message to ServerFailure.
      return Left(ServerFailure('Failed to submit gym. Please try again.'));
    }
  }
}