// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoginButtonPressed value)?  loginButtonPressed,TResult Function( _NextStepPressed value)?  nextStepPressed,TResult Function( _RegisterButtonPressed value)?  registerButtonPressed,TResult Function( _VerifySmsButtonPressed value)?  verifySmsButtonPressed,TResult Function( _ResendOtpButtonPressed value)?  resendOtpButtonPressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that);case _NextStepPressed() when nextStepPressed != null:
return nextStepPressed(_that);case _RegisterButtonPressed() when registerButtonPressed != null:
return registerButtonPressed(_that);case _VerifySmsButtonPressed() when verifySmsButtonPressed != null:
return verifySmsButtonPressed(_that);case _ResendOtpButtonPressed() when resendOtpButtonPressed != null:
return resendOtpButtonPressed(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoginButtonPressed value)  loginButtonPressed,required TResult Function( _NextStepPressed value)  nextStepPressed,required TResult Function( _RegisterButtonPressed value)  registerButtonPressed,required TResult Function( _VerifySmsButtonPressed value)  verifySmsButtonPressed,required TResult Function( _ResendOtpButtonPressed value)  resendOtpButtonPressed,}){
final _that = this;
switch (_that) {
case _LoginButtonPressed():
return loginButtonPressed(_that);case _NextStepPressed():
return nextStepPressed(_that);case _RegisterButtonPressed():
return registerButtonPressed(_that);case _VerifySmsButtonPressed():
return verifySmsButtonPressed(_that);case _ResendOtpButtonPressed():
return resendOtpButtonPressed(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoginButtonPressed value)?  loginButtonPressed,TResult? Function( _NextStepPressed value)?  nextStepPressed,TResult? Function( _RegisterButtonPressed value)?  registerButtonPressed,TResult? Function( _VerifySmsButtonPressed value)?  verifySmsButtonPressed,TResult? Function( _ResendOtpButtonPressed value)?  resendOtpButtonPressed,}){
final _that = this;
switch (_that) {
case _LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that);case _NextStepPressed() when nextStepPressed != null:
return nextStepPressed(_that);case _RegisterButtonPressed() when registerButtonPressed != null:
return registerButtonPressed(_that);case _VerifySmsButtonPressed() when verifySmsButtonPressed != null:
return verifySmsButtonPressed(_that);case _ResendOtpButtonPressed() when resendOtpButtonPressed != null:
return resendOtpButtonPressed(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phoneNumber,  String password)?  loginButtonPressed,TResult Function( String phoneNumber,  String password)?  nextStepPressed,TResult Function( RegisterParams params,  File? profileImageFile)?  registerButtonPressed,TResult Function( String phoneNumber,  String otp)?  verifySmsButtonPressed,TResult Function( String phoneNumber,  String recaptchaToken)?  resendOtpButtonPressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that.phoneNumber,_that.password);case _NextStepPressed() when nextStepPressed != null:
return nextStepPressed(_that.phoneNumber,_that.password);case _RegisterButtonPressed() when registerButtonPressed != null:
return registerButtonPressed(_that.params,_that.profileImageFile);case _VerifySmsButtonPressed() when verifySmsButtonPressed != null:
return verifySmsButtonPressed(_that.phoneNumber,_that.otp);case _ResendOtpButtonPressed() when resendOtpButtonPressed != null:
return resendOtpButtonPressed(_that.phoneNumber,_that.recaptchaToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phoneNumber,  String password)  loginButtonPressed,required TResult Function( String phoneNumber,  String password)  nextStepPressed,required TResult Function( RegisterParams params,  File? profileImageFile)  registerButtonPressed,required TResult Function( String phoneNumber,  String otp)  verifySmsButtonPressed,required TResult Function( String phoneNumber,  String recaptchaToken)  resendOtpButtonPressed,}) {final _that = this;
switch (_that) {
case _LoginButtonPressed():
return loginButtonPressed(_that.phoneNumber,_that.password);case _NextStepPressed():
return nextStepPressed(_that.phoneNumber,_that.password);case _RegisterButtonPressed():
return registerButtonPressed(_that.params,_that.profileImageFile);case _VerifySmsButtonPressed():
return verifySmsButtonPressed(_that.phoneNumber,_that.otp);case _ResendOtpButtonPressed():
return resendOtpButtonPressed(_that.phoneNumber,_that.recaptchaToken);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phoneNumber,  String password)?  loginButtonPressed,TResult? Function( String phoneNumber,  String password)?  nextStepPressed,TResult? Function( RegisterParams params,  File? profileImageFile)?  registerButtonPressed,TResult? Function( String phoneNumber,  String otp)?  verifySmsButtonPressed,TResult? Function( String phoneNumber,  String recaptchaToken)?  resendOtpButtonPressed,}) {final _that = this;
switch (_that) {
case _LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that.phoneNumber,_that.password);case _NextStepPressed() when nextStepPressed != null:
return nextStepPressed(_that.phoneNumber,_that.password);case _RegisterButtonPressed() when registerButtonPressed != null:
return registerButtonPressed(_that.params,_that.profileImageFile);case _VerifySmsButtonPressed() when verifySmsButtonPressed != null:
return verifySmsButtonPressed(_that.phoneNumber,_that.otp);case _ResendOtpButtonPressed() when resendOtpButtonPressed != null:
return resendOtpButtonPressed(_that.phoneNumber,_that.recaptchaToken);case _:
  return null;

}
}

}

