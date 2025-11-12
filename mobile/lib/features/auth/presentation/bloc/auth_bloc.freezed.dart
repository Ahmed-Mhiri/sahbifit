// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password)
    loginButtonPressed,
    required TResult Function(RegisterParams params) registerButtonPressed,
    required TResult Function(String phoneNumber, String otp)
    verifySmsButtonPressed,
    required TResult Function(String phoneNumber, String recaptchaToken)
    resendOtpButtonPressed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? loginButtonPressed,
    TResult? Function(RegisterParams params)? registerButtonPressed,
    TResult? Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult? Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? loginButtonPressed,
    TResult Function(RegisterParams params)? registerButtonPressed,
    TResult Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginButtonPressed value) loginButtonPressed,
    required TResult Function(_RegisterButtonPressed value)
    registerButtonPressed,
    required TResult Function(_VerifySmsButtonPressed value)
    verifySmsButtonPressed,
    required TResult Function(_ResendOtpButtonPressed value)
    resendOtpButtonPressed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult? Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult? Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult? Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginButtonPressedImplCopyWith<$Res> {
  factory _$$LoginButtonPressedImplCopyWith(
    _$LoginButtonPressedImpl value,
    $Res Function(_$LoginButtonPressedImpl) then,
  ) = __$$LoginButtonPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String password});
}

