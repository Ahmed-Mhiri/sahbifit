import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sahbifit/core/error/exception.dart'; // You would create this
import '../models/badge_model.dart';
import '../models/update_fcm_token_model.dart';
import '../models/update_visibility_model.dart';
import '../models/user_model.dart';

// Define your API base URL
const String API_BASE_URL = "https://api.sahbifit.com/api";

abstract class UserRemoteDataSource {
  /// Fetches the profile for the currently authenticated user.
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> getMyProfile();

  /// Fetches the profile for a specific [userId].
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> getUserProfile(String userId);

  /// Blocks a user by their [userId].
  /// Throws a [ServerException] for all error codes.
  Future<void> blockUser(String userId);

  /// Updates the FCM token for the current user.
  /// Throws a [ServerException] for all error codes.
  Future<void> updateFcmToken(UpdateFcmTokenModel model);

  /// Updates the profile visibility for the current user.
  /// Throws a [ServerException] for all error codes.
  Future<void> updateProfileVisibility(UpdateVisibilityModel model);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  // You would inject an auth token provider here
  // final AuthTokenProvider authTokenProvider;

  UserRemoteDataSourceImpl({required this.client});

  // Helper to get authorization headers
  Future<Map<String, String>> _getAuthHeaders() async {
    // const token = await authTokenProvider.getToken();
    const token = "DUMMY_AUTH_TOKEN"; // Placeholder
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  @override
  Future<UserModel> getMyProfile() async {
    final response = await client.get(
      Uri.parse('$API_BASE_URL/users/me'),
      headers: await _getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException('Failed to load profile');
    }
  }

  @override
  Future<UserModel> getUserProfile(String userId) async {
    final response = await client.get(
      Uri.parse('$API_BASE_URL/users/$userId'),
      headers: await _getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException('Failed to load user profile');
    }
  }

  @override
  Future<void> blockUser(String userId) async {
    final response = await client.post(
      Uri.parse('$API_BASE_URL/users/$userId/block'),
      headers: await _getAuthHeaders(),
    );

    if (response.statusCode != 200) {
      throw ServerException('Failed to block user');
    }
  }

  @override
  Future<void> updateFcmToken(UpdateFcmTokenModel model) async {
    final response = await client.put(
      Uri.parse('$API_BASE_URL/users/me/fcm-token'),
      headers: await _getAuthHeaders(),
      body: json.encode(model.toJson()),
    );

    if (response.statusCode != 200) {
      throw ServerException('Failed to update FCM token');
    }
  }

  @override
  Future<void> updateProfileVisibility(UpdateVisibilityModel model) async {
    final response = await client.put(
      Uri.parse('$API_BASE_URL/users/me/visibility'),
      headers: await _getAuthHeaders(),
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 400 || response.statusCode == 409) {
      // Handle specific backend validation, e.g., not gender-verified
      final errorBody = json.decode(response.body);
      throw ValidationException(errorBody['message'] ?? 'Visibility update failed');
    } else {
      throw ServerException('Failed to update visibility');
    }
  }
}