import 'package:dartz/dartz.dart';
import 'package:sahbifit/core/error/exception.dart';
import 'package:sahbifit/core/error/failure.dart';
import 'package:sahbifit/features/user/data/datasources/user_remote_datasource.dart';
import 'package:sahbifit/features/user/data/models/update_fcm_token_model.dart';
import 'package:sahbifit/features/user/data/models/update_visibility_model.dart';
import 'package:sahbifit/features/user/domain/entities/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

typedef _VoidResult = Future<void> Function();
typedef _UserResult = Future<User> Function();

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo; // You would inject this

  UserRepositoryImpl({
    required this.remoteDataSource,
    // required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> getMyProfile() async {
    return _handleUserRequest(() => remoteDataSource.getMyProfile());
  }

  @override
  Future<Either<Failure, User>> getUserProfile(String userId) async {
    return _handleUserRequest(() => remoteDataSource.getUserProfile(userId));
  }

  @override
  Future<Either<Failure, void>> blockUser(String userId) async {
    return _handleVoidRequest(() => remoteDataSource.blockUser(userId));
  }

  @override
  Future<Either<Failure, void>> updateFcmToken(String token) async {
    final model = UpdateFcmTokenModel(fcmToken: token);
    return _handleVoidRequest(() => remoteDataSource.updateFcmToken(model));
  }

  @override
  Future<Either<Failure, void>> updateProfileVisibility(
      ProfileVisibility visibility) async {
    final model = UpdateVisibilityModel(visibility: visibility);
    return _handleVoidRequest(
        () => remoteDataSource.updateProfileVisibility(model));
  }

  // Helper function to handle void-returning requests
  Future<Either<Failure, void>> _handleVoidRequest(
      _VoidResult request) async {
    // if (await networkInfo.isConnected) {
    try {
      await request();
      return const Right(null);
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
    // } else {
    //   return Left(NetworkFailure('No internet connection'));
    // }
  }

  // Helper function to handle User-returning requests
  Future<Either<Failure, User>> _handleUserRequest(_UserResult request) async {
    // if (await networkInfo.isConnected) {
    try {
      final user = await request();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
    // } else {
    //   return Left(NetworkFailure('No internet connection'));
    // }
  }
}