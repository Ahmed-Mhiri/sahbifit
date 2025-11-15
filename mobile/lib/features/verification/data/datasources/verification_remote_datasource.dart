import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/verification/data/models/verification_status_model.dart';
import 'package:path/path.dart' as p;

abstract class VerificationRemoteDatasource {
  Future<VerificationStatusModel> getVerificationStatus();
  Future<void> submitVerificationVideo(File video);
}

@Injectable(as: VerificationRemoteDatasource)
class VerificationRemoteDatasourceImpl implements VerificationRemoteDatasource {
  final ApiClient _apiClient;

  VerificationRemoteDatasourceImpl(this._apiClient);

  @override
  Future<VerificationStatusModel> getVerificationStatus() async {
    try {
      final response = await _apiClient.dio.get(
        ApiEndpoints.verificationStatus,
      );
      return VerificationStatusModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> submitVerificationVideo(File video) async {
    try {
      // 1. Get the file name
      String fileName = p.basename(video.path);

      // 2. Create the FormData object
      // This is the multipart request body
      FormData formData = FormData.fromMap({
        // The key "video" MUST match the @RequestParam("video")
        // in your VerificationController.java
        "video": await MultipartFile.fromFile(
          video.path,
          filename: fileName,
        ),
      });

      // 3. Send the request
      await _apiClient.dio.post(
        ApiEndpoints.submitVerification,
        data: formData,
        // Optional: Show upload progress
        onSendProgress: (int sent, int total) {
          print('Upload progress: ${((sent / total) * 100).toStringAsFixed(0)}%');
        },
      );
      // Backend returns a 200 OK with a simple string, which we ignore
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
