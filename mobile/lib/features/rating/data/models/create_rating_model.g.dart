// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateRatingModelImpl _$$CreateRatingModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateRatingModelImpl(
  sessionId: json['sessionId'] as String,
  ratedUserId: json['ratedUserId'] as String,
  ratingValue: (json['ratingValue'] as num).toInt(),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$$CreateRatingModelImplToJson(
  _$CreateRatingModelImpl instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'ratedUserId': instance.ratedUserId,
  'ratingValue': instance.ratingValue,
  'comment': instance.comment,
};
