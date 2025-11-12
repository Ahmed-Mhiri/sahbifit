// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GymModelImpl _$$GymModelImplFromJson(Map<String, dynamic> json) =>
    _$GymModelImpl(
      gymId: json['gymId'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
      status: $enumDecode(_$GymStatusEnumMap, json['status']),
      memberCount: (json['memberCount'] as num).toInt(),
    );

Map<String, dynamic> _$$GymModelImplToJson(_$GymModelImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'name': instance.name,
      'address': instance.address,
      'status': _$GymStatusEnumMap[instance.status]!,
      'memberCount': instance.memberCount,
    };

const _$GymStatusEnumMap = {
  GymStatus.pending: 'pending',
  GymStatus.approved: 'approved',
  GymStatus.rejected: 'rejected',
};
