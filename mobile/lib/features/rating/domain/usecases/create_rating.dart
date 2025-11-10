import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:your_app_name/core/error/failure.dart';
import 'package:your_app_name/core/usecase/usecase.dart';
import 'package:your_app_name/features/rating/domain/entities/rating.dart';
import 'package:your_app_name/features/rating/domain/repositories/rating_repository.dart';

/// Use Case for creating a rating
class CreateRating implements UseCase<Rating, CreateRatingParams> {
  final RatingRepository repository;

  CreateRating(this.repository);

  @override
  Future<Either<Failure, Rating>> call(CreateRatingParams params) async {
    return await repository.createRating(params);
  }
}

/// Parameters object for the [CreateRating] use case
class CreateRatingParams extends Equatable {
  final String sessionId;
  final String ratedUserId;
  final int ratingValue;
  final String? comment;

  const CreateRatingParams({
    required this.sessionId,
    required this.ratedUserId,
    required this.ratingValue,
    this.comment,
  });

  @override
  List<Object?> get props => [sessionId, ratedUserId, ratingValue, comment];
}