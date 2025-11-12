// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_sms_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VerifySmsRequestModel _$VerifySmsRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _VerifySmsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$VerifySmsRequestModel {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  /// Serializes this VerifySmsRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifySmsRequestModelCopyWith<VerifySmsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifySmsRequestModelCopyWith<$Res> {
  factory $VerifySmsRequestModelCopyWith(
    VerifySmsRequestModel value,
    $Res Function(VerifySmsRequestModel) then,
  ) = _$VerifySmsRequestModelCopyWithImpl<$Res, VerifySmsRequestModel>;
  @useResult
  $Res call({String phoneNumber, String otp});
}

/// @nodoc
class _$VerifySmsRequestModelCopyWithImpl<
  $Res,
  $Val extends VerifySmsRequestModel
>
    implements $VerifySmsRequestModelCopyWith<$Res> {
  _$VerifySmsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null, Object? otp = null}) {
    return _then(
      _value.copyWith(
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            otp: null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifySmsRequestModelImplCopyWith<$Res>
    implements $VerifySmsRequestModelCopyWith<$Res> {
  factory _$$VerifySmsRequestModelImplCopyWith(
    _$VerifySmsRequestModelImpl value,
    $Res Function(_$VerifySmsRequestModelImpl) then,
  ) = __$$VerifySmsRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String otp});
}

/// @nodoc
class __$$VerifySmsRequestModelImplCopyWithImpl<$Res>
    extends
        _$VerifySmsRequestModelCopyWithImpl<$Res, _$VerifySmsRequestModelImpl>
    implements _$$VerifySmsRequestModelImplCopyWith<$Res> {
  __$$VerifySmsRequestModelImplCopyWithImpl(
    _$VerifySmsRequestModelImpl _value,
    $Res Function(_$VerifySmsRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null, Object? otp = null}) {
    return _then(
      _$VerifySmsRequestModelImpl(
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        otp: null == otp
            ? _value.otp
            : otp // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$VerifySmsRequestModelImpl implements _VerifySmsRequestModel {
  const _$VerifySmsRequestModelImpl({
    required this.phoneNumber,
    required this.otp,
  });

  factory _$VerifySmsRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifySmsRequestModelImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String otp;

  @override
  String toString() {
    return 'VerifySmsRequestModel(phoneNumber: $phoneNumber, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifySmsRequestModelImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp);

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifySmsRequestModelImplCopyWith<_$VerifySmsRequestModelImpl>
  get copyWith =>
      __$$VerifySmsRequestModelImplCopyWithImpl<_$VerifySmsRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifySmsRequestModelImplToJson(this);
  }
}

abstract class _VerifySmsRequestModel implements VerifySmsRequestModel {
  const factory _VerifySmsRequestModel({
    required final String phoneNumber,
    required final String otp,
  }) = _$VerifySmsRequestModelImpl;

  factory _VerifySmsRequestModel.fromJson(Map<String, dynamic> json) =
      _$VerifySmsRequestModelImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get otp;

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifySmsRequestModelImplCopyWith<_$VerifySmsRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
