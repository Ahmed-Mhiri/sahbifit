import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/gym/data/models/gym_model.dart';
import 'package:sahbifit/features/user/data/models/badge_model.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/enums/user_role.dart';
import 'package:sahbifit/features/user/domain/enums/user_status.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';


@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  
  const factory UserModel({
    required String userId,
    required String firstName,
    String? profilePhotoUrl,
    required VerificationStatus verificationStatus,
    required VerifiedGender verifiedGender,
    required ProfileVisibility profileVisibility,
    required UserRole role,
    required UserStatus status,
    required int groupSessionCount,
    required int noShowCount,
    GymModel? primaryGym,
    @Default([]) List<BadgeModel> userBadges,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  User toEntity() {
    return User(
      userId: userId,
      firstName: firstName,
      profilePhotoUrl: profilePhotoUrl,
      verificationStatus: verificationStatus,
      verifiedGender: verifiedGender,
      profileVisibility: profileVisibility,
      role: role,
      status: status,
      groupSessionCount: groupSessionCount,
      noShowCount: noShowCount,
      primaryGym: primaryGym?.toEntity(),
      userBadges: userBadges.map((badge) => badge.toEntity()).toList(),
    );
  }
}
