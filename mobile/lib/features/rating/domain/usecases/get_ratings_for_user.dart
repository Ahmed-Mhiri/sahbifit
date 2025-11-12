import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/rating/domain/entities/rating.dart';
import 'package:sahbifit/features/rating/domain/repositories/rating_repository.dart';

@injectable
class GetRatingsForUser implements UseCase<List<Rating>, GetRatingsForUserParams> {
  final RatingRepository _repository;

  GetRatingsForUser(this._repository);

  @override
  Future<List<Rating>> call(GetRatingsForUserParams params) async {
    return _repository.getRatingsForUser(params.userId);
  }
}

class GetRatingsForUserParams extends Equatable {
  final String userId;

  const GetRatingsForUserParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}