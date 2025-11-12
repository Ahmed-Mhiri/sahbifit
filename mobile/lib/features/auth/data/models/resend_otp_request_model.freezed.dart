// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_otp_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResendOtpRequestModel _$ResendOtpRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _ResendOtpRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ResendOtpRequestModel {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get recaptchaToken => throw _privateConstructorUsedError;

  /// Serializes this ResendOtpRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResendOtpRequestModelCopyWith<ResendOtpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendOtpRequestModelCopyWith<$Res> {
  factory $ResendOtpRequestModelCopyWith(
    ResendOtpRequestModel value,
    $Res Function(ResendOtpRequestModel) then,
  ) = _$ResendOtpRequestModelCopyWithImpl<$Res, ResendOtpRequestModel>;
  @useResult
  $Res call({String phoneNumber, String recaptchaToken});
}

/// @nodoc
class _$ResendOtpRequestModelCopyWithImpl<
  $Res,
  $Val extends ResendOtpRequestModel
>
    implements $ResendOtpRequestModelCopyWith<$Res> {
  _$ResendOtpRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null, Object? recaptchaToken = null}) {
    return _then(
      _value.copyWith(
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            recaptchaToken: null == recaptchaToken
                ? _value.recaptchaToken
                : recaptchaToken // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResendOtpRequestModelImplCopyWith<$Res>
    implements $ResendOtpRequestModelCopyWith<$Res> {
  factory _$$ResendOtpRequestModelImplCopyWith(
    _$ResendOtpRequestModelImpl value,
    $Res Function(_$ResendOtpRequestModelImpl) then,
  ) = __$$ResendOtpRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String recaptchaToken});
}

/// @nodoc
class __$$ResendOtpRequestModelImplCopyWithImpl<$Res>
    extends
        _$ResendOtpRequestModelCopyWithImpl<$Res, _$ResendOtpRequestModelImpl>
    implements _$$ResendOtpRequestModelImplCopyWith<$Res> {
  __$$ResendOtpRequestModelImplCopyWithImpl(
    _$ResendOtpRequestModelImpl _value,
    $Res Function(_$ResendOtpRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null, Object? recaptchaToken = null}) {
    return _then(
      _$ResendOtpRequestModelImpl(
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        recaptchaToken: null == recaptchaToken
            ? _value.recaptchaToken
            : recaptchaToken // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$ResendOtpRequestModelImpl implements _ResendOtpRequestModel {
  const _$ResendOtpRequestModelImpl({
    required this.phoneNumber,
    required this.recaptchaToken,
  });

  factory _$ResendOtpRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResendOtpRequestModelImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String recaptchaToken;

  @override
  String toString() {
    return 'ResendOtpRequestModel(phoneNumber: $phoneNumber, recaptchaToken: $recaptchaToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendOtpRequestModelImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.recaptchaToken, recaptchaToken) ||
                other.recaptchaToken == recaptchaToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, recaptchaToken);

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendOtpRequestModelImplCopyWith<_$ResendOtpRequestModelImpl>
  get copyWith =>
      __$$ResendOtpRequestModelImplCopyWithImpl<_$ResendOtpRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResendOtpRequestModelImplToJson(this);
  }
}

abstract class _ResendOtpRequestModel implements ResendOtpRequestModel {
  const factory _ResendOtpRequestModel({
    required final String phoneNumber,
    required final String recaptchaToken,
  }) = _$ResendOtpRequestModelImpl;

  factory _ResendOtpRequestModel.fromJson(Map<String, dynamic> json) =
      _$ResendOtpRequestModelImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get recaptchaToken;

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendOtpRequestModelImplCopyWith<_$ResendOtpRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
