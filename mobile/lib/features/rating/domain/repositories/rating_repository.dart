import 'package:dartz/dartz.dart';
import 'package:your_app_name/core/error/failure.dart';
import 'package:your_app_name/features/rating/domain/entities/create_rating.dart';
import 'package:your_app_name/features/rating/domain/entities/pending_rating.dart';
import 'package:your_app_name/features/rating/domain/entities/rating.dart';

/// Abstract contract for the Rating feature
abstract class RatingRepository {
  /// Creates a new rating
  Future<Either<Failure, Rating>> createRating(CreateRating createRating);

  /// Gets all ratings *received* by a specific user
  Future<Either<Failure, List<Rating>>> getRatingsForUser(String userId);

  /// Gets all ratings the *current user* needs to submit
  Future<Either<Failure, List<PendingRating>>> getPendingRatings();
}