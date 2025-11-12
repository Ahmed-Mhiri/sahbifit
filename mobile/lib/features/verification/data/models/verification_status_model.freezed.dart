// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VerificationStatusModel _$VerificationStatusModelFromJson(
  Map<String, dynamic> json,
) {
  return _VerificationStatusModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationStatusModel {
  VerificationStatus get status => throw _privateConstructorUsedError;
  VerifiedGender get gender => throw _privateConstructorUsedError;

  /// Serializes this VerificationStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationStatusModelCopyWith<VerificationStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationStatusModelCopyWith<$Res> {
  factory $VerificationStatusModelCopyWith(
    VerificationStatusModel value,
    $Res Function(VerificationStatusModel) then,
  ) = _$VerificationStatusModelCopyWithImpl<$Res, VerificationStatusModel>;
  @useResult
  $Res call({VerificationStatus status, VerifiedGender gender});
}

/// @nodoc
class _$VerificationStatusModelCopyWithImpl<
  $Res,
  $Val extends VerificationStatusModel
>
    implements $VerificationStatusModelCopyWith<$Res> {
  _$VerificationStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? gender = null}) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as VerificationStatus,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as VerifiedGender,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerificationStatusModelImplCopyWith<$Res>
    implements $VerificationStatusModelCopyWith<$Res> {
  factory _$$VerificationStatusModelImplCopyWith(
    _$VerificationStatusModelImpl value,
    $Res Function(_$VerificationStatusModelImpl) then,
  ) = __$$VerificationStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VerificationStatus status, VerifiedGender gender});
}

/// @nodoc
class __$$VerificationStatusModelImplCopyWithImpl<$Res>
    extends
        _$VerificationStatusModelCopyWithImpl<
          $Res,
          _$VerificationStatusModelImpl
        >
    implements _$$VerificationStatusModelImplCopyWith<$Res> {
  __$$VerificationStatusModelImplCopyWithImpl(
    _$VerificationStatusModelImpl _value,
    $Res Function(_$VerificationStatusModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? gender = null}) {
    return _then(
      _$VerificationStatusModelImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as VerificationStatus,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as VerifiedGender,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$VerificationStatusModelImpl extends _VerificationStatusModel {
  const _$VerificationStatusModelImpl({
    required this.status,
    required this.gender,
  }) : super._();

  factory _$VerificationStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationStatusModelImplFromJson(json);

  @override
  final VerificationStatus status;
  @override
  final VerifiedGender gender;

  @override
  String toString() {
    return 'VerificationStatusModel(status: $status, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationStatusModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, gender);

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationStatusModelImplCopyWith<_$VerificationStatusModelImpl>
  get copyWith =>
      __$$VerificationStatusModelImplCopyWithImpl<
        _$VerificationStatusModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationStatusModelImplToJson(this);
  }
}

abstract class _VerificationStatusModel extends VerificationStatusModel {
  const factory _VerificationStatusModel({
    required final VerificationStatus status,
    required final VerifiedGender gender,
  }) = _$VerificationStatusModelImpl;
  const _VerificationStatusModel._() : super._();

  factory _VerificationStatusModel.fromJson(Map<String, dynamic> json) =
      _$VerificationStatusModelImpl.fromJson;

  @override
  VerificationStatus get status;
  @override
  VerifiedGender get gender;

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationStatusModelImplCopyWith<_$VerificationStatusModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
