import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/user/domain/entities/badge.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/enums/user_role.dart';
import 'package:sahbifit/features/user/domain/enums/user_status.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

// Matches User.java
class User extends Equatable {
  final String userId;
  final String firstName;
  final String? profilePhotoUrl;
  final VerificationStatus verificationStatus;
  final VerifiedGender verifiedGender;
  final ProfileVisibility profileVisibility;
  final UserRole role;
  final UserStatus status;
  final int groupSessionCount;
  final int noShowCount;
  final Gym? primaryGym;
  final List<Badge> userBadges;

  const User({
    required this.userId,
    required this.firstName,
    this.profilePhotoUrl,
    required this.verificationStatus,
    required this.verifiedGender,
    required this.profileVisibility,
    required this.role,
    required this.status,
    required this.groupSessionCount,
    required this.noShowCount,
    this.primaryGym,
    required this.userBadges,
  });

  @override
  List<Object?> get props => [
        userId,
        firstName,
        profilePhotoUrl,
        verificationStatus,
        verifiedGender,
        profileVisibility,
        role,
        status,
        groupSessionCount,
        noShowCount,
        primaryGym,
        userBadges,
      ];
}
