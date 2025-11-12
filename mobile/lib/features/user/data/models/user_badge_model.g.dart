// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_badge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBadgeIdModel _$UserBadgeIdModelFromJson(Map<String, dynamic> json) =>
    _UserBadgeIdModel(
      userId: json['userId'] as String,
      badgeId: (json['badgeId'] as num).toInt(),
    );

Map<String, dynamic> _$UserBadgeIdModelToJson(_UserBadgeIdModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'badgeId': instance.badgeId,
    };

_UserBadgeModel _$UserBadgeModelFromJson(Map<String, dynamic> json) =>
    _UserBadgeModel(
      id: UserBadgeIdModel.fromJson(json['id'] as Map<String, dynamic>),
      badge: BadgeModel.fromJson(json['badge'] as Map<String, dynamic>),
      earnedAt: json['earnedAt'] as String,
    );

Map<String, dynamic> _$UserBadgeModelToJson(_UserBadgeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'badge': instance.badge,
      'earnedAt': instance.earnedAt,
    };
