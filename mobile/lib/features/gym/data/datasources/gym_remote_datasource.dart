import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart'; // <-- IMPORT
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/gym/data/models/gym_model.dart';
import 'package:sahbifit/features/gym/data/models/gym_submission_model.dart';

abstract class GymRemoteDatasource {
  /// Calls the GET /gyms endpoint
  Future<List<GymModel>> getApprovedGyms();

  /// Calls the POST /gyms/submit endpoint
  Future<void> submitGym(GymSubmissionModel request);
}

@Injectable(as: GymRemoteDatasource)
class GymRemoteDatasourceImpl implements GymRemoteDatasource {
  final ApiClient _apiClient;

  GymRemoteDatasourceImpl(this._apiClient);

  @override
  Future<List<GymModel>> getApprovedGyms() async {
    try {
      final response = await _apiClient.dio.get(ApiEndpoints.gyms); // <-- USE CONSTANT

      // The response.data is a List<dynamic> of JSON maps
      // We must convert it into a List<GymModel>
      return (response.data as List)
          .map((json) => GymModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> submitGym(GymSubmissionModel request) async {
    try {
      await _apiClient.dio.post(
        ApiEndpoints.submitGym, // <-- USE CONSTANT
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
