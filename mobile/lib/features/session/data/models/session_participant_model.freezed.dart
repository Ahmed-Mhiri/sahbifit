// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_participant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionParticipantIdModel {

 String get sessionId; String get userId;
/// Create a copy of SessionParticipantIdModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionParticipantIdModelCopyWith<SessionParticipantIdModel> get copyWith => _$SessionParticipantIdModelCopyWithImpl<SessionParticipantIdModel>(this as SessionParticipantIdModel, _$identity);

  /// Serializes this SessionParticipantIdModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionParticipantIdModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,userId);

@override
String toString() {
  return 'SessionParticipantIdModel(sessionId: $sessionId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $SessionParticipantIdModelCopyWith<$Res>  {
  factory $SessionParticipantIdModelCopyWith(SessionParticipantIdModel value, $Res Function(SessionParticipantIdModel) _then) = _$SessionParticipantIdModelCopyWithImpl;
@useResult
$Res call({
 String sessionId, String userId
});




}
/// @nodoc
class _$SessionParticipantIdModelCopyWithImpl<$Res>
    implements $SessionParticipantIdModelCopyWith<$Res> {
  _$SessionParticipantIdModelCopyWithImpl(this._self, this._then);

  final SessionParticipantIdModel _self;
  final $Res Function(SessionParticipantIdModel) _then;

/// Create a copy of SessionParticipantIdModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? userId = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionParticipantIdModel].
extension SessionParticipantIdModelPatterns on SessionParticipantIdModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionParticipantIdModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionParticipantIdModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionParticipantIdModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionParticipantIdModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionParticipantIdModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionParticipantIdModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionParticipantIdModel() when $default != null:
return $default(_that.sessionId,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String userId)  $default,) {final _that = this;
switch (_that) {
case _SessionParticipantIdModel():
return $default(_that.sessionId,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String userId)?  $default,) {final _that = this;
switch (_that) {
case _SessionParticipantIdModel() when $default != null:
return $default(_that.sessionId,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionParticipantIdModel implements SessionParticipantIdModel {
  const _SessionParticipantIdModel({required this.sessionId, required this.userId});
  factory _SessionParticipantIdModel.fromJson(Map<String, dynamic> json) => _$SessionParticipantIdModelFromJson(json);

@override final  String sessionId;
@override final  String userId;

/// Create a copy of SessionParticipantIdModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionParticipantIdModelCopyWith<_SessionParticipantIdModel> get copyWith => __$SessionParticipantIdModelCopyWithImpl<_SessionParticipantIdModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionParticipantIdModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionParticipantIdModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,userId);

@override
String toString() {
  return 'SessionParticipantIdModel(sessionId: $sessionId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$SessionParticipantIdModelCopyWith<$Res> implements $SessionParticipantIdModelCopyWith<$Res> {
  factory _$SessionParticipantIdModelCopyWith(_SessionParticipantIdModel value, $Res Function(_SessionParticipantIdModel) _then) = __$SessionParticipantIdModelCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String userId
});




}
/// @nodoc
class __$SessionParticipantIdModelCopyWithImpl<$Res>
    implements _$SessionParticipantIdModelCopyWith<$Res> {
  __$SessionParticipantIdModelCopyWithImpl(this._self, this._then);

  final _SessionParticipantIdModel _self;
  final $Res Function(_SessionParticipantIdModel) _then;

/// Create a copy of SessionParticipantIdModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? userId = null,}) {
  return _then(_SessionParticipantIdModel(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SessionParticipantModel {

 SessionParticipantIdModel get id; UserModel get user;// The user who joined
 ParticipantStatus get status; String get joinedAt;
/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionParticipantModelCopyWith<SessionParticipantModel> get copyWith => _$SessionParticipantModelCopyWithImpl<SessionParticipantModel>(this as SessionParticipantModel, _$identity);

  /// Serializes this SessionParticipantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionParticipantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,status,joinedAt);

@override
String toString() {
  return 'SessionParticipantModel(id: $id, user: $user, status: $status, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $SessionParticipantModelCopyWith<$Res>  {
  factory $SessionParticipantModelCopyWith(SessionParticipantModel value, $Res Function(SessionParticipantModel) _then) = _$SessionParticipantModelCopyWithImpl;
@useResult
$Res call({
 SessionParticipantIdModel id, UserModel user, ParticipantStatus status, String joinedAt
});


$SessionParticipantIdModelCopyWith<$Res> get id;$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$SessionParticipantModelCopyWithImpl<$Res>
    implements $SessionParticipantModelCopyWith<$Res> {
  _$SessionParticipantModelCopyWithImpl(this._self, this._then);

  final SessionParticipantModel _self;
  final $Res Function(SessionParticipantModel) _then;

/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? status = null,Object? joinedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SessionParticipantIdModel,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParticipantStatus,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionParticipantIdModelCopyWith<$Res> get id {
  
  return $SessionParticipantIdModelCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionParticipantModel].
extension SessionParticipantModelPatterns on SessionParticipantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionParticipantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionParticipantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionParticipantModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionParticipantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionParticipantModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionParticipantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SessionParticipantIdModel id,  UserModel user,  ParticipantStatus status,  String joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionParticipantModel() when $default != null:
return $default(_that.id,_that.user,_that.status,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SessionParticipantIdModel id,  UserModel user,  ParticipantStatus status,  String joinedAt)  $default,) {final _that = this;
switch (_that) {
case _SessionParticipantModel():
return $default(_that.id,_that.user,_that.status,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SessionParticipantIdModel id,  UserModel user,  ParticipantStatus status,  String joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _SessionParticipantModel() when $default != null:
return $default(_that.id,_that.user,_that.status,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionParticipantModel extends SessionParticipantModel {
  const _SessionParticipantModel({required this.id, required this.user, required this.status, required this.joinedAt}): super._();
  factory _SessionParticipantModel.fromJson(Map<String, dynamic> json) => _$SessionParticipantModelFromJson(json);

@override final  SessionParticipantIdModel id;
@override final  UserModel user;
// The user who joined
@override final  ParticipantStatus status;
@override final  String joinedAt;

/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionParticipantModelCopyWith<_SessionParticipantModel> get copyWith => __$SessionParticipantModelCopyWithImpl<_SessionParticipantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionParticipantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionParticipantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,status,joinedAt);

@override
String toString() {
  return 'SessionParticipantModel(id: $id, user: $user, status: $status, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$SessionParticipantModelCopyWith<$Res> implements $SessionParticipantModelCopyWith<$Res> {
  factory _$SessionParticipantModelCopyWith(_SessionParticipantModel value, $Res Function(_SessionParticipantModel) _then) = __$SessionParticipantModelCopyWithImpl;
@override @useResult
$Res call({
 SessionParticipantIdModel id, UserModel user, ParticipantStatus status, String joinedAt
});


@override $SessionParticipantIdModelCopyWith<$Res> get id;@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$SessionParticipantModelCopyWithImpl<$Res>
    implements _$SessionParticipantModelCopyWith<$Res> {
  __$SessionParticipantModelCopyWithImpl(this._self, this._then);

  final _SessionParticipantModel _self;
  final $Res Function(_SessionParticipantModel) _then;

/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? status = null,Object? joinedAt = null,}) {
  return _then(_SessionParticipantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SessionParticipantIdModel,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParticipantStatus,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionParticipantIdModelCopyWith<$Res> get id {
  
  return $SessionParticipantIdModelCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
