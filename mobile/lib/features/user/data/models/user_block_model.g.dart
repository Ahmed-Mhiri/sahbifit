// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockIdModelImpl _$$UserBlockIdModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserBlockIdModelImpl(
  blockerUserId: json['blockerUserId'] as String,
  blockedUserId: json['blockedUserId'] as String,
);

Map<String, dynamic> _$$UserBlockIdModelImplToJson(
  _$UserBlockIdModelImpl instance,
) => <String, dynamic>{
  'blockerUserId': instance.blockerUserId,
  'blockedUserId': instance.blockedUserId,
};

_$UserBlockModelImpl _$$UserBlockModelImplFromJson(Map<String, dynamic> json) =>
    _$UserBlockModelImpl(
      id: UserBlockIdModel.fromJson(json['id'] as Map<String, dynamic>),
      blocker: UserModel.fromJson(json['blocker'] as Map<String, dynamic>),
      blocked: UserModel.fromJson(json['blocked'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$UserBlockModelImplToJson(
  _$UserBlockModelImpl instance,
) => <String, dynamic>{
  'id': instance.id.toJson(),
  'blocker': instance.blocker.toJson(),
  'blocked': instance.blocked.toJson(),
  'createdAt': instance.createdAt,
};
