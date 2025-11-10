import 'package:dartz/dartz.dart';
import 'package:your_app_name/core/error/failure.dart';
import 'package:your_app_name/core/usecase/usecase.dart';
import 'package:your_app_name/features/rating/domain/entities/pending_rating.dart';
import 'package:your_app_name/features/rating/domain/repositories/rating_repository.dart';

/// Use Case for getting the current user's pending ratings
class GetPendingRatings implements UseCase<List<PendingRating>, NoParams> {
  final RatingRepository repository;

  GetPendingRatings(this.repository);

  @override
  Future<Either<Failure, List<PendingRating>>> call(NoParams params) async {
    return await repository.getPendingRatings();
  }
}