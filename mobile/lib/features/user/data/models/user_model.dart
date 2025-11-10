import 'package:sahbifit/features/user/data/models/badge_model.dart';
import 'package:sahbifit/features/user/domain/entities/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/entities/user_role.dart';
import 'package:sahbifit/features/user/domain/entities/user_status.dart';
import 'package:sahbifit/features/user/domain/entities/verification.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.dateOfBirth,
    required super.profilePhotoUrl,
    required super.verificationStatus,
    required super.verifiedGender,
    required super.profileVisibility,
    required super.primaryGymName,
    required super.role,
    required super.status,
    required super.groupSessionCount,
    required super.averageRating,
    required super.badges,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['userId'],
      firstName: json['firstName'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      profilePhotoUrl: json['profilePhotoUrl'],
      verificationStatus: _parseVerificationStatus(json['verificationStatus']),
      verifiedGender: _parseVerifiedGender(json['verifiedGender']),
      profileVisibility: _parseProfileVisibility(json['profileVisibility']),
      primaryGymName: json['primaryGym']?['name'] ?? 'No Gym',
      role: _parseUserRole(json['role']),
      status: _parseUserStatus(json['status']),
      groupSessionCount: json['groupSessionCount'] ?? 0,
      averageRating: (json['averageRating'] ?? 0.0).toDouble(),
      badges: (json['userBadges'] as List? ?? [])
          .map((badgeJson) =>
              BadgeModel.fromJson(badgeJson['badge'] ?? badgeJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    // Primarily used for caching, not sending to backend
    return {
      'userId': id,
      'firstName': firstName,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'profilePhotoUrl': profilePhotoUrl,
      'verificationStatus': verificationStatus.name,
      'verifiedGender': verifiedGender.name,
      'profileVisibility': profileVisibility.name,
      'primaryGym': {'name': primaryGymName},
      'role': role.name,
      'status': status.name,
      'groupSessionCount': groupSessionCount,
      'averageRating': averageRating,
      'userBadges': badges.map((b) => (b as BadgeModel).toJson()).toList(),
    };
  }

  static VerificationStatus _parseVerificationStatus(String? status) {
    switch (status) {
      case 'not_started':
        return VerificationStatus.not_started;
      case 'pending':
        return VerificationStatus.pending;
      case 'approved':
        return VerificationStatus.approved;
      case 'rejected':
        return VerificationStatus.rejected;
      default:
        return VerificationStatus.not_started;
    }
  }

  static VerifiedGender _parseVerifiedGender(String? gender) {
    switch (gender) {
      case 'not_verified':
        return VerifiedGender.not_verified;
      case 'male':
        return VerifiedGender.male;
      case 'female':
        return VerifiedGender.female;
      default:
        return VerifiedGender.not_verified;
    }
  }

  static ProfileVisibility _parseProfileVisibility(String? visibility) {
    switch (visibility) {
      case 'all':
        return ProfileVisibility.all;
      case 'same_gender':
        return ProfileVisibility.sameGender;
      default:
        return ProfileVisibility.all;
    }
  }

  static UserRole _parseUserRole(String? role) {
    switch (role) {
      case 'member':
        return UserRole.member;
      case 'ambassador':
        return UserRole.ambassador;
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.member;
    }
  }

  static UserStatus _parseUserStatus(String? status) {
    switch (status) {
      case 'active':
        return UserStatus.active;
      case 'suspended':
        return UserStatus.suspended;
      case 'banned':
        return UserStatus.banned;
      default:
        return UserStatus.active;
    }
  }
}