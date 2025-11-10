import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'repositories/tag_repository.dart';
import 'entities/tag.dart';
import 'enums/tag_type.dart';
// Assume a core usecase file exists
// import 'package:your_app/core/usecases/usecase.dart';
// Assume a core failure file exists
// import 'package:your_app/core/error/failure.dart';

// Placeholder for UseCase
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// The Usecase for getting tags by their type.
class GetTagsByType implements UseCase<List<Tag>, GetTagsParams> {
  final TagRepository repository;

  GetTagsByType(this.repository);

  @override
  Future<Either<Failure, List<Tag>>> call(GetTagsParams params) async {
    return await repository.getTagsByType(params.tagType);
  }
}

/// Parameters required by the [GetTagsByType] usecase.
class GetTagsParams extends Equatable {
  final TagType tagType;

  const GetTagsParams(this.tagType);

  @override
  List<Object?> get props => [tagType];
}