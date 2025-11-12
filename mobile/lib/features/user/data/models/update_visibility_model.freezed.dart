// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_visibility_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateVisibilityModel _$UpdateVisibilityModelFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateVisibilityModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateVisibilityModel {
  ProfileVisibility get visibility => throw _privateConstructorUsedError;

  /// Serializes this UpdateVisibilityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateVisibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateVisibilityModelCopyWith<UpdateVisibilityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateVisibilityModelCopyWith<$Res> {
  factory $UpdateVisibilityModelCopyWith(
    UpdateVisibilityModel value,
    $Res Function(UpdateVisibilityModel) then,
  ) = _$UpdateVisibilityModelCopyWithImpl<$Res, UpdateVisibilityModel>;
  @useResult
  $Res call({ProfileVisibility visibility});
}

/// @nodoc
class _$UpdateVisibilityModelCopyWithImpl<
  $Res,
  $Val extends UpdateVisibilityModel
>
    implements $UpdateVisibilityModelCopyWith<$Res> {
  _$UpdateVisibilityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateVisibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? visibility = null}) {
    return _then(
      _value.copyWith(
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as ProfileVisibility,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateVisibilityModelImplCopyWith<$Res>
    implements $UpdateVisibilityModelCopyWith<$Res> {
  factory _$$UpdateVisibilityModelImplCopyWith(
    _$UpdateVisibilityModelImpl value,
    $Res Function(_$UpdateVisibilityModelImpl) then,
  ) = __$$UpdateVisibilityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileVisibility visibility});
}

/// @nodoc
class __$$UpdateVisibilityModelImplCopyWithImpl<$Res>
    extends
        _$UpdateVisibilityModelCopyWithImpl<$Res, _$UpdateVisibilityModelImpl>
    implements _$$UpdateVisibilityModelImplCopyWith<$Res> {
  __$$UpdateVisibilityModelImplCopyWithImpl(
    _$UpdateVisibilityModelImpl _value,
    $Res Function(_$UpdateVisibilityModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateVisibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? visibility = null}) {
    return _then(
      _$UpdateVisibilityModelImpl(
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as ProfileVisibility,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$UpdateVisibilityModelImpl implements _UpdateVisibilityModel {
  const _$UpdateVisibilityModelImpl({required this.visibility});

  factory _$UpdateVisibilityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateVisibilityModelImplFromJson(json);

  @override
  final ProfileVisibility visibility;

  @override
  String toString() {
    return 'UpdateVisibilityModel(visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateVisibilityModelImpl &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, visibility);

  /// Create a copy of UpdateVisibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateVisibilityModelImplCopyWith<_$UpdateVisibilityModelImpl>
  get copyWith =>
      __$$UpdateVisibilityModelImplCopyWithImpl<_$UpdateVisibilityModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateVisibilityModelImplToJson(this);
  }
}

abstract class _UpdateVisibilityModel implements UpdateVisibilityModel {
  const factory _UpdateVisibilityModel({
    required final ProfileVisibility visibility,
  }) = _$UpdateVisibilityModelImpl;

  factory _UpdateVisibilityModel.fromJson(Map<String, dynamic> json) =
      _$UpdateVisibilityModelImpl.fromJson;

  @override
  ProfileVisibility get visibility;

  /// Create a copy of UpdateVisibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateVisibilityModelImplCopyWith<_$UpdateVisibilityModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
