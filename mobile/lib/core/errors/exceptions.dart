/// Defines custom exception classes for the application.
///
/// These exceptions are used to differentiate between different types
/// of errors (e.g., server errors vs. local cache errors) that can
/// occur in the data layer.
class ServerException implements Exception {
  /// An optional message providing more details about the server error.
  final String? message;

  ServerException({this.message});
}

class CacheException implements Exception {
  /// An optional message providing more details about the cache error.
  final String? message;

  CacheException({this.message});
}