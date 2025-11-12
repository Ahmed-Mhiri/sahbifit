// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_fcm_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateFcmTokenModel _$UpdateFcmTokenModelFromJson(Map<String, dynamic> json) {
  return _UpdateFcmTokenModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateFcmTokenModel {
  String get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this UpdateFcmTokenModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateFcmTokenModelCopyWith<UpdateFcmTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateFcmTokenModelCopyWith<$Res> {
  factory $UpdateFcmTokenModelCopyWith(
    UpdateFcmTokenModel value,
    $Res Function(UpdateFcmTokenModel) then,
  ) = _$UpdateFcmTokenModelCopyWithImpl<$Res, UpdateFcmTokenModel>;
  @useResult
  $Res call({String fcmToken});
}

/// @nodoc
class _$UpdateFcmTokenModelCopyWithImpl<$Res, $Val extends UpdateFcmTokenModel>
    implements $UpdateFcmTokenModelCopyWith<$Res> {
  _$UpdateFcmTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fcmToken = null}) {
    return _then(
      _value.copyWith(
            fcmToken: null == fcmToken
                ? _value.fcmToken
                : fcmToken // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateFcmTokenModelImplCopyWith<$Res>
    implements $UpdateFcmTokenModelCopyWith<$Res> {
  factory _$$UpdateFcmTokenModelImplCopyWith(
    _$UpdateFcmTokenModelImpl value,
    $Res Function(_$UpdateFcmTokenModelImpl) then,
  ) = __$$UpdateFcmTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fcmToken});
}

/// @nodoc
class __$$UpdateFcmTokenModelImplCopyWithImpl<$Res>
    extends _$UpdateFcmTokenModelCopyWithImpl<$Res, _$UpdateFcmTokenModelImpl>
    implements _$$UpdateFcmTokenModelImplCopyWith<$Res> {
  __$$UpdateFcmTokenModelImplCopyWithImpl(
    _$UpdateFcmTokenModelImpl _value,
    $Res Function(_$UpdateFcmTokenModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fcmToken = null}) {
    return _then(
      _$UpdateFcmTokenModelImpl(
        fcmToken: null == fcmToken
            ? _value.fcmToken
            : fcmToken // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$UpdateFcmTokenModelImpl implements _UpdateFcmTokenModel {
  const _$UpdateFcmTokenModelImpl({required this.fcmToken});

  factory _$UpdateFcmTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateFcmTokenModelImplFromJson(json);

  @override
  final String fcmToken;

  @override
  String toString() {
    return 'UpdateFcmTokenModel(fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFcmTokenModelImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFcmTokenModelImplCopyWith<_$UpdateFcmTokenModelImpl> get copyWith =>
      __$$UpdateFcmTokenModelImplCopyWithImpl<_$UpdateFcmTokenModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateFcmTokenModelImplToJson(this);
  }
}

abstract class _UpdateFcmTokenModel implements UpdateFcmTokenModel {
  const factory _UpdateFcmTokenModel({required final String fcmToken}) =
      _$UpdateFcmTokenModelImpl;

  factory _UpdateFcmTokenModel.fromJson(Map<String, dynamic> json) =
      _$UpdateFcmTokenModelImpl.fromJson;

  @override
  String get fcmToken;

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateFcmTokenModelImplCopyWith<_$UpdateFcmTokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
