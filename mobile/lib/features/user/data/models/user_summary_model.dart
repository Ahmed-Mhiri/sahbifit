import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/enums/user_role.dart';
import 'package:sahbifit/features/user/domain/enums/user_status.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

part 'user_summary_model.freezed.dart';
part 'user_summary_model.g.dart';

@freezed
abstract class UserSummaryModel with _$UserSummaryModel {
  const UserSummaryModel._();

  const factory UserSummaryModel({
    required String userId,
    required String firstName,
    String? profilePhotoUrl,
  }) = _UserSummaryModel;

  factory UserSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryModelFromJson(json);

  /// Converts this summary into a full User entity.
  /// We fill missing fields with safe defaults since they aren't needed for the Feed.
  User toEntity() {
    return User(
      userId: userId,
      firstName: firstName,
      profilePhotoUrl: profilePhotoUrl,
      // --- Defaults for fields not present in Summary DTO ---
      verificationStatus: VerificationStatus.verified, // Assume verified for display purposes
      verifiedGender: VerifiedGender.notVerified,
      profileVisibility: ProfileVisibility.all,
      role: UserRole.member,
      status: UserStatus.active,
      groupSessionCount: 0,
      lateCancelCount:0,
      noShowCount: 0,
      userBadges: const [],
    );
  }
}