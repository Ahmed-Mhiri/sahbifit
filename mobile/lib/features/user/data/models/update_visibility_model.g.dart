// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_visibility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateVisibilityModelImpl _$$UpdateVisibilityModelImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateVisibilityModelImpl(
  visibility: $enumDecode(_$ProfileVisibilityEnumMap, json['visibility']),
);

Map<String, dynamic> _$$UpdateVisibilityModelImplToJson(
  _$UpdateVisibilityModelImpl instance,
) => <String, dynamic>{
  'visibility': _$ProfileVisibilityEnumMap[instance.visibility]!,
};

const _$ProfileVisibilityEnumMap = {
  ProfileVisibility.all: 'all',
  ProfileVisibility.sameGender: 'same_gender',
};
