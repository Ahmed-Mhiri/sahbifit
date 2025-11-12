import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/tag/data/datasources/tag_remote_datasource.dart';
import 'package:sahbifit/features/tag/domain/entities/tag.dart';
import 'package:sahbifit/features/tag/domain/entities/tag_type.dart';
import 'package:sahbifit/features/tag/domain/repositories/tag_repository.dart';

@Injectable(as: TagRepository)
class TagRepositoryImpl implements TagRepository {
  final TagRemoteDatasource _remoteDatasource;

  TagRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<Tag>> getTagsByType(TagType type) async {
    try {
      final tagModels = await _remoteDatasource.getTagsByType(type);
      // Map List<TagModel> to List<Tag>
      return tagModels.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
}