import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/user/data/datasources/user_remote_datasource.dart';
import 'package:sahbifit/features/user/data/models/update_fcm_token_model.dart';
import 'package:sahbifit/features/user/data/models/update_visibility_model.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource _remoteDatasource;

  UserRepositoryImpl(this._remoteDatasource);

  @override
  Future<User> getMyProfile() async {
    try {
      final userModel = await _remoteDatasource.getMyProfile();
      return userModel.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<User> getUserProfile(String userId) async {
    try {
      final userModel = await _remoteDatasource.getUserProfile(userId);
      return userModel.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> blockUser(String userId) async {
    try {
      await _remoteDatasource.blockUser(userId);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> updateFcmToken(String token) async {
    try {
      final requestModel = UpdateFcmTokenModel(fcmToken: token);
      await _remoteDatasource.updateFcmToken(requestModel);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> updateProfileVisibility(ProfileVisibility visibility) async {
    try {
      final requestModel = UpdateVisibilityModel(visibility: visibility);
      await _remoteDatasource.updateProfileVisibility(requestModel);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  // --- ADDED METHODS ---
  @override
  Future<List<User>> getMyBlockedUsers() async {
    try {
      final userModels = await _remoteDatasource.getMyBlockedUsers();
      return userModels.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> unblockUser(String userId) async {
    try {
      await _remoteDatasource.unblockUser(userId);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
}