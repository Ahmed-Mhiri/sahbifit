import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/user/domain/entities/badge.dart';
import 'package:sahbifit/features/user/domain/entities/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/entities/user_role.dart';
import 'package:sahbifit/features/user/domain/entities/user_status.dart';
import 'package:sahbifit/features/user/domain/entities/verification.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final DateTime dateOfBirth;
  final String? profilePhotoUrl;
  final VerificationStatus verificationStatus;
  final VerifiedGender verifiedGender;
  final ProfileVisibility profileVisibility;
  final String primaryGymName;
  final UserRole role;
  final UserStatus status;
  final int groupSessionCount;
  final double averageRating;
  final List<Badge> badges;

  const User({
    required this.id,
    required this.firstName,
    required this.dateOfBirth,
    this.profilePhotoUrl,
    required this.verificationStatus,
    required this.verifiedGender,
    required this.profileVisibility,
    required this.primaryGymName,
    required this.role,
    required this.status,
    required this.groupSessionCount,
    required this.averageRating,
    required this.badges,
  });

  // Helper getter for UI
  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  // Helper getter for UI
  bool get isVerified {
    return verificationStatus == VerificationStatus.approved;
  }

  // Helper getter for UI
  bool get isGenderVerified {
    return verifiedGender != VerifiedGender.not_verified;
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        dateOfBirth,
        profilePhotoUrl,
        verificationStatus,
        verifiedGender,
        profileVisibility,
        primaryGymName,
        role,
        status,
        groupSessionCount,
        averageRating,
        badges,
      ];
}