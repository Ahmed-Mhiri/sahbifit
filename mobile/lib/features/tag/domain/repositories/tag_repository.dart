import 'package:dartz/dartz.dart';
import 'entities/tag.dart';
import 'enums/tag_type.dart';
// Assume a core failure file exists
// import 'package:your_app/core/error/failure.dart';

// Placeholder for Failure classes
abstract class Failure {}
class ServerFailure extends Failure {}
class NetworkFailure extends Failure {}

/// The abstract repository (contract) for the tag feature.
abstract class TagRepository {
  /// Fetches a list of [Tag] entities filtered by [TagType].
  Future<Either<Failure, List<Tag>>> getTagsByType(TagType tagType);
}