import 'package:dartz/dartz.dart';
import 'domain/entities/tag.dart';
import 'domain/enums/tag_type.dart';
import 'domain/repositories/tag_repository.dart';
import 'data/datasources/tag_remote_datasource.dart';
// Assume a core network_info file exists
// import 'package:your_app/core/network/network_info.dart';

// Placeholder for NetworkInfo
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class TagRepositoryImpl implements TagRepository {
  final TagRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TagRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Tag>>> getTagsByType(TagType tagType) async {
    if (await networkInfo.isConnected) {
      try {
        final tagModels = await remoteDataSource.getTagsByType(tagType);
        // Convert List<TagModel> to List<Tag>
        final tags = tagModels.map((model) => model.toEntity()).toList();
        return Right(tags);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}