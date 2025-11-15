import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/rating/domain/entities/pending_rating.dart';
import 'package:sahbifit/features/rating/domain/repositories/rating_repository.dart';

@injectable
class GetPendingRatings implements UseCase<List<PendingRating>, NoParams> {
  final RatingRepository _repository;

  GetPendingRatings(this._repository);

  @override
  Future<List<PendingRating>> call(NoParams params) async {
    return _repository.getPendingRatings();
  }
}
