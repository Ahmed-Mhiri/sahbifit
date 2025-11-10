import 'package:equatable/equatable.dart';

/// Domain Entity for a completed Rating
class Rating extends Equatable {
  final String ratingId;
  final String sessionId;
  final String ratedByUserId;
  final String ratedByUserName;
  final String ratedForUserId;
  final String ratedForUserName;
  final int ratingValue;
  final String? comment;
  final DateTime createdAt;

  const Rating({
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

  @override
  List<Object?> get props => [
        ratingId,
        sessionId,
        ratedByUserId,
        ratedForUserId,
        ratingValue,
        comment,
        createdAt
      ];
}