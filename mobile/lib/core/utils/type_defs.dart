

import 'package:dartz/dartz.dart';
import 'package:sahbifit_mobile/core/errors/failure.dart';

/// A standard Result type using the 'dartz' package for functional error handling.
/// It will return either a [Failure] (Left) or a successful value [T] (Right).
typedef Result<T> = Either<Failure, T>;