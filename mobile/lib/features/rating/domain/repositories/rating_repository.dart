import 'package:sahbifit/features/rating/data/models/create_rating_model.dart';
import 'package:sahbifit/features/rating/domain/entities/pending_rating.dart';
import 'package:sahbifit/features/rating/domain/entities/rating.dart';

abstract class RatingRepository {
  Future<List<PendingRating>> getPendingRatings();
  Future<Rating> createRating(CreateRatingModel request);
  Future<List<Rating>> getRatingsForUser(String userId);
}