// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingRatingModelImpl _$$PendingRatingModelImplFromJson(
  Map<String, dynamic> json,
) => _$PendingRatingModelImpl(
  sessionId: json['sessionId'] as String,
  sessionTitle: json['sessionTitle'] as String,
  userIdToRate: json['userIdToRate'] as String,
  userNameToRate: json['userNameToRate'] as String,
);

Map<String, dynamic> _$$PendingRatingModelImplToJson(
  _$PendingRatingModelImpl instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'sessionTitle': instance.sessionTitle,
  'userIdToRate': instance.userIdToRate,
  'userNameToRate': instance.userNameToRate,
};
