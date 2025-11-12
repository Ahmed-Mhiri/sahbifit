import 'package:equatable/equatable.dart';
import 'package:sahbifit/core/errors/failure.dart';

/// [Type] is the return type of the usecase (e.g., AuthToken, void).
/// [Params] is the parameters class (e.g., LoginParams).
abstract class UseCase<Type, Params> {
  /// The [call] method is the single entry point for the usecase.
  /// It's designed to be asynchronous and return either a [Failure]
  /// or the expected [Type].
  ///
  /// Note: In our Auth implementation, we are letting exceptions bubble up
  /// to the BLoC. You can also use an Either<Failure, Type> wrapper here.
  /// For simplicity, we'll stick to throwing Failures.
  Future<Type> call(Params params);
}

/// A helper class for usecases that do not require any parameters.
/// For example: `GetMyProfile(NoParams())`
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}