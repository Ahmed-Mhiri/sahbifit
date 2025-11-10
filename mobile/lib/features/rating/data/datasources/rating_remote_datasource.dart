import 'package:dio/dio.dart';
import 'package:your_app_name/features/rating/data/models/create_rating_model.dart';
import 'package:your_app_name/features/rating/data/models/pending_rating_model.dart';
import 'package:your_app_name/features/rating/data/models/rating_model.dart';
// (You'll need to define this exception helper)
import 'package:your_app_name/core/error/exception.dart'; 

abstract class RatingRemoteDatasource {
  /// Calls the POST /api/ratings endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<RatingModel> createRating(CreateRatingModel createRatingModel);

  /// Calls the GET /api/ratings/user/{userId} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<RatingModel>> getRatingsForUser(String userId);

  /// Calls the GET /api/ratings/pending endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PendingRatingModel>> getPendingRatings();
}

class RatingRemoteDatasourceImpl implements RatingRemoteDatasource {
  final Dio dio;

  RatingRemoteDatasourceImpl({required this.dio});

  @override
  Future<RatingModel> createRating(CreateRatingModel createRatingModel) async {
    try {
      final response = await dio.post(
        '/api/ratings',
        data: createRatingModel.toJson(),
      );
      if (response.statusCode == 201) {
        return RatingModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to create rating');
      }
    } on DioError catch (e) {
      // Handle Dio errors (e.g., 400, 401, 404, 500)
      throw ServerException(e.message ?? 'Unknown server error');
    }
  }

  @override
  Future<List<RatingModel>> getRatingsForUser(String userId) async {
    try {
      final response = await dio.get('/api/ratings/user/$userId');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => RatingModel.fromJson(json))
            .toList();
      } else {
        throw ServerException('Failed to get ratings');
      }
    } on DioError catch (e) {
      throw ServerException(e.message ?? 'Unknown server error');
    }
  }

  @override
  Future<List<PendingRatingModel>> getPendingRatings() async {
    try {
      final response = await dio.get('/api/ratings/pending');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => PendingRatingModel.fromJson(json))
            .toList();
      } else {
        throw ServerException('Failed to get pending ratings');
      }
    } on DioError catch (e) {
      throw ServerException(e.message ?? 'Unknown server error');
    }
  }
}