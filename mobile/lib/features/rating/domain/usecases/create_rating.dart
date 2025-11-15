import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/rating/data/models/create_rating_model.dart';
import 'package:sahbifit/features/rating/domain/entities/rating.dart';
import 'package:sahbifit/features/rating/domain/repositories/rating_repository.dart';

@injectable
class CreateRating implements UseCase<Rating, CreateRatingParams> {
  final RatingRepository _repository;

  CreateRating(this._repository);

  @override
  Future<Rating> call(CreateRatingParams params) async {
    // Map from clean params to the data model
    final requestModel = CreateRatingModel(
      sessionId: params.sessionId,
      ratedUserId: params.ratedUserId,
      ratingValue: params.ratingValue,
      comment: params.comment,
    );
    return _repository.createRating(requestModel);
  }
}

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
