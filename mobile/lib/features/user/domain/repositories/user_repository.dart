import 'package:dartz/dartz.dart';
import 'package:sahbifit/core/error/failure.dart';
import 'package:sahbifit/features/user/domain/entities/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';

abstract class UserRepository {
  /// Gets the profile of the currently authenticated user.
  Future<Either<Failure, User>> getMyProfile();

  /// Gets the profile of a specific user by [userId].
  Future<Either<Failure, User>> getUserProfile(String userId);

  /// Blocks the user with [userId].
  Future<Either<Failure, void>> blockUser(String userId);

  /// Updates the current user's FCM [token].
  Future<Either<Failure, void>> updateFcmToken(String token);

  /// Updates the current user's profile [visibility].
  Future<Either<Failure, void>> updateProfileVisibility(
      ProfileVisibility visibility);
}