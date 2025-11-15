import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/file/data/models/file_upload_response_model.dart';
import 'package:path/path.dart' as p;

abstract class FileRemoteDatasource {
  Future<String> uploadImage(File file);
}

@Injectable(as: FileRemoteDatasource)
class FileRemoteDatasourceImpl implements FileRemoteDatasource {
  final ApiClient _apiClient;

  FileRemoteDatasourceImpl(this._apiClient);

  @override
  Future<String> uploadImage(File file) async {
    try {
      String fileName = p.basename(file.path);
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      final response = await _apiClient.dio.post(
        // 💡 CHANGED: Using the constant from ApiEndpoints
        ApiEndpoints.uploadImage, 
        data: formData,
      );

      final responseModel = FileUploadResponseModel.fromJson(response.data);
      return responseModel.url;
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}