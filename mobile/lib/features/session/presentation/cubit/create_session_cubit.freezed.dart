// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateSessionState {

 CreateSessionStatus get status; String get title; Gym? get selectedGym; SessionType get sessionType; DateTime get startTime; DateTime get endTime; int get maxParticipants; String? get errorMessage; Session? get createdSession;
/// Create a copy of CreateSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSessionStateCopyWith<CreateSessionState> get copyWith => _$CreateSessionStateCopyWithImpl<CreateSessionState>(this as CreateSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSessionState&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.selectedGym, selectedGym) || other.selectedGym == selectedGym)&&(identical(other.sessionType, sessionType) || other.sessionType == sessionType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdSession, createdSession) || other.createdSession == createdSession));
}


@override
int get hashCode => Object.hash(runtimeType,status,title,selectedGym,sessionType,startTime,endTime,maxParticipants,errorMessage,createdSession);

@override
String toString() {
  return 'CreateSessionState(status: $status, title: $title, selectedGym: $selectedGym, sessionType: $sessionType, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants, errorMessage: $errorMessage, createdSession: $createdSession)';
}


}

/// @nodoc
abstract mixin class $CreateSessionStateCopyWith<$Res>  {
  factory $CreateSessionStateCopyWith(CreateSessionState value, $Res Function(CreateSessionState) _then) = _$CreateSessionStateCopyWithImpl;
@useResult
$Res call({
 CreateSessionStatus status, String title, Gym? selectedGym, SessionType sessionType, DateTime startTime, DateTime endTime, int maxParticipants, String? errorMessage, Session? createdSession
});




}
/// @nodoc
class _$CreateSessionStateCopyWithImpl<$Res>
    implements $CreateSessionStateCopyWith<$Res> {
  _$CreateSessionStateCopyWithImpl(this._self, this._then);

  final CreateSessionState _self;
  final $Res Function(CreateSessionState) _then;

/// Create a copy of CreateSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? title = null,Object? selectedGym = freezed,Object? sessionType = null,Object? startTime = null,Object? endTime = null,Object? maxParticipants = null,Object? errorMessage = freezed,Object? createdSession = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateSessionStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,selectedGym: freezed == selectedGym ? _self.selectedGym : selectedGym // ignore: cast_nullable_to_non_nullable
as Gym?,sessionType: null == sessionType ? _self.sessionType : sessionType // ignore: cast_nullable_to_non_nullable
as SessionType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdSession: freezed == createdSession ? _self.createdSession : createdSession // ignore: cast_nullable_to_non_nullable
as Session?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSessionState].
extension CreateSessionStatePatterns on CreateSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSessionState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSessionState value)  $default,){
final _that = this;
switch (_that) {
case _CreateSessionState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSessionState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateSessionStatus status,  String title,  Gym? selectedGym,  SessionType sessionType,  DateTime startTime,  DateTime endTime,  int maxParticipants,  String? errorMessage,  Session? createdSession)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSessionState() when $default != null:
return $default(_that.status,_that.title,_that.selectedGym,_that.sessionType,_that.startTime,_that.endTime,_that.maxParticipants,_that.errorMessage,_that.createdSession);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateSessionStatus status,  String title,  Gym? selectedGym,  SessionType sessionType,  DateTime startTime,  DateTime endTime,  int maxParticipants,  String? errorMessage,  Session? createdSession)  $default,) {final _that = this;
switch (_that) {
case _CreateSessionState():
return $default(_that.status,_that.title,_that.selectedGym,_that.sessionType,_that.startTime,_that.endTime,_that.maxParticipants,_that.errorMessage,_that.createdSession);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateSessionStatus status,  String title,  Gym? selectedGym,  SessionType sessionType,  DateTime startTime,  DateTime endTime,  int maxParticipants,  String? errorMessage,  Session? createdSession)?  $default,) {final _that = this;
switch (_that) {
case _CreateSessionState() when $default != null:
return $default(_that.status,_that.title,_that.selectedGym,_that.sessionType,_that.startTime,_that.endTime,_that.maxParticipants,_that.errorMessage,_that.createdSession);case _:
  return null;

}
}

}

/// @nodoc


class _CreateSessionState implements CreateSessionState {
  const _CreateSessionState({this.status = CreateSessionStatus.initial, this.title = '', this.selectedGym, this.sessionType = SessionType.group, required this.startTime, required this.endTime, this.maxParticipants = 3, this.errorMessage, this.createdSession});
  

@override@JsonKey() final  CreateSessionStatus status;
@override@JsonKey() final  String title;
@override final  Gym? selectedGym;
@override@JsonKey() final  SessionType sessionType;
@override final  DateTime startTime;
@override final  DateTime endTime;
@override@JsonKey() final  int maxParticipants;
@override final  String? errorMessage;
@override final  Session? createdSession;

/// Create a copy of CreateSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSessionStateCopyWith<_CreateSessionState> get copyWith => __$CreateSessionStateCopyWithImpl<_CreateSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSessionState&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.selectedGym, selectedGym) || other.selectedGym == selectedGym)&&(identical(other.sessionType, sessionType) || other.sessionType == sessionType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdSession, createdSession) || other.createdSession == createdSession));
}


@override
int get hashCode => Object.hash(runtimeType,status,title,selectedGym,sessionType,startTime,endTime,maxParticipants,errorMessage,createdSession);

@override
String toString() {
  return 'CreateSessionState(status: $status, title: $title, selectedGym: $selectedGym, sessionType: $sessionType, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants, errorMessage: $errorMessage, createdSession: $createdSession)';
}


}

/// @nodoc
abstract mixin class _$CreateSessionStateCopyWith<$Res> implements $CreateSessionStateCopyWith<$Res> {
  factory _$CreateSessionStateCopyWith(_CreateSessionState value, $Res Function(_CreateSessionState) _then) = __$CreateSessionStateCopyWithImpl;
@override @useResult
$Res call({
 CreateSessionStatus status, String title, Gym? selectedGym, SessionType sessionType, DateTime startTime, DateTime endTime, int maxParticipants, String? errorMessage, Session? createdSession
});




}
/// @nodoc
class __$CreateSessionStateCopyWithImpl<$Res>
    implements _$CreateSessionStateCopyWith<$Res> {
  __$CreateSessionStateCopyWithImpl(this._self, this._then);

  final _CreateSessionState _self;
  final $Res Function(_CreateSessionState) _then;

/// Create a copy of CreateSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? title = null,Object? selectedGym = freezed,Object? sessionType = null,Object? startTime = null,Object? endTime = null,Object? maxParticipants = null,Object? errorMessage = freezed,Object? createdSession = freezed,}) {
  return _then(_CreateSessionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateSessionStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,selectedGym: freezed == selectedGym ? _self.selectedGym : selectedGym // ignore: cast_nullable_to_non_nullable
as Gym?,sessionType: null == sessionType ? _self.sessionType : sessionType // ignore: cast_nullable_to_non_nullable
as SessionType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdSession: freezed == createdSession ? _self.createdSession : createdSession // ignore: cast_nullable_to_non_nullable
as Session?,
  ));
}


}

// dart format on
