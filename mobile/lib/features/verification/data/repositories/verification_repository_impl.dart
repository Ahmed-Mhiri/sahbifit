
import 'package:sahbifit_mobile/features/verification/data/datasources/verification_remote_datasource.dart';
import 'package:sahbifit_mobile/features/verification/data/models/verification_status_model.dart';

import '../../domain/repositories/verification_repository.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  final VerificationRemoteDataSource remoteDataSource;

  VerificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<VerificationStatusModel> getVerificationStatus() async {
    // Add try/catch for error handling
    try {
      return await remoteDataSource.getVerificationStatus();
    } catch (e) {
      // Re-throw a domain-specific error
      throw Exception('Failed to get verification status: $e');
    }
  }

  @override
  Future<String> submitVerificationVideo(String videoPath) async {
    // Add try/catch for error handling
    try {
      return await remoteDataSource.submitVerificationVideo(videoPath);
    } catch (e) {
      // Re-throw a domain-specific error
      throw Exception('Failed to submit video: $e');
    }
  }
}