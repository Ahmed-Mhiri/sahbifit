import 'package:dartz/dartz.dart';
import 'package:your_app_name/core/error/failure.dart';
import 'package:your_app_name/core/usecase/usecase.dart';
import 'package:your_app_name/features/rating/domain/entities/rating.dart';
import 'package:your_app_name/features/rating/domain/repositories/rating_repository.dart';

/// Use Case for getting all ratings a specific user has received
class GetRatingsForUser implements UseCase<List<Rating>, GetRatingsForUserParams> {
  final RatingRepository repository;

  GetRatingsForUser(this.repository);

  @override
  Future<Either<Failure, List<Rating>>> call(
      GetRatingsForUserParams params) async {
    return await repository.getRatingsForUser(params.userId);
  }
}

class GetRatingsForUserParams extends Equatable {
  final String userId;
  const GetRatingsForUserParams({required this.userId});
  @override
  List<Object> get props => [userId];
}