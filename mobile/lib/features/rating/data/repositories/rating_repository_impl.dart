import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/rating/data/datasources/rating_remote_datasource.dart';
import 'package:sahbifit/features/rating/data/models/create_rating_model.dart';
import 'package:sahbifit/features/rating/domain/entities/pending_rating.dart';
import 'package:sahbifit/features/rating/domain/entities/rating.dart';
import 'package:sahbifit/features/rating/domain/repositories/rating_repository.dart';

@Injectable(as: RatingRepository)
class RatingRepositoryImpl implements RatingRepository {
  final RatingRemoteDatasource _remoteDatasource;

  RatingRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<PendingRating>> getPendingRatings() async {
    try {
      final models = await _remoteDatasource.getPendingRatings();
      return models.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
  
  @override
  Future<Rating> createRating(CreateRatingModel request) async {
    try {
      final model = await _remoteDatasource.createRating(request);
      return model.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<List<Rating>> getRatingsForUser(String userId) async {
     try {
      final models = await _remoteDatasource.getRatingsForUser(userId);
      return models.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
}