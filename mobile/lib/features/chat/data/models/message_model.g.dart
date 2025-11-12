// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      senderId: json['sender_id'] as String,
      text: json['text'] as String,
      timestamp: _$JsonConverterFromJson<Object, DateTime?>(
          json['timestamp'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'text': instance.text,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
