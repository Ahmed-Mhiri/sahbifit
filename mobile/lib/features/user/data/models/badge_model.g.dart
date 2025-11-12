// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BadgeModel _$BadgeModelFromJson(Map<String, dynamic> json) => _BadgeModel(
      badgeId: (json['badgeId'] as num).toInt(),
      badgeName: json['badgeName'] as String,
      description: json['description'] as String,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$BadgeModelToJson(_BadgeModel instance) =>
    <String, dynamic>{
      'badgeId': instance.badgeId,
      'badgeName': instance.badgeName,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
    };