/// @nodoc


class _LoginButtonPressed implements AuthEvent {
  const _LoginButtonPressed({required this.phoneNumber, required this.password});
  

 final  String phoneNumber;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginButtonPressedCopyWith<_LoginButtonPressed> get copyWith => __$LoginButtonPressedCopyWithImpl<_LoginButtonPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginButtonPressed&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,password);

@override
String toString() {
  return 'AuthEvent.loginButtonPressed(phoneNumber: $phoneNumber, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginButtonPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginButtonPressedCopyWith(_LoginButtonPressed value, $Res Function(_LoginButtonPressed) _then) = __$LoginButtonPressedCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String password
});




}
/// @nodoc
class __$LoginButtonPressedCopyWithImpl<$Res>
    implements _$LoginButtonPressedCopyWith<$Res> {
  __$LoginButtonPressedCopyWithImpl(this._self, this._then);

  final _LoginButtonPressed _self;
  final $Res Function(_LoginButtonPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? password = null,}) {
  return _then(_LoginButtonPressed(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NextStepPressed implements AuthEvent {
  const _NextStepPressed({required this.phoneNumber, required this.password});
  

 final  String phoneNumber;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextStepPressedCopyWith<_NextStepPressed> get copyWith => __$NextStepPressedCopyWithImpl<_NextStepPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextStepPressed&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,password);

@override
String toString() {
  return 'AuthEvent.nextStepPressed(phoneNumber: $phoneNumber, password: $password)';
}


}

/// @nodoc
abstract mixin class _$NextStepPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$NextStepPressedCopyWith(_NextStepPressed value, $Res Function(_NextStepPressed) _then) = __$NextStepPressedCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String password
});




}
/// @nodoc
class __$NextStepPressedCopyWithImpl<$Res>
    implements _$NextStepPressedCopyWith<$Res> {
  __$NextStepPressedCopyWithImpl(this._self, this._then);

  final _NextStepPressed _self;
  final $Res Function(_NextStepPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? password = null,}) {
  return _then(_NextStepPressed(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RegisterButtonPressed implements AuthEvent {
  const _RegisterButtonPressed({required this.params, this.profileImageFile});
  

 final  RegisterParams params;
 final  File? profileImageFile;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterButtonPressedCopyWith<_RegisterButtonPressed> get copyWith => __$RegisterButtonPressedCopyWithImpl<_RegisterButtonPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterButtonPressed&&(identical(other.params, params) || other.params == params)&&(identical(other.profileImageFile, profileImageFile) || other.profileImageFile == profileImageFile));
}


@override
int get hashCode => Object.hash(runtimeType,params,profileImageFile);

@override
String toString() {
  return 'AuthEvent.registerButtonPressed(params: $params, profileImageFile: $profileImageFile)';
}


}

/// @nodoc
abstract mixin class _$RegisterButtonPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterButtonPressedCopyWith(_RegisterButtonPressed value, $Res Function(_RegisterButtonPressed) _then) = __$RegisterButtonPressedCopyWithImpl;
@useResult
$Res call({
 RegisterParams params, File? profileImageFile
});




}
/// @nodoc
class __$RegisterButtonPressedCopyWithImpl<$Res>
    implements _$RegisterButtonPressedCopyWith<$Res> {
  __$RegisterButtonPressedCopyWithImpl(this._self, this._then);

  final _RegisterButtonPressed _self;
  final $Res Function(_RegisterButtonPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,Object? profileImageFile = freezed,}) {
  return _then(_RegisterButtonPressed(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as RegisterParams,profileImageFile: freezed == profileImageFile ? _self.profileImageFile : profileImageFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

/// @nodoc


class _VerifySmsButtonPressed implements AuthEvent {
  const _VerifySmsButtonPressed({required this.phoneNumber, required this.otp});
  

 final  String phoneNumber;
 final  String otp;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifySmsButtonPressedCopyWith<_VerifySmsButtonPressed> get copyWith => __$VerifySmsButtonPressedCopyWithImpl<_VerifySmsButtonPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifySmsButtonPressed&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otp);

@override
String toString() {
  return 'AuthEvent.verifySmsButtonPressed(phoneNumber: $phoneNumber, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifySmsButtonPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$VerifySmsButtonPressedCopyWith(_VerifySmsButtonPressed value, $Res Function(_VerifySmsButtonPressed) _then) = __$VerifySmsButtonPressedCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String otp
});




}
/// @nodoc
class __$VerifySmsButtonPressedCopyWithImpl<$Res>
    implements _$VerifySmsButtonPressedCopyWith<$Res> {
  __$VerifySmsButtonPressedCopyWithImpl(this._self, this._then);

  final _VerifySmsButtonPressed _self;
  final $Res Function(_VerifySmsButtonPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? otp = null,}) {
  return _then(_VerifySmsButtonPressed(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResendOtpButtonPressed implements AuthEvent {
  const _ResendOtpButtonPressed({required this.phoneNumber, required this.recaptchaToken});
  

 final  String phoneNumber;
 final  String recaptchaToken;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendOtpButtonPressedCopyWith<_ResendOtpButtonPressed> get copyWith => __$ResendOtpButtonPressedCopyWithImpl<_ResendOtpButtonPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendOtpButtonPressed&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.recaptchaToken, recaptchaToken) || other.recaptchaToken == recaptchaToken));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,recaptchaToken);

@override
String toString() {
  return 'AuthEvent.resendOtpButtonPressed(phoneNumber: $phoneNumber, recaptchaToken: $recaptchaToken)';
}


}

