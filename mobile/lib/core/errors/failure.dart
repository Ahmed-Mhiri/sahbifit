import 'package:equatable/equatable.dart';

/// A [Failure] is an error that is safe to show to the user
/// and will be handled by the UI/Presentation layer.
abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

/// Represents a failure from the server (e.g., 4xx, 5xx errors).
/// This is what we used in our [AuthRepositoryImpl].
class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

/// Represents a failure when accessing local cache.
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Error reading from local storage.'});
}

/// Represents a failure when there is no network connection.
class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Please check your internet connection.'});
}