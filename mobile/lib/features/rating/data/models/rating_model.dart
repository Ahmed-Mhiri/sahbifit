import 'package:your_app_name/features/rating/domain/entities/rating.dart';

/// DTO Model for GET /api/ratings/*
/// Mirrors backend Rating.java entity
class RatingModel {
  final String ratingId;
  final String sessionId; // Assuming session is flattened
  final String ratedByUserId; // Assuming user is flattened
  final String ratedByUserName;
  final String ratedForUserId; // Assuming user is flattened
  final String ratedForUserName;
  final int ratingValue;
  final String? comment;
  final DateTime createdAt;

  RatingModel({
    required this.ratingId,
    required this.sessionId,
    required this.ratedByUserId,
    required this.ratedByUserName,
    required this.ratedForUserId,
    required this.ratedForUserName,
    required this.ratingValue,
    this.comment,
    required this.createdAt,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    // This assumes the backend serializes the nested User/Session objects
    // You MUST adjust this to match your actual JSON response
    return RatingModel(
      ratingId: json['ratingId'],
      sessionId: json['session']['sessionId'], // Assumed nesting
      ratedByUserId: json['ratingBy']['userId'], // Assumed nesting
      ratedByUserName: json['ratingBy']['firstName'], // Assumed nesting
      ratedForUserId: json['ratingFor']['userId'], // Assumed nesting
      ratedForUserName: json['ratingFor']['firstName'], // Assumed nesting
      ratingValue: (json['ratingValue'] as num).toInt(),
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  /// Converts this DTO model to a clean domain [Rating] entity
  Rating toEntity() {
    return Rating(
      ratingId: ratingId,
      sessionId: sessionId,
      ratedByUserId: ratedByUserId,
      ratedByUserName: ratedByUserName,
      ratedForUserId: ratedForUserId,
      ratedForUserName: ratedForUserName,
      ratingValue: ratingValue,
      comment: comment,
      createdAt: createdAt,
    );
  }
}