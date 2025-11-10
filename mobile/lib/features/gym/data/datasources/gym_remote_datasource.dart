import 'package:dio/dio.dart'; // Assuming you use Dio for HTTP
import 'package:sahbifit_mobile/features/gym/data/models/gym_model.dart';
import 'package:sahbifit_mobile/features/gym/data/models/gym_submission_model.dart';
import 'package:sahbifit_mobile/core/errors/exceptions.dart';
abstract class GymRemoteDataSource {
  /// Calls the GET /api/gyms endpoint.
  /// Throws a [ServerException] for all error codes.
  Future<List<GymModel>> getApprovedGyms();

  /// Calls the POST /api/gyms/submit endpoint.
  /// Throws a [ServerException] for all error codes.
  Future<void> submitGym(GymSubmissionModel submissionModel);
}

class GymRemoteDataSourceImpl implements GymRemoteDataSource {
  final Dio dio;

  GymRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<GymModel>> getApprovedGyms() async {
    try {
      // This path matches GymController's @GetMapping("/gyms")
      final response = await dio.get('/api/gyms');

      if (response.statusCode == 200) {
        final List<dynamic> gymsJson = response.data as List;
        return gymsJson
            .map((json) => GymModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> submitGym(GymSubmissionModel submissionModel) async {
    try {
      // This path matches GymController's @PostMapping("/gyms/submit")
      final response = await dio.post(
        '/api/gyms/submit',
        data: submissionModel.toJson(),
      );

      // HttpStatus.CREATED is 201
      if (response.statusCode != 201) {
        throw ServerException();
      }
      // No return value needed, as per controller's ResponseEntity<Gym>
      // We just care that it succeeded.
    } catch (e) {
      throw ServerException();
    }
  }
}