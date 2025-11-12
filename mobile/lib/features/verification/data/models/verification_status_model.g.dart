// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationStatusModelImpl _$$VerificationStatusModelImplFromJson(
  Map<String, dynamic> json,
) => _$VerificationStatusModelImpl(
  status: $enumDecode(_$VerificationStatusEnumMap, json['status']),
  gender: $enumDecode(_$VerifiedGenderEnumMap, json['gender']),
);

Map<String, dynamic> _$$VerificationStatusModelImplToJson(
  _$VerificationStatusModelImpl instance,
) => <String, dynamic>{
  'status': _$VerificationStatusEnumMap[instance.status]!,
  'gender': _$VerifiedGenderEnumMap[instance.gender]!,
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
