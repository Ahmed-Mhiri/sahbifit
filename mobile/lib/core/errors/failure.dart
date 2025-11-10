import 'package:equatable/equatable.dart'; // You may need to run: flutter pub add equatable

/// A base Failure class. All other failures in the app should extend this.
/// Using Equatable to allow for value comparison.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Represents a failure from the server (e.g., API errors, 404, 500).
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

/// Represents a failure from the local cache (e.g., database not found).
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

// You can add other specific failures here as needed:
// class NetworkFailure extends Failure { ... }
// class AuthenticationFailure extends Failure { ... }