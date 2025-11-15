// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_visibility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateVisibilityModel _$UpdateVisibilityModelFromJson(
  Map<String, dynamic> json,
) => _UpdateVisibilityModel(
  visibility: $enumDecode(_$ProfileVisibilityEnumMap, json['visibility']),
);

Map<String, dynamic> _$UpdateVisibilityModelToJson(
  _UpdateVisibilityModel instance,
) => <String, dynamic>{
  'visibility': _$ProfileVisibilityEnumMap[instance.visibility]!,
};

const _$ProfileVisibilityEnumMap = {
  ProfileVisibility.all: 'all',
  ProfileVisibility.sameGender: 'same_gender',
};
