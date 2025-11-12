// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
      verificationStatus: $enumDecode(
        _$VerificationStatusEnumMap,
        json['verificationStatus'],
      ),
      verifiedGender: $enumDecode(
        _$VerifiedGenderEnumMap,
        json['verifiedGender'],
      ),
      profileVisibility: $enumDecode(
        _$ProfileVisibilityEnumMap,
        json['profileVisibility'],
      ),
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
      groupSessionCount: (json['groupSessionCount'] as num).toInt(),
      noShowCount: (json['noShowCount'] as num).toInt(),
      primaryGym: json['primaryGym'] == null
          ? null
          : GymModel.fromJson(json['primaryGym'] as Map<String, dynamic>),
      userBadges:
          (json['userBadges'] as List<dynamic>?)
              ?.map((e) => BadgeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(
  _$UserModelImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'firstName': instance.firstName,
  'profilePhotoUrl': instance.profilePhotoUrl,
  'verificationStatus':
      _$VerificationStatusEnumMap[instance.verificationStatus]!,
  'verifiedGender': _$VerifiedGenderEnumMap[instance.verifiedGender]!,
  'profileVisibility': _$ProfileVisibilityEnumMap[instance.profileVisibility]!,
  'role': _$UserRoleEnumMap[instance.role]!,
  'status': _$UserStatusEnumMap[instance.status]!,
  'groupSessionCount': instance.groupSessionCount,
  'noShowCount': instance.noShowCount,
  'primaryGym': instance.primaryGym?.toJson(),
  'userBadges': instance.userBadges.map((e) => e.toJson()).toList(),
};

const _$VerificationStatusEnumMap = {
  VerificationStatus.notStarted: 'not_started',
  VerificationStatus.pendingReview: 'pending_review',
  VerificationStatus.verified: 'verified',
  VerificationStatus.rejectedBadVideo: 'rejected_bad_video',
  VerificationStatus.rejectedMismatch: 'rejected_mismatch',
};

const _$VerifiedGenderEnumMap = {
  VerifiedGender.notVerified: 'not_verified',
  VerifiedGender.male: 'male',
  VerifiedGender.female: 'female',
  VerifiedGender.other: 'other',
};

const _$ProfileVisibilityEnumMap = {
  ProfileVisibility.all: 'all',
  ProfileVisibility.sameGender: 'same_gender',
};

const _$UserRoleEnumMap = {
  UserRole.member: 'member',
  UserRole.ambassador: 'ambassador',
  UserRole.admin: 'admin',
};

const _$UserStatusEnumMap = {
  UserStatus.active: 'active',
  UserStatus.suspended: 'suspended',
  UserStatus.banned: 'banned',
};
