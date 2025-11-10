import 'package:dartz/dartz.dart';
import 'package:sahbifit_mobile/features/gym/domain/entities/gym.dart';
import 'package:sahbifit_mobile/features/gym/domain/entities/gym_submission.dart';

import '../../../../../core/errors/failure.dart'; // Custom failure class


abstract class GymRepository {
  // Returns a list of approved Gyms for the picker
  Future<Either<Failure, List<Gym>>> getApprovedGyms();
  
  // Submits a new gym for review (MVP 7.5)
  Future<Either<Failure, void>> submitGym(GymSubmission submission);
}