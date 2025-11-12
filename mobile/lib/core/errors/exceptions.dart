import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;

  ServerException({required this.message});

  /// This factory constructor creates a [ServerException] from a [DioException].
  /// It parses the Dio error to find the most helpful message.
  factory ServerException.fromDio(DioException e) {
    String message = 'An unknown server error occurred.';

    // Try to get a specific error message from the backend response
    if (e.response != null && e.response?.data != null) {
      // Check if the backend sent a map with a 'message' key
      // e.g., { "message": "Phone number is already registered." }
      if (e.response?.data is Map) {
        message = e.response?.data['message'] ?? message;
      }
      // Check if the backend just sent a plain text error
      else if (e.response?.data is String) {
        final responseString = e.response!.data as String;
        if (responseString.isNotEmpty) {
          message = responseString;
        }
      }
    } 
    // Handle common Dio error types
    else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      message = 'Connection timed out. Please try again.';
    } else if (e.type == DioExceptionType.connectionError) {
      message = 'Network error. Please check your internet connection.';
    } else if (e.type == DioExceptionType.cancel) {
      message = 'Request was cancelled.';
    }

    return ServerException(message: message);
  }
}

/// Thrown if the user is not authorized (e.g., 401 error).
/// Our interceptor might catch this first, but it's good to have.
class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException({this.message = 'You are not authorized.'});
}

/// Thrown when dealing with local data storage.
class CacheException implements Exception {}