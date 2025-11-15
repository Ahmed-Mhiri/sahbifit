import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';

abstract class UserRepository {
  Future<User> getMyProfile();
  Future<User> getUserProfile(String userId);
  Future<void> blockUser(String userId);
  Future<void> updateFcmToken(String token);
  Future<void> updateProfileVisibility(ProfileVisibility visibility);

  // --- ADDED METHODS ---
  Future<List<User>> getMyBlockedUsers();
  Future<void> unblockUser(String userId);
}