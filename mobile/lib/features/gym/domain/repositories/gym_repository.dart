import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/domain/entities/gym_submission.dart'; // Import entity

abstract class GymRepository {
  Future<List<Gym>> getApprovedGyms();
  
  // ---
  // 💡 1. YOUR FIX: Change signature to accept the entity
  // ---
  Future<void> submitGym(GymSubmission submission);
}