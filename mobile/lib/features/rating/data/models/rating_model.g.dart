// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => _RatingModel(
  ratingId: json['ratingId'] as String,
  ratingBy: UserSummaryModel.fromJson(json['ratingBy'] as Map<String, dynamic>),
  ratingFor: UserSummaryModel.fromJson(
    json['ratingFor'] as Map<String, dynamic>,
  ),
  session: SessionSummaryModel.fromJson(
    json['session'] as Map<String, dynamic>,
  ),
  ratingValue: (json['ratingValue'] as num).toInt(),
  comment: json['comment'] as String?,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$RatingModelToJson(_RatingModel instance) =>
    <String, dynamic>{
      'ratingId': instance.ratingId,
      'ratingBy': instance.ratingBy,
      'ratingFor': instance.ratingFor,
      'session': instance.session,
      'ratingValue': instance.ratingValue,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
    };
