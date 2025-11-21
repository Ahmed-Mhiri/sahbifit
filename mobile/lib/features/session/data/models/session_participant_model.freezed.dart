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
mixin _$SessionParticipantModel {

// Removed 'id' field - it is not in the API response
 UserSummaryModel get user;// Changed from UserModel to UserSummaryModel
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionParticipantModel&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,status,joinedAt);

@override
String toString() {
  return 'SessionParticipantModel(user: $user, status: $status, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $SessionParticipantModelCopyWith<$Res>  {
  factory $SessionParticipantModelCopyWith(SessionParticipantModel value, $Res Function(SessionParticipantModel) _then) = _$SessionParticipantModelCopyWithImpl;
@useResult
$Res call({
 UserSummaryModel user, ParticipantStatus status, String joinedAt
});


$UserSummaryModelCopyWith<$Res> get user;

}
/// @nodoc
class _$SessionParticipantModelCopyWithImpl<$Res>
    implements $SessionParticipantModelCopyWith<$Res> {
  _$SessionParticipantModelCopyWithImpl(this._self, this._then);

  final SessionParticipantModel _self;
  final $Res Function(SessionParticipantModel) _then;

/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? status = null,Object? joinedAt = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserSummaryModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParticipantStatus,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<$Res> get user {
  
  return $UserSummaryModelCopyWith<$Res>(_self.user, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserSummaryModel user,  ParticipantStatus status,  String joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionParticipantModel() when $default != null:
return $default(_that.user,_that.status,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserSummaryModel user,  ParticipantStatus status,  String joinedAt)  $default,) {final _that = this;
switch (_that) {
case _SessionParticipantModel():
return $default(_that.user,_that.status,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserSummaryModel user,  ParticipantStatus status,  String joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _SessionParticipantModel() when $default != null:
return $default(_that.user,_that.status,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionParticipantModel extends SessionParticipantModel {
  const _SessionParticipantModel({required this.user, required this.status, required this.joinedAt}): super._();
  factory _SessionParticipantModel.fromJson(Map<String, dynamic> json) => _$SessionParticipantModelFromJson(json);

// Removed 'id' field - it is not in the API response
@override final  UserSummaryModel user;
// Changed from UserModel to UserSummaryModel
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionParticipantModel&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,status,joinedAt);

@override
String toString() {
  return 'SessionParticipantModel(user: $user, status: $status, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$SessionParticipantModelCopyWith<$Res> implements $SessionParticipantModelCopyWith<$Res> {
  factory _$SessionParticipantModelCopyWith(_SessionParticipantModel value, $Res Function(_SessionParticipantModel) _then) = __$SessionParticipantModelCopyWithImpl;
@override @useResult
$Res call({
 UserSummaryModel user, ParticipantStatus status, String joinedAt
});


@override $UserSummaryModelCopyWith<$Res> get user;

}
/// @nodoc
class __$SessionParticipantModelCopyWithImpl<$Res>
    implements _$SessionParticipantModelCopyWith<$Res> {
  __$SessionParticipantModelCopyWithImpl(this._self, this._then);

  final _SessionParticipantModel _self;
  final $Res Function(_SessionParticipantModel) _then;

/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? status = null,Object? joinedAt = null,}) {
  return _then(_SessionParticipantModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserSummaryModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParticipantStatus,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SessionParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<$Res> get user {
  
  return $UserSummaryModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