/// @nodoc
abstract mixin class _$ResendOtpButtonPressedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ResendOtpButtonPressedCopyWith(_ResendOtpButtonPressed value, $Res Function(_ResendOtpButtonPressed) _then) = __$ResendOtpButtonPressedCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String recaptchaToken
});




}
/// @nodoc
class __$ResendOtpButtonPressedCopyWithImpl<$Res>
    implements _$ResendOtpButtonPressedCopyWith<$Res> {
  __$ResendOtpButtonPressedCopyWithImpl(this._self, this._then);

  final _ResendOtpButtonPressed _self;
  final $Res Function(_ResendOtpButtonPressed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? recaptchaToken = null,}) {
  return _then(_ResendOtpButtonPressed(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,recaptchaToken: null == recaptchaToken ? _self.recaptchaToken : recaptchaToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _LoginSuccess value)?  loginSuccess,TResult Function( _RegisterStep1Success value)?  registerStep1Success,TResult Function( _RegistrationSuccess value)?  registrationSuccess,TResult Function( _VerificationSuccess value)?  verificationSuccess,TResult Function( _OtpResent value)?  otpResent,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _RegisterStep1Success() when registerStep1Success != null:
return registerStep1Success(_that);case _RegistrationSuccess() when registrationSuccess != null:
return registrationSuccess(_that);case _VerificationSuccess() when verificationSuccess != null:
return verificationSuccess(_that);case _OtpResent() when otpResent != null:
return otpResent(_that);case _Failure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _LoginSuccess value)  loginSuccess,required TResult Function( _RegisterStep1Success value)  registerStep1Success,required TResult Function( _RegistrationSuccess value)  registrationSuccess,required TResult Function( _VerificationSuccess value)  verificationSuccess,required TResult Function( _OtpResent value)  otpResent,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _LoginSuccess():
return loginSuccess(_that);case _RegisterStep1Success():
return registerStep1Success(_that);case _RegistrationSuccess():
return registrationSuccess(_that);case _VerificationSuccess():
return verificationSuccess(_that);case _OtpResent():
return otpResent(_that);case _Failure():
return failure(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _LoginSuccess value)?  loginSuccess,TResult? Function( _RegisterStep1Success value)?  registerStep1Success,TResult? Function( _RegistrationSuccess value)?  registrationSuccess,TResult? Function( _VerificationSuccess value)?  verificationSuccess,TResult? Function( _OtpResent value)?  otpResent,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _RegisterStep1Success() when registerStep1Success != null:
return registerStep1Success(_that);case _RegistrationSuccess() when registrationSuccess != null:
return registrationSuccess(_that);case _VerificationSuccess() when verificationSuccess != null:
return verificationSuccess(_that);case _OtpResent() when otpResent != null:
return otpResent(_that);case _Failure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loginSuccess,TResult Function( String phoneNumber,  String password,  String recaptchaToken)?  registerStep1Success,TResult Function( String phoneNumber)?  registrationSuccess,TResult Function()?  verificationSuccess,TResult Function()?  otpResent,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoginSuccess() when loginSuccess != null:
return loginSuccess();case _RegisterStep1Success() when registerStep1Success != null:
return registerStep1Success(_that.phoneNumber,_that.password,_that.recaptchaToken);case _RegistrationSuccess() when registrationSuccess != null:
return registrationSuccess(_that.phoneNumber);case _VerificationSuccess() when verificationSuccess != null:
return verificationSuccess();case _OtpResent() when otpResent != null:
return otpResent();case _Failure() when failure != null:
return failure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loginSuccess,required TResult Function( String phoneNumber,  String password,  String recaptchaToken)  registerStep1Success,required TResult Function( String phoneNumber)  registrationSuccess,required TResult Function()  verificationSuccess,required TResult Function()  otpResent,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _LoginSuccess():
return loginSuccess();case _RegisterStep1Success():
return registerStep1Success(_that.phoneNumber,_that.password,_that.recaptchaToken);case _RegistrationSuccess():
return registrationSuccess(_that.phoneNumber);case _VerificationSuccess():
return verificationSuccess();case _OtpResent():
return otpResent();case _Failure():
return failure(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loginSuccess,TResult? Function( String phoneNumber,  String password,  String recaptchaToken)?  registerStep1Success,TResult? Function( String phoneNumber)?  registrationSuccess,TResult? Function()?  verificationSuccess,TResult? Function()?  otpResent,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoginSuccess() when loginSuccess != null:
return loginSuccess();case _RegisterStep1Success() when registerStep1Success != null:
return registerStep1Success(_that.phoneNumber,_that.password,_that.recaptchaToken);case _RegistrationSuccess() when registrationSuccess != null:
return registrationSuccess(_that.phoneNumber);case _VerificationSuccess() when verificationSuccess != null:
return verificationSuccess();case _OtpResent() when otpResent != null:
return otpResent();case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _Loading implements AuthState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _LoginSuccess implements AuthState {
  const _LoginSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loginSuccess()';
}


}




/// @nodoc


class _RegisterStep1Success implements AuthState {
  const _RegisterStep1Success({required this.phoneNumber, required this.password, required this.recaptchaToken});
  

 final  String phoneNumber;
 final  String password;
 final  String recaptchaToken;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStep1SuccessCopyWith<_RegisterStep1Success> get copyWith => __$RegisterStep1SuccessCopyWithImpl<_RegisterStep1Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterStep1Success&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password)&&(identical(other.recaptchaToken, recaptchaToken) || other.recaptchaToken == recaptchaToken));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,password,recaptchaToken);

