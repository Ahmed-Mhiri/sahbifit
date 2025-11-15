import 'package:dartz/dartz.dart';
import 'package:sahbifit/core/errors/failure.dart';

/// A type definition for a Future that returns either a Failure or a Type [T].
/// This is commonly used in repositories and use cases.
///
/// Example: `FutureEither<User> getMyProfile()`
typedef FutureEither<T> = Future<Either<Failure, T>>;

/// A type definition for a Future that returns either a Failure or void.
/// Used for operations that don't return data, like `deleteToken()`.
///
/// Example: `FutureVoid deleteToken()`
typedef FutureVoid = FutureEither<void>;

/// A common type definition for JSON data.
///
/// Example: `DataMap json = response.data as DataMap;`
typedef DataMap = Map<String, dynamic>;