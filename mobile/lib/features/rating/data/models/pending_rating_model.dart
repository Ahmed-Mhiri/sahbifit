import 'package:your_app_name/features/rating/domain/entities/pending_rating.dart';

/// DTO Model for GET /api/ratings/pending
/// Mirrors backend PendingRatingDto.java
class PendingRatingModel {
  final String sessionId;
  final String sessionTitle;
  final String userIdToRate;
  final String userNameToRate;

  PendingRatingModel({
    required this.sessionId,
    required this.sessionTitle,
    required this.userIdToRate,
    required this.userNameToRate,
  });

  factory PendingRatingModel.fromJson(Map<String, dynamic> json) {
    return PendingRatingModel(
      sessionId: json['sessionId'],
      sessionTitle: json['sessionTitle'],
      userIdToRate: json['userIdToRate'],
      userNameToRate: json['userNameToRate'],
    );
  }

  /// Converts this DTO model to a clean domain [PendingRating] entity
  PendingRating toEntity() {
    return PendingRating(
      sessionId: sessionId,
      sessionTitle: sessionTitle,
      userIdToRate: userIdToRate,
      userNameToRate: userNameToRate,
    );
  }
}