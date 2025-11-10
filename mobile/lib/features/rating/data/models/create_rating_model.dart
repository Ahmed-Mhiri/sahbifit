import 'package:your_app_name/features/rating/domain/entities/create_rating.dart';

/// DTO Model for POST /api/ratings
/// Mirrors backend CreateRatingDto.java
class CreateRatingModel {
  final String sessionId;
  final String ratedUserId;
  final int ratingValue;
  final String? comment;

  CreateRatingModel({
    required this.sessionId,
    required this.ratedUserId,
    required this.ratingValue,
    this.comment,
  });

  /// Creates a Model from a domain [CreateRating] entity
  factory CreateRatingModel.fromEntity(CreateRating entity) {
    return CreateRatingModel(
      sessionId: entity.sessionId,
      ratedUserId: entity.ratedUserId,
      ratingValue: entity.ratingValue,
      comment: entity.comment,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'ratedUserId': ratedUserId,
      'ratingValue': ratingValue,
      'comment': comment,
    };
  }
}