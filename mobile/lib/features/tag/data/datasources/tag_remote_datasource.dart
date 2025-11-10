import 'package:dio/dio.dart';
import 'tag_model.dart';
import '../domain/enums/tag_type.dart';
// Assume a core exception file exists
// import 'package:your_app/core/error/exception.dart'; 

// Placeholder for custom exception
class ServerException implements Exception {}

abstract class TagRemoteDataSource {
  /// Calls the GET /api/tags?type={tagType} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TagModel>> getTagsByType(TagType tagType);
}

class TagRemoteDataSourceImpl implements TagRemoteDataSource {
  final Dio dio;
  final String _endpoint = '/api/tags';

  TagRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TagModel>> getTagsByType(TagType tagType) async {
    try {
      final response = await dio.get(
        _endpoint,
        queryParameters: {
          'type': tagType.name, // e.g., 'goal' or 'schedule'
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data as List;
        return jsonList.map((json) => TagModel.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}