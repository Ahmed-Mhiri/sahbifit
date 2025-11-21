// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel {

 String get sessionId; String get title; String get startTime; String get endTime; SessionType get sessionType; int get participantCount; int get maxParticipants;// âœ… Changed from UserModel to UserSummaryModel
 UserSummaryModel get creator; GymModel get gym;// âœ… Fixed type from 'boolean' to 'bool' and added default
 bool get isChatActive;
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionModelCopyWith<SessionModel> get copyWith => _$SessionModelCopyWithImpl<SessionModel>(this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.sessionType, sessionType) || other.sessionType == sessionType)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.gym, gym) || other.gym == gym)&&(identical(other.isChatActive, isChatActive) || other.isChatActive == isChatActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,title,startTime,endTime,sessionType,participantCount,maxParticipants,creator,gym,isChatActive);

@override
String toString() {
  return 'SessionModel(sessionId: $sessionId, title: $title, startTime: $startTime, endTime: $endTime, sessionType: $sessionType, participantCount: $participantCount, maxParticipants: $maxParticipants, creator: $creator, gym: $gym, isChatActive: $isChatActive)';
}


}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res>  {
  factory $SessionModelCopyWith(SessionModel value, $Res Function(SessionModel) _then) = _$SessionModelCopyWithImpl;
@useResult
$Res call({
 String sessionId, String title, String startTime, String endTime, SessionType sessionType, int participantCount, int maxParticipants, UserSummaryModel creator, GymModel gym, bool isChatActive
});


$UserSummaryModelCopyWith<$Res> get creator;$GymModelCopyWith<$Res> get gym;

}
/// @nodoc
class _$SessionModelCopyWithImpl<$Res>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? title = null,Object? startTime = null,Object? endTime = null,Object? sessionType = null,Object? participantCount = null,Object? maxParticipants = null,Object? creator = null,Object? gym = null,Object? isChatActive = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,sessionType: null == sessionType ? _self.sessionType : sessionType // ignore: cast_nullable_to_non_nullable
as SessionType,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as UserSummaryModel,gym: null == gym ? _self.gym : gym // ignore: cast_nullable_to_non_nullable
as GymModel,isChatActive: null == isChatActive ? _self.isChatActive : isChatActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<$Res> get creator {
  
  return $UserSummaryModelCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GymModelCopyWith<$Res> get gym {
  
  return $GymModelCopyWith<$Res>(_self.gym, (value) {
    return _then(_self.copyWith(gym: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String title,  String startTime,  String endTime,  SessionType sessionType,  int participantCount,  int maxParticipants,  UserSummaryModel creator,  GymModel gym,  bool isChatActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.sessionId,_that.title,_that.startTime,_that.endTime,_that.sessionType,_that.participantCount,_that.maxParticipants,_that.creator,_that.gym,_that.isChatActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String title,  String startTime,  String endTime,  SessionType sessionType,  int participantCount,  int maxParticipants,  UserSummaryModel creator,  GymModel gym,  bool isChatActive)  $default,) {final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that.sessionId,_that.title,_that.startTime,_that.endTime,_that.sessionType,_that.participantCount,_that.maxParticipants,_that.creator,_that.gym,_that.isChatActive);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String title,  String startTime,  String endTime,  SessionType sessionType,  int participantCount,  int maxParticipants,  UserSummaryModel creator,  GymModel gym,  bool isChatActive)?  $default,) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.sessionId,_that.title,_that.startTime,_that.endTime,_that.sessionType,_that.participantCount,_that.maxParticipants,_that.creator,_that.gym,_that.isChatActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionModel extends SessionModel {
  const _SessionModel({required this.sessionId, required this.title, required this.startTime, required this.endTime, required this.sessionType, required this.participantCount, required this.maxParticipants, required this.creator, required this.gym, this.isChatActive = false}): super._();
  factory _SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

@override final  String sessionId;
@override final  String title;
@override final  String startTime;
@override final  String endTime;
@override final  SessionType sessionType;
@override final  int participantCount;
@override final  int maxParticipants;
// âœ… Changed from UserModel to UserSummaryModel
@override final  UserSummaryModel creator;
@override final  GymModel gym;
// âœ… Fixed type from 'boolean' to 'bool' and added default
@override@JsonKey() final  bool isChatActive;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionModelCopyWith<_SessionModel> get copyWith => __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.sessionType, sessionType) || other.sessionType == sessionType)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.gym, gym) || other.gym == gym)&&(identical(other.isChatActive, isChatActive) || other.isChatActive == isChatActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,title,startTime,endTime,sessionType,participantCount,maxParticipants,creator,gym,isChatActive);

@override
String toString() {
  return 'SessionModel(sessionId: $sessionId, title: $title, startTime: $startTime, endTime: $endTime, sessionType: $sessionType, participantCount: $participantCount, maxParticipants: $maxParticipants, creator: $creator, gym: $gym, isChatActive: $isChatActive)';
}


}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res> implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(_SessionModel value, $Res Function(_SessionModel) _then) = __$SessionModelCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String title, String startTime, String endTime, SessionType sessionType, int participantCount, int maxParticipants, UserSummaryModel creator, GymModel gym, bool isChatActive
});


@override $UserSummaryModelCopyWith<$Res> get creator;@override $GymModelCopyWith<$Res> get gym;

}
/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? title = null,Object? startTime = null,Object? endTime = null,Object? sessionType = null,Object? participantCount = null,Object? maxParticipants = null,Object? creator = null,Object? gym = null,Object? isChatActive = null,}) {
  return _then(_SessionModel(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,sessionType: null == sessionType ? _self.sessionType : sessionType // ignore: cast_nullable_to_non_nullable
as SessionType,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as UserSummaryModel,gym: null == gym ? _self.gym : gym // ignore: cast_nullable_to_non_nullable
as GymModel,isChatActive: null == isChatActive ? _self.isChatActive : isChatActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<$Res> get creator {
  
  return $UserSummaryModelCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GymModelCopyWith<$Res> get gym {
  
  return $GymModelCopyWith<$Res>(_self.gym, (value) {
    return _then(_self.copyWith(gym: value));
  });
}
}

// dart format on
