// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagModelImpl _$$TagModelImplFromJson(Map<String, dynamic> json) =>
    _$TagModelImpl(
      tagId: (json['tagId'] as num).toInt(),
      tagName: json['tagName'] as String,
      tagType: $enumDecode(_$TagTypeEnumMap, json['tagType']),
    );

Map<String, dynamic> _$$TagModelImplToJson(_$TagModelImpl instance) =>
    <String, dynamic>{
      'tagId': instance.tagId,
      'tagName': instance.tagName,
      'tagType': _$TagTypeEnumMap[instance.tagType]!,
    };

const _$TagTypeEnumMap = {TagType.goal: 'goal', TagType.schedule: 'schedule'};
