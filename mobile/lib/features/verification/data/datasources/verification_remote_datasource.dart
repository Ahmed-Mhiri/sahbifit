import 'package:dio/dio.dart'; // Assuming you use dio
import 'package:sahbifit_mobile/features/verification/data/models/verification_status_model.dart';
import 'dart:io';
import '../../../../core/constants/api_endpoints.dart';

abstract class VerificationRemoteDataSource {
  Future<VerificationStatusModel> getVerificationStatus();
  Future<String> submitVerificationVideo(String videoPath);
}

class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final ApiClient apiClient;

  VerificationRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<VerificationStatusModel> getVerificationStatus() async {
    final response = await apiClient.get(ApiEndpoints.verificationStatus);
    return VerificationStatusModel.fromJson(response.data);
  }

  @override
  Future<String> submitVerificationVideo(String videoPath) async {
    final file = File(videoPath);
    final fileName = file.path.split('/').last;
    
    // 1. Create FormData
    // This matches the @RequestParam("video") MultipartFile in Java
    
    final formData = FormData.fromMap({
      'video': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    // 2. Send as POST with FormData, not JSON
    final response = await apiClient.post(
      ApiEndpoints.submitVerification,
      data: formData,
      // Optional: Add progress callback for UI
      onSendProgress: (sent, total) {
        // You can pass this to the BLoC
        print('Upload progress: ${((sent / total) * 100).toStringAsFixed(0)}%');
      },
    );

    // 3. Backend returns a plain string message
    return response.data as String;
  }
}