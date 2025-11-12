import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/tag/data/models/tag_model.dart';
import 'package:sahbifit/features/tag/domain/entities/tag_type.dart';

abstract class TagRemoteDatasource {
  Future<List<TagModel>> getTagsByType(TagType type);
}

@Injectable(as: TagRemoteDatasource)
class TagRemoteDatasourceImpl implements TagRemoteDatasource {
  final ApiClient _apiClient;

  TagRemoteDatasourceImpl(this._apiClient);

  @override
  Future<List<TagModel>> getTagsByType(TagType type) async {
    try {
      final response = await _apiClient.dio.get(
        ApiEndpoints.tags,
        queryParameters: {
          'type': type.name, // Sends ?type=goal or ?type=schedule
        },
      );

      // Convert the List<dynamic> from JSON to List<TagModel>
      return (response.data as List)
          .map((json) => TagModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}