/// @nodoc
class __$$LoginButtonPressedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginButtonPressedImpl>
    implements _$$LoginButtonPressedImplCopyWith<$Res> {
  __$$LoginButtonPressedImplCopyWithImpl(
    _$LoginButtonPressedImpl _value,
    $Res Function(_$LoginButtonPressedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null, Object? password = null}) {
    return _then(
      _$LoginButtonPressedImpl(
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginButtonPressedImpl implements _LoginButtonPressed {
  const _$LoginButtonPressedImpl({
    required this.phoneNumber,
    required this.password,
  });

  @override
  final String phoneNumber;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.loginButtonPressed(phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginButtonPressedImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginButtonPressedImplCopyWith<_$LoginButtonPressedImpl> get copyWith =>
      __$$LoginButtonPressedImplCopyWithImpl<_$LoginButtonPressedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password)
    loginButtonPressed,
    required TResult Function(RegisterParams params) registerButtonPressed,
    required TResult Function(String phoneNumber, String otp)
    verifySmsButtonPressed,
    required TResult Function(String phoneNumber, String recaptchaToken)
    resendOtpButtonPressed,
  }) {
    return loginButtonPressed(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? loginButtonPressed,
    TResult? Function(RegisterParams params)? registerButtonPressed,
    TResult? Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult? Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
  }) {
    return loginButtonPressed?.call(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? loginButtonPressed,
    TResult Function(RegisterParams params)? registerButtonPressed,
    TResult Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
    required TResult orElse(),
  }) {
    if (loginButtonPressed != null) {
      return loginButtonPressed(phoneNumber, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginButtonPressed value) loginButtonPressed,
    required TResult Function(_RegisterButtonPressed value)
    registerButtonPressed,
    required TResult Function(_VerifySmsButtonPressed value)
    verifySmsButtonPressed,
    required TResult Function(_ResendOtpButtonPressed value)
    resendOtpButtonPressed,
  }) {
    return loginButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult? Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult? Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult? Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
  }) {
    return loginButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
    required TResult orElse(),
  }) {
    if (loginButtonPressed != null) {
      return loginButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _LoginButtonPressed implements AuthEvent {
  const factory _LoginButtonPressed({
    required final String phoneNumber,
    required final String password,
  }) = _$LoginButtonPressedImpl;

  String get phoneNumber;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginButtonPressedImplCopyWith<_$LoginButtonPressedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterButtonPressedImplCopyWith<$Res> {
  factory _$$RegisterButtonPressedImplCopyWith(
    _$RegisterButtonPressedImpl value,
    $Res Function(_$RegisterButtonPressedImpl) then,
  ) = __$$RegisterButtonPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterParams params});
}

/// @nodoc
class __$$RegisterButtonPressedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterButtonPressedImpl>
    implements _$$RegisterButtonPressedImplCopyWith<$Res> {
  __$$RegisterButtonPressedImplCopyWithImpl(
    _$RegisterButtonPressedImpl _value,
    $Res Function(_$RegisterButtonPressedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? params = null}) {
    return _then(
      _$RegisterButtonPressedImpl(
        params: null == params
            ? _value.params
            : params // ignore: cast_nullable_to_non_nullable
                  as RegisterParams,
      ),
    );
  }
}

/// @nodoc

class _$RegisterButtonPressedImpl implements _RegisterButtonPressed {
  const _$RegisterButtonPressedImpl({required this.params});

  @override
  final RegisterParams params;

  @override
  String toString() {
    return 'AuthEvent.registerButtonPressed(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterButtonPressedImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterButtonPressedImplCopyWith<_$RegisterButtonPressedImpl>
  get copyWith =>
      __$$RegisterButtonPressedImplCopyWithImpl<_$RegisterButtonPressedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password)
    loginButtonPressed,
    required TResult Function(RegisterParams params) registerButtonPressed,
    required TResult Function(String phoneNumber, String otp)
    verifySmsButtonPressed,
    required TResult Function(String phoneNumber, String recaptchaToken)
    resendOtpButtonPressed,
  }) {
    return registerButtonPressed(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? loginButtonPressed,
    TResult? Function(RegisterParams params)? registerButtonPressed,
    TResult? Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult? Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
  }) {
    return registerButtonPressed?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? loginButtonPressed,
    TResult Function(RegisterParams params)? registerButtonPressed,
    TResult Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
    required TResult orElse(),
  }) {
    if (registerButtonPressed != null) {
      return registerButtonPressed(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginButtonPressed value) loginButtonPressed,
    required TResult Function(_RegisterButtonPressed value)
    registerButtonPressed,
    required TResult Function(_VerifySmsButtonPressed value)
    verifySmsButtonPressed,
    required TResult Function(_ResendOtpButtonPressed value)
    resendOtpButtonPressed,
  }) {
    return registerButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult? Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult? Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult? Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
  }) {
    return registerButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
    required TResult orElse(),
  }) {
    if (registerButtonPressed != null) {
      return registerButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _RegisterButtonPressed implements AuthEvent {
  const factory _RegisterButtonPressed({required final RegisterParams params}) =
      _$RegisterButtonPressedImpl;

  RegisterParams get params;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterButtonPressedImplCopyWith<_$RegisterButtonPressedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifySmsButtonPressedImplCopyWith<$Res> {
  factory _$$VerifySmsButtonPressedImplCopyWith(
    _$VerifySmsButtonPressedImpl value,
    $Res Function(_$VerifySmsButtonPressedImpl) then,
  ) = __$$VerifySmsButtonPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String otp});
}

/// @nodoc
class __$$VerifySmsButtonPressedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifySmsButtonPressedImpl>
    implements _$$VerifySmsButtonPressedImplCopyWith<$Res> {
  __$$VerifySmsButtonPressedImplCopyWithImpl(
    _$VerifySmsButtonPressedImpl _value,
    $Res Function(_$VerifySmsButtonPressedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null, Object? otp = null}) {
    return _then(
      _$VerifySmsButtonPressedImpl(
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

class _$VerifySmsButtonPressedImpl implements _VerifySmsButtonPressed {
  const _$VerifySmsButtonPressedImpl({
    required this.phoneNumber,
    required this.otp,
  });

  @override
  final String phoneNumber;
  @override
  final String otp;

  @override
  String toString() {
    return 'AuthEvent.verifySmsButtonPressed(phoneNumber: $phoneNumber, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifySmsButtonPressedImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifySmsButtonPressedImplCopyWith<_$VerifySmsButtonPressedImpl>
  get copyWith =>
      __$$VerifySmsButtonPressedImplCopyWithImpl<_$VerifySmsButtonPressedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password)
    loginButtonPressed,
    required TResult Function(RegisterParams params) registerButtonPressed,
    required TResult Function(String phoneNumber, String otp)
    verifySmsButtonPressed,
    required TResult Function(String phoneNumber, String recaptchaToken)
    resendOtpButtonPressed,
  }) {
    return verifySmsButtonPressed(phoneNumber, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? loginButtonPressed,
    TResult? Function(RegisterParams params)? registerButtonPressed,
    TResult? Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult? Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
  }) {
    return verifySmsButtonPressed?.call(phoneNumber, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? loginButtonPressed,
    TResult Function(RegisterParams params)? registerButtonPressed,
    TResult Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
    required TResult orElse(),
  }) {
    if (verifySmsButtonPressed != null) {
      return verifySmsButtonPressed(phoneNumber, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginButtonPressed value) loginButtonPressed,
    required TResult Function(_RegisterButtonPressed value)
    registerButtonPressed,
    required TResult Function(_VerifySmsButtonPressed value)
    verifySmsButtonPressed,
    required TResult Function(_ResendOtpButtonPressed value)
    resendOtpButtonPressed,
  }) {
    return verifySmsButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult? Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult? Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult? Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
  }) {
    return verifySmsButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
    required TResult orElse(),
  }) {
    if (verifySmsButtonPressed != null) {
      return verifySmsButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _VerifySmsButtonPressed implements AuthEvent {
  const factory _VerifySmsButtonPressed({
    required final String phoneNumber,
    required final String otp,
  }) = _$VerifySmsButtonPressedImpl;

  String get phoneNumber;
  String get otp;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifySmsButtonPressedImplCopyWith<_$VerifySmsButtonPressedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendOtpButtonPressedImplCopyWith<$Res> {
  factory _$$ResendOtpButtonPressedImplCopyWith(
    _$ResendOtpButtonPressedImpl value,
    $Res Function(_$ResendOtpButtonPressedImpl) then,
  ) = __$$ResendOtpButtonPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String recaptchaToken});
}

/// @nodoc
class __$$ResendOtpButtonPressedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResendOtpButtonPressedImpl>
    implements _$$ResendOtpButtonPressedImplCopyWith<$Res> {
  __$$ResendOtpButtonPressedImplCopyWithImpl(
    _$ResendOtpButtonPressedImpl _value,
    $Res Function(_$ResendOtpButtonPressedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null, Object? recaptchaToken = null}) {
    return _then(
      _$ResendOtpButtonPressedImpl(
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

class _$ResendOtpButtonPressedImpl implements _ResendOtpButtonPressed {
  const _$ResendOtpButtonPressedImpl({
    required this.phoneNumber,
    required this.recaptchaToken,
  });

  @override
  final String phoneNumber;
  @override
  final String recaptchaToken;

  @override
  String toString() {
    return 'AuthEvent.resendOtpButtonPressed(phoneNumber: $phoneNumber, recaptchaToken: $recaptchaToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendOtpButtonPressedImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.recaptchaToken, recaptchaToken) ||
                other.recaptchaToken == recaptchaToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, recaptchaToken);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendOtpButtonPressedImplCopyWith<_$ResendOtpButtonPressedImpl>
  get copyWith =>
      __$$ResendOtpButtonPressedImplCopyWithImpl<_$ResendOtpButtonPressedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password)
    loginButtonPressed,
    required TResult Function(RegisterParams params) registerButtonPressed,
    required TResult Function(String phoneNumber, String otp)
    verifySmsButtonPressed,
    required TResult Function(String phoneNumber, String recaptchaToken)
    resendOtpButtonPressed,
  }) {
    return resendOtpButtonPressed(phoneNumber, recaptchaToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? loginButtonPressed,
    TResult? Function(RegisterParams params)? registerButtonPressed,
    TResult? Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult? Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
  }) {
    return resendOtpButtonPressed?.call(phoneNumber, recaptchaToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? loginButtonPressed,
    TResult Function(RegisterParams params)? registerButtonPressed,
    TResult Function(String phoneNumber, String otp)? verifySmsButtonPressed,
    TResult Function(String phoneNumber, String recaptchaToken)?
    resendOtpButtonPressed,
    required TResult orElse(),
  }) {
    if (resendOtpButtonPressed != null) {
      return resendOtpButtonPressed(phoneNumber, recaptchaToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginButtonPressed value) loginButtonPressed,
    required TResult Function(_RegisterButtonPressed value)
    registerButtonPressed,
    required TResult Function(_VerifySmsButtonPressed value)
    verifySmsButtonPressed,
    required TResult Function(_ResendOtpButtonPressed value)
    resendOtpButtonPressed,
  }) {
    return resendOtpButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult? Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult? Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult? Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
  }) {
    return resendOtpButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginButtonPressed value)? loginButtonPressed,
    TResult Function(_RegisterButtonPressed value)? registerButtonPressed,
    TResult Function(_VerifySmsButtonPressed value)? verifySmsButtonPressed,
    TResult Function(_ResendOtpButtonPressed value)? resendOtpButtonPressed,
    required TResult orElse(),
  }) {
    if (resendOtpButtonPressed != null) {
      return resendOtpButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _ResendOtpButtonPressed implements AuthEvent {
  const factory _ResendOtpButtonPressed({
    required final String phoneNumber,
    required final String recaptchaToken,
  }) = _$ResendOtpButtonPressedImpl;

  String get phoneNumber;
  String get recaptchaToken;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendOtpButtonPressedImplCopyWith<_$ResendOtpButtonPressedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function(String phoneNumber) registrationSuccess,
    required TResult Function() verificationSuccess,
    required TResult Function() otpResent,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function(String phoneNumber)? registrationSuccess,
    TResult? Function()? verificationSuccess,
    TResult? Function()? otpResent,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function(String phoneNumber)? registrationSuccess,
    TResult Function()? verificationSuccess,
    TResult Function()? otpResent,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_Failure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_Failure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function(String phoneNumber) registrationSuccess,
    required TResult Function() verificationSuccess,
    required TResult Function() otpResent,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function(String phoneNumber)? registrationSuccess,
    TResult? Function()? verificationSuccess,
    TResult? Function()? otpResent,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function(String phoneNumber)? registrationSuccess,
    TResult Function()? verificationSuccess,
    TResult Function()? otpResent,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function(String phoneNumber) registrationSuccess,
    required TResult Function() verificationSuccess,
    required TResult Function() otpResent,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function(String phoneNumber)? registrationSuccess,
    TResult? Function()? verificationSuccess,
    TResult? Function()? otpResent,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function(String phoneNumber)? registrationSuccess,
    TResult Function()? verificationSuccess,
    TResult Function()? otpResent,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<$Res> {
  factory _$$LoginSuccessImplCopyWith(
    _$LoginSuccessImpl value,
    $Res Function(_$LoginSuccessImpl) then,
  ) = __$$LoginSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoginSuccessImpl>
    implements _$$LoginSuccessImplCopyWith<$Res> {
  __$$LoginSuccessImplCopyWithImpl(
    _$LoginSuccessImpl _value,
    $Res Function(_$LoginSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginSuccessImpl implements _LoginSuccess {
  const _$LoginSuccessImpl();

  @override
  String toString() {
    return 'AuthState.loginSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function(String phoneNumber) registrationSuccess,
    required TResult Function() verificationSuccess,
    required TResult Function() otpResent,
    required TResult Function(String message) failure,
  }) {
    return loginSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function(String phoneNumber)? registrationSuccess,
    TResult? Function()? verificationSuccess,
    TResult? Function()? otpResent,
    TResult? Function(String message)? failure,
  }) {
    return loginSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function(String phoneNumber)? registrationSuccess,
    TResult Function()? verificationSuccess,
    TResult Function()? otpResent,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_Failure value) failure,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_Failure value)? failure,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccess implements AuthState {
  const factory _LoginSuccess() = _$LoginSuccessImpl;
}

/// @nodoc
abstract class _$$RegistrationSuccessImplCopyWith<$Res> {
  factory _$$RegistrationSuccessImplCopyWith(
    _$RegistrationSuccessImpl value,
    $Res Function(_$RegistrationSuccessImpl) then,
  ) = __$$RegistrationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$RegistrationSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$RegistrationSuccessImpl>
    implements _$$RegistrationSuccessImplCopyWith<$Res> {
  __$$RegistrationSuccessImplCopyWithImpl(
    _$RegistrationSuccessImpl _value,
    $Res Function(_$RegistrationSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null}) {
    return _then(
      _$RegistrationSuccessImpl(
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RegistrationSuccessImpl implements _RegistrationSuccess {
  const _$RegistrationSuccessImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthState.registrationSuccess(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationSuccessImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationSuccessImplCopyWith<_$RegistrationSuccessImpl> get copyWith =>
      __$$RegistrationSuccessImplCopyWithImpl<_$RegistrationSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function(String phoneNumber) registrationSuccess,
    required TResult Function() verificationSuccess,
    required TResult Function() otpResent,
    required TResult Function(String message) failure,
  }) {
    return registrationSuccess(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function(String phoneNumber)? registrationSuccess,
    TResult? Function()? verificationSuccess,
    TResult? Function()? otpResent,
    TResult? Function(String message)? failure,
  }) {
    return registrationSuccess?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function(String phoneNumber)? registrationSuccess,
    TResult Function()? verificationSuccess,
    TResult Function()? otpResent,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (registrationSuccess != null) {
      return registrationSuccess(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_Failure value) failure,
  }) {
    return registrationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_Failure value)? failure,
  }) {
    return registrationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (registrationSuccess != null) {
      return registrationSuccess(this);
    }
    return orElse();
  }
}

abstract class _RegistrationSuccess implements AuthState {
  const factory _RegistrationSuccess({required final String phoneNumber}) =
      _$RegistrationSuccessImpl;

  String get phoneNumber;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationSuccessImplCopyWith<_$RegistrationSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationSuccessImplCopyWith<$Res> {
  factory _$$VerificationSuccessImplCopyWith(
    _$VerificationSuccessImpl value,
    $Res Function(_$VerificationSuccessImpl) then,
  ) = __$$VerificationSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerificationSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerificationSuccessImpl>
    implements _$$VerificationSuccessImplCopyWith<$Res> {
  __$$VerificationSuccessImplCopyWithImpl(
    _$VerificationSuccessImpl _value,
    $Res Function(_$VerificationSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerificationSuccessImpl implements _VerificationSuccess {
  const _$VerificationSuccessImpl();

  @override
  String toString() {
    return 'AuthState.verificationSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function(String phoneNumber) registrationSuccess,
    required TResult Function() verificationSuccess,
    required TResult Function() otpResent,
    required TResult Function(String message) failure,
  }) {
    return verificationSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function(String phoneNumber)? registrationSuccess,
    TResult? Function()? verificationSuccess,
    TResult? Function()? otpResent,
    TResult? Function(String message)? failure,
  }) {
    return verificationSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function(String phoneNumber)? registrationSuccess,
    TResult Function()? verificationSuccess,
    TResult Function()? otpResent,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (verificationSuccess != null) {
      return verificationSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_Failure value) failure,
  }) {
    return verificationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_Failure value)? failure,
  }) {
    return verificationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (verificationSuccess != null) {
      return verificationSuccess(this);
    }
    return orElse();
  }
}

abstract class _VerificationSuccess implements AuthState {
  const factory _VerificationSuccess() = _$VerificationSuccessImpl;
}

/// @nodoc
abstract class _$$OtpResentImplCopyWith<$Res> {
  factory _$$OtpResentImplCopyWith(
    _$OtpResentImpl value,
    $Res Function(_$OtpResentImpl) then,
  ) = __$$OtpResentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtpResentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$OtpResentImpl>
    implements _$$OtpResentImplCopyWith<$Res> {
  __$$OtpResentImplCopyWithImpl(
    _$OtpResentImpl _value,
    $Res Function(_$OtpResentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OtpResentImpl implements _OtpResent {
  const _$OtpResentImpl();

  @override
  String toString() {
    return 'AuthState.otpResent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtpResentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function(String phoneNumber) registrationSuccess,
    required TResult Function() verificationSuccess,
    required TResult Function() otpResent,
    required TResult Function(String message) failure,
  }) {
    return otpResent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function(String phoneNumber)? registrationSuccess,
    TResult? Function()? verificationSuccess,
    TResult? Function()? otpResent,
    TResult? Function(String message)? failure,
  }) {
    return otpResent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function(String phoneNumber)? registrationSuccess,
    TResult Function()? verificationSuccess,
    TResult Function()? otpResent,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (otpResent != null) {
      return otpResent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_Failure value) failure,
  }) {
    return otpResent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_Failure value)? failure,
  }) {
    return otpResent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (otpResent != null) {
      return otpResent(this);
    }
    return orElse();
  }
}

abstract class _OtpResent implements AuthState {
  const factory _OtpResent() = _$OtpResentImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
    _$FailureImpl value,
    $Res Function(_$FailureImpl) then,
  ) = __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
    _$FailureImpl _value,
    $Res Function(_$FailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$FailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function(String phoneNumber) registrationSuccess,
    required TResult Function() verificationSuccess,
    required TResult Function() otpResent,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function(String phoneNumber)? registrationSuccess,
    TResult? Function()? verificationSuccess,
    TResult? Function()? otpResent,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function(String phoneNumber)? registrationSuccess,
    TResult Function()? verificationSuccess,
    TResult Function()? otpResent,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AuthState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
