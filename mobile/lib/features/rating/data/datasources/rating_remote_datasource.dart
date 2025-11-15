import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/rating/data/models/create_rating_model.dart';
import 'package:sahbifit/features/rating/data/models/pending_rating_model.dart';
import 'package:sahbifit/features/rating/data/models/rating_model.dart';

abstract class RatingRemoteDatasource {
  Future<List<PendingRatingModel>> getPendingRatings();
  Future<RatingModel> createRating(CreateRatingModel request);
  Future<List<RatingModel>> getRatingsForUser(String userId);
}

@Injectable(as: RatingRemoteDatasource)
class RatingRemoteDatasourceImpl implements RatingRemoteDatasource {
  final ApiClient _apiClient;

  RatingRemoteDatasourceImpl(this._apiClient);

  @override
  Future<List<PendingRatingModel>> getPendingRatings() async {
    try {
      final response = await _apiClient.dio.get(ApiEndpoints.pendingRatings);
      return (response.data as List)
          .map((json) => PendingRatingModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<RatingModel> createRating(CreateRatingModel request) async {
    try {
      final response = await _apiClient.dio.post(
        ApiEndpoints.ratings,
        data: request.toJson(),
      );
      // Backend returns the full Rating object upon creation
      return RatingModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<List<RatingModel>> getRatingsForUser(String userId) async {
    try {
      final response = await _apiClient.dio.get(
        ApiEndpoints.ratingsForUser(userId),
      );
      return (response.data as List)
          .map((json) => RatingModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
