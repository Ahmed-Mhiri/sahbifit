import 'package:dartz/dartz.dart';
import 'package:your_app_name/core/error/exception.dart';
import 'package:your_app_name/core/error/failure.dart';
import 'package:your_app_name/features/rating/data/datasources/rating_remote_datasource.dart';
import 'package:your_app_name/features/rating/data/models/create_rating_model.dart';
import 'package:your_app_name/features/rating/domain/entities/create_rating.dart';
import 'package:your_app_name/features/rating/domain/entities/pending_rating.dart';
import 'package:your_app_name/features/rating/domain/entities/rating.dart';
import 'package:your_app_name/features/rating/domain/repositories/rating_repository.dart';

class RatingRepositoryImpl implements RatingRepository {
  final RatingRemoteDatasource remoteDatasource;
  // final NetworkInfo networkInfo; // (Optional: for checking internet)

  RatingRepositoryImpl({
    required this.remoteDatasource,
    // required this.networkInfo,
  });

  @override
  Future<Either<Failure, Rating>> createRating(CreateRating createRating) async {
    // if (await networkInfo.isConnected) { // (Optional)
    try {
      final model = CreateRatingModel.fromEntity(createRating);
      final newRatingModel = await remoteDatasource.createRating(model);
      return Right(newRatingModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
    // } else {
    //   return Left(ServerFailure('No internet connection'));
    // }
  }

  @override
  Future<Either<Failure, List<Rating>>> getRatingsForUser(String userId) async {
    try {
      final ratingModels = await remoteDatasource.getRatingsForUser(userId);
      final ratings = ratingModels.map((model) => model.toEntity()).toList();
      return Right(ratings);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<PendingRating>>> getPendingRatings() async {
    try {
      final pendingModels = await remoteDatasource.getPendingRatings();
      final pendingRatings =
          pendingModels.map((model) => model.toEntity()).toList();
      return Right(pendingRatings);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}