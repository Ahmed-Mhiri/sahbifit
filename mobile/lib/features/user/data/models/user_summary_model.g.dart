// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSummaryModel _$UserSummaryModelFromJson(Map<String, dynamic> json) =>
    _UserSummaryModel(
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
    );

Map<String, dynamic> _$UserSummaryModelToJson(_UserSummaryModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'profilePhotoUrl': instance.profilePhotoUrl,
    };
