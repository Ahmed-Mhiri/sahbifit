// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TagModel _$TagModelFromJson(Map<String, dynamic> json) {
  return _TagModel.fromJson(json);
}

/// @nodoc
mixin _$TagModel {
  int get tagId => throw _privateConstructorUsedError;
  String get tagName => throw _privateConstructorUsedError;
  TagType get tagType => throw _privateConstructorUsedError;

  /// Serializes this TagModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagModelCopyWith<TagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagModelCopyWith<$Res> {
  factory $TagModelCopyWith(TagModel value, $Res Function(TagModel) then) =
      _$TagModelCopyWithImpl<$Res, TagModel>;
  @useResult
  $Res call({int tagId, String tagName, TagType tagType});
}

/// @nodoc
class _$TagModelCopyWithImpl<$Res, $Val extends TagModel>
    implements $TagModelCopyWith<$Res> {
  _$TagModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? tagName = null,
    Object? tagType = null,
  }) {
    return _then(
      _value.copyWith(
            tagId: null == tagId
                ? _value.tagId
                : tagId // ignore: cast_nullable_to_non_nullable
                      as int,
            tagName: null == tagName
                ? _value.tagName
                : tagName // ignore: cast_nullable_to_non_nullable
                      as String,
            tagType: null == tagType
                ? _value.tagType
                : tagType // ignore: cast_nullable_to_non_nullable
                      as TagType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TagModelImplCopyWith<$Res>
    implements $TagModelCopyWith<$Res> {
  factory _$$TagModelImplCopyWith(
    _$TagModelImpl value,
    $Res Function(_$TagModelImpl) then,
  ) = __$$TagModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tagId, String tagName, TagType tagType});
}

/// @nodoc
class __$$TagModelImplCopyWithImpl<$Res>
    extends _$TagModelCopyWithImpl<$Res, _$TagModelImpl>
    implements _$$TagModelImplCopyWith<$Res> {
  __$$TagModelImplCopyWithImpl(
    _$TagModelImpl _value,
    $Res Function(_$TagModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? tagName = null,
    Object? tagType = null,
  }) {
    return _then(
      _$TagModelImpl(
        tagId: null == tagId
            ? _value.tagId
            : tagId // ignore: cast_nullable_to_non_nullable
                  as int,
        tagName: null == tagName
            ? _value.tagName
            : tagName // ignore: cast_nullable_to_non_nullable
                  as String,
        tagType: null == tagType
            ? _value.tagType
            : tagType // ignore: cast_nullable_to_non_nullable
                  as TagType,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$TagModelImpl extends _TagModel {
  const _$TagModelImpl({
    required this.tagId,
    required this.tagName,
    required this.tagType,
  }) : super._();

  factory _$TagModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagModelImplFromJson(json);

  @override
  final int tagId;
  @override
  final String tagName;
  @override
  final TagType tagType;

  @override
  String toString() {
    return 'TagModel(tagId: $tagId, tagName: $tagName, tagType: $tagType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagModelImpl &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.tagType, tagType) || other.tagType == tagType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tagId, tagName, tagType);

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagModelImplCopyWith<_$TagModelImpl> get copyWith =>
      __$$TagModelImplCopyWithImpl<_$TagModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagModelImplToJson(this);
  }
}

abstract class _TagModel extends TagModel {
  const factory _TagModel({
    required final int tagId,
    required final String tagName,
    required final TagType tagType,
  }) = _$TagModelImpl;
  const _TagModel._() : super._();

  factory _TagModel.fromJson(Map<String, dynamic> json) =
      _$TagModelImpl.fromJson;

  @override
  int get tagId;
  @override
  String get tagName;
  @override
  TagType get tagType;

  /// Create a copy of TagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagModelImplCopyWith<_$TagModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
