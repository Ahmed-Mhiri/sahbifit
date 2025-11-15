import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/gym/data/datasources/gym_remote_datasource.dart';
import 'package:sahbifit/features/gym/data/models/gym_submission_model.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/domain/entities/gym_submission.dart'; 
import 'package:sahbifit/features/gym/domain/repositories/gym_repository.dart';

@Injectable(as: GymRepository)
class GymRepositoryImpl implements GymRepository {
  final GymRemoteDatasource _remoteDatasource;

  GymRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<Gym>> getApprovedGyms() async {
    try {
      // 
      // 💡 THIS IS THE CORRECTED LINE:
      //
      final gymModels = await _remoteDatasource.getApprovedGyms();
      //
      //
      return gymModels.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> submitGym(GymSubmission submission) async {
    try {
      final requestModel = GymSubmissionModel(
        name: submission.name,
        address: submission.address,
      );
      await _remoteDatasource.submitGym(requestModel);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
}
