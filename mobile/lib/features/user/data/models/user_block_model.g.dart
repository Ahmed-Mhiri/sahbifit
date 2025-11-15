// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBlockIdModel _$UserBlockIdModelFromJson(Map<String, dynamic> json) =>
    _UserBlockIdModel(
      blockerUserId: json['blockerUserId'] as String,
      blockedUserId: json['blockedUserId'] as String,
    );

Map<String, dynamic> _$UserBlockIdModelToJson(_UserBlockIdModel instance) =>
    <String, dynamic>{
      'blockerUserId': instance.blockerUserId,
      'blockedUserId': instance.blockedUserId,
    };

_UserBlockModel _$UserBlockModelFromJson(Map<String, dynamic> json) =>
    _UserBlockModel(
      id: UserBlockIdModel.fromJson(json['id'] as Map<String, dynamic>),
      blocker: UserModel.fromJson(json['blocker'] as Map<String, dynamic>),
      blocked: UserModel.fromJson(json['blocked'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$UserBlockModelToJson(_UserBlockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blocker': instance.blocker,
      'blocked': instance.blocked,
      'createdAt': instance.createdAt,
    };
