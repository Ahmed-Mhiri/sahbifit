import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/user/data/models/update_fcm_token_model.dart';
import 'package:sahbifit/features/user/data/models/update_visibility_model.dart';
import 'package:sahbifit/features/user/data/models/user_model.dart';

abstract class UserRemoteDatasource {
  Future<UserModel> getMyProfile();
  Future<UserModel> getUserProfile(String userId);
  Future<void> blockUser(String userId);
  Future<void> updateFcmToken(UpdateFcmTokenModel request);
  Future<void> updateProfileVisibility(UpdateVisibilityModel request);
  
  // --- ADDED ---
  Future<List<UserModel>> getMyBlockedUsers();
  Future<void> unblockUser(String userId);
  // --- END ADDED ---
}

@Injectable(as: UserRemoteDatasource)
class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final ApiClient _apiClient;

  UserRemoteDatasourceImpl(this._apiClient);

  @override
  Future<UserModel> getMyProfile() async {
    try {
      final response = await _apiClient.dio.get(ApiEndpoints.myProfile);
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<UserModel> getUserProfile(String userId) async {
    try {
      final response = await _apiClient.dio.get(
        ApiEndpoints.getUserProfile(userId),
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> blockUser(String userId) async {
    try {
      await _apiClient.dio.post(
        ApiEndpoints.blockUser(userId),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> updateFcmToken(UpdateFcmTokenModel request) async {
    try {
      await _apiClient.dio.put(
        ApiEndpoints.updateFcmToken,
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> updateProfileVisibility(UpdateVisibilityModel request) async {
    try {
      await _apiClient.dio.put(
        ApiEndpoints.updateVisibility,
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  // --- ADDED ---
  @override
  Future<List<UserModel>> getMyBlockedUsers() async {
    try {
      final response = await _apiClient.dio.get(ApiEndpoints.myBlockedUsers);
      // Assuming response.data is a List<dynamic>
      final List<dynamic> data = response.data;
      return data.map((json) => UserModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> unblockUser(String userId) async {
    try {
      // Unblocking is typically a DELETE request
      await _apiClient.dio.delete(
        ApiEndpoints.unblockUser(userId),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
  // --- END ADDED ---
}