// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateRatingModel _$CreateRatingModelFromJson(Map<String, dynamic> json) =>
    _CreateRatingModel(
      sessionId: json['sessionId'] as String,
      ratedUserId: json['ratedUserId'] as String,
      ratingValue: (json['ratingValue'] as num).toInt(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$CreateRatingModelToJson(_CreateRatingModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'ratedUserId': instance.ratedUserId,
      'ratingValue': instance.ratingValue,
      'comment': instance.comment,
    };