@override
String toString() {
  return 'AuthState.registerStep1Success(phoneNumber: $phoneNumber, password: $password, recaptchaToken: $recaptchaToken)';
}


}

/// @nodoc
abstract mixin class _$RegisterStep1SuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$RegisterStep1SuccessCopyWith(_RegisterStep1Success value, $Res Function(_RegisterStep1Success) _then) = __$RegisterStep1SuccessCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String password, String recaptchaToken
});




}
/// @nodoc
class __$RegisterStep1SuccessCopyWithImpl<$Res>
    implements _$RegisterStep1SuccessCopyWith<$Res> {
  __$RegisterStep1SuccessCopyWithImpl(this._self, this._then);

  final _RegisterStep1Success _self;
  final $Res Function(_RegisterStep1Success) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? password = null,Object? recaptchaToken = null,}) {
  return _then(_RegisterStep1Success(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,recaptchaToken: null == recaptchaToken ? _self.recaptchaToken : recaptchaToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RegistrationSuccess implements AuthState {
  const _RegistrationSuccess({required this.phoneNumber});
  

 final  String phoneNumber;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationSuccessCopyWith<_RegistrationSuccess> get copyWith => __$RegistrationSuccessCopyWithImpl<_RegistrationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationSuccess&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber);

@override
String toString() {
  return 'AuthState.registrationSuccess(phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$RegistrationSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$RegistrationSuccessCopyWith(_RegistrationSuccess value, $Res Function(_RegistrationSuccess) _then) = __$RegistrationSuccessCopyWithImpl;
@useResult
$Res call({
 String phoneNumber
});




}
/// @nodoc
class __$RegistrationSuccessCopyWithImpl<$Res>
    implements _$RegistrationSuccessCopyWith<$Res> {
  __$RegistrationSuccessCopyWithImpl(this._self, this._then);

  final _RegistrationSuccess _self;
  final $Res Function(_RegistrationSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,}) {
  return _then(_RegistrationSuccess(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _VerificationSuccess implements AuthState {
  const _VerificationSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.verificationSuccess()';
}


}




/// @nodoc


class _OtpResent implements AuthState {
  const _OtpResent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpResent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.otpResent()';
}


}




/// @nodoc


class _Failure implements AuthState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
