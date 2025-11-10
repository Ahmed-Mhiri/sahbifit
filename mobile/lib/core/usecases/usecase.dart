import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahbifit_mobile/core/errors/failure.dart'; // Make sure this path is correct

/// This is the generic, abstract UseCase class
///
/// [Type]: The return type of the use case (e.g., List<Gym>, void)
/// [Params]: The parameters required to execute the use case (e.g., SubmitGymParams, NoParams)
abstract class UseCase<Type, Params> {
  /// The [call] method is the single entry point for the use case.
  Future<Either<Failure, Type>> call(Params params);
}

/// This is a helper class used as a parameter when a use case
/// doesn't require any input parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}