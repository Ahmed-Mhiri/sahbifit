// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingSessionModel {

 String get sessionId;
/// Create a copy of RatingSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingSessionModelCopyWith<RatingSessionModel> get copyWith => _$RatingSessionModelCopyWithImpl<RatingSessionModel>(this as RatingSessionModel, _$identity);

  /// Serializes this RatingSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingSessionModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'RatingSessionModel(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $RatingSessionModelCopyWith<$Res>  {
  factory $RatingSessionModelCopyWith(RatingSessionModel value, $Res Function(RatingSessionModel) _then) = _$RatingSessionModelCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$RatingSessionModelCopyWithImpl<$Res>
    implements $RatingSessionModelCopyWith<$Res> {
  _$RatingSessionModelCopyWithImpl(this._self, this._then);

  final RatingSessionModel _self;
  final $Res Function(RatingSessionModel) _then;

/// Create a copy of RatingSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingSessionModel].
extension RatingSessionModelPatterns on RatingSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _RatingSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _RatingSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingSessionModel() when $default != null:
return $default(_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId)  $default,) {final _that = this;
switch (_that) {
case _RatingSessionModel():
return $default(_that.sessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId)?  $default,) {final _that = this;
switch (_that) {
case _RatingSessionModel() when $default != null:
return $default(_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingSessionModel implements RatingSessionModel {
  const _RatingSessionModel({required this.sessionId});
  factory _RatingSessionModel.fromJson(Map<String, dynamic> json) => _$RatingSessionModelFromJson(json);

@override final  String sessionId;

/// Create a copy of RatingSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingSessionModelCopyWith<_RatingSessionModel> get copyWith => __$RatingSessionModelCopyWithImpl<_RatingSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingSessionModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'RatingSessionModel(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$RatingSessionModelCopyWith<$Res> implements $RatingSessionModelCopyWith<$Res> {
  factory _$RatingSessionModelCopyWith(_RatingSessionModel value, $Res Function(_RatingSessionModel) _then) = __$RatingSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class __$RatingSessionModelCopyWithImpl<$Res>
    implements _$RatingSessionModelCopyWith<$Res> {
  __$RatingSessionModelCopyWithImpl(this._self, this._then);

  final _RatingSessionModel _self;
  final $Res Function(_RatingSessionModel) _then;

/// Create a copy of RatingSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_RatingSessionModel(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RatingModel {

 String get ratingId; RatingSessionModel get session;// Nested session object
 UserModel get ratingBy; UserModel get ratingFor; int get ratingValue; String? get comment; String get createdAt;
/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingModelCopyWith<RatingModel> get copyWith => _$RatingModelCopyWithImpl<RatingModel>(this as RatingModel, _$identity);

  /// Serializes this RatingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingModel&&(identical(other.ratingId, ratingId) || other.ratingId == ratingId)&&(identical(other.session, session) || other.session == session)&&(identical(other.ratingBy, ratingBy) || other.ratingBy == ratingBy)&&(identical(other.ratingFor, ratingFor) || other.ratingFor == ratingFor)&&(identical(other.ratingValue, ratingValue) || other.ratingValue == ratingValue)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ratingId,session,ratingBy,ratingFor,ratingValue,comment,createdAt);

@override
String toString() {
  return 'RatingModel(ratingId: $ratingId, session: $session, ratingBy: $ratingBy, ratingFor: $ratingFor, ratingValue: $ratingValue, comment: $comment, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RatingModelCopyWith<$Res>  {
  factory $RatingModelCopyWith(RatingModel value, $Res Function(RatingModel) _then) = _$RatingModelCopyWithImpl;
@useResult
$Res call({
 String ratingId, RatingSessionModel session, UserModel ratingBy, UserModel ratingFor, int ratingValue, String? comment, String createdAt
});


$RatingSessionModelCopyWith<$Res> get session;$UserModelCopyWith<$Res> get ratingBy;$UserModelCopyWith<$Res> get ratingFor;

}
/// @nodoc
class _$RatingModelCopyWithImpl<$Res>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._self, this._then);

  final RatingModel _self;
  final $Res Function(RatingModel) _then;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ratingId = null,Object? session = null,Object? ratingBy = null,Object? ratingFor = null,Object? ratingValue = null,Object? comment = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
ratingId: null == ratingId ? _self.ratingId : ratingId // ignore: cast_nullable_to_non_nullable
as String,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as RatingSessionModel,ratingBy: null == ratingBy ? _self.ratingBy : ratingBy // ignore: cast_nullable_to_non_nullable
as UserModel,ratingFor: null == ratingFor ? _self.ratingFor : ratingFor // ignore: cast_nullable_to_non_nullable
as UserModel,ratingValue: null == ratingValue ? _self.ratingValue : ratingValue // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingSessionModelCopyWith<$Res> get session {
  
  return $RatingSessionModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get ratingBy {
  
  return $UserModelCopyWith<$Res>(_self.ratingBy, (value) {
    return _then(_self.copyWith(ratingBy: value));
  });
}/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get ratingFor {
  
  return $UserModelCopyWith<$Res>(_self.ratingFor, (value) {
    return _then(_self.copyWith(ratingFor: value));
  });
}
}


/// Adds pattern-matching-related methods to [RatingModel].
extension RatingModelPatterns on RatingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingModel value)  $default,){
final _that = this;
switch (_that) {
case _RatingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingModel value)?  $default,){
final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ratingId,  RatingSessionModel session,  UserModel ratingBy,  UserModel ratingFor,  int ratingValue,  String? comment,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that.ratingId,_that.session,_that.ratingBy,_that.ratingFor,_that.ratingValue,_that.comment,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ratingId,  RatingSessionModel session,  UserModel ratingBy,  UserModel ratingFor,  int ratingValue,  String? comment,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _RatingModel():
return $default(_that.ratingId,_that.session,_that.ratingBy,_that.ratingFor,_that.ratingValue,_that.comment,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ratingId,  RatingSessionModel session,  UserModel ratingBy,  UserModel ratingFor,  int ratingValue,  String? comment,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that.ratingId,_that.session,_that.ratingBy,_that.ratingFor,_that.ratingValue,_that.comment,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingModel extends RatingModel {
  const _RatingModel({required this.ratingId, required this.session, required this.ratingBy, required this.ratingFor, required this.ratingValue, this.comment, required this.createdAt}): super._();
  factory _RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);

@override final  String ratingId;
@override final  RatingSessionModel session;
// Nested session object
@override final  UserModel ratingBy;
@override final  UserModel ratingFor;
@override final  int ratingValue;
@override final  String? comment;
@override final  String createdAt;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingModelCopyWith<_RatingModel> get copyWith => __$RatingModelCopyWithImpl<_RatingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingModel&&(identical(other.ratingId, ratingId) || other.ratingId == ratingId)&&(identical(other.session, session) || other.session == session)&&(identical(other.ratingBy, ratingBy) || other.ratingBy == ratingBy)&&(identical(other.ratingFor, ratingFor) || other.ratingFor == ratingFor)&&(identical(other.ratingValue, ratingValue) || other.ratingValue == ratingValue)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ratingId,session,ratingBy,ratingFor,ratingValue,comment,createdAt);

@override
String toString() {
  return 'RatingModel(ratingId: $ratingId, session: $session, ratingBy: $ratingBy, ratingFor: $ratingFor, ratingValue: $ratingValue, comment: $comment, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RatingModelCopyWith<$Res> implements $RatingModelCopyWith<$Res> {
  factory _$RatingModelCopyWith(_RatingModel value, $Res Function(_RatingModel) _then) = __$RatingModelCopyWithImpl;
@override @useResult
$Res call({
 String ratingId, RatingSessionModel session, UserModel ratingBy, UserModel ratingFor, int ratingValue, String? comment, String createdAt
});


@override $RatingSessionModelCopyWith<$Res> get session;@override $UserModelCopyWith<$Res> get ratingBy;@override $UserModelCopyWith<$Res> get ratingFor;

}
/// @nodoc
class __$RatingModelCopyWithImpl<$Res>
    implements _$RatingModelCopyWith<$Res> {
  __$RatingModelCopyWithImpl(this._self, this._then);

  final _RatingModel _self;
  final $Res Function(_RatingModel) _then;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ratingId = null,Object? session = null,Object? ratingBy = null,Object? ratingFor = null,Object? ratingValue = null,Object? comment = freezed,Object? createdAt = null,}) {
  return _then(_RatingModel(
ratingId: null == ratingId ? _self.ratingId : ratingId // ignore: cast_nullable_to_non_nullable
as String,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as RatingSessionModel,ratingBy: null == ratingBy ? _self.ratingBy : ratingBy // ignore: cast_nullable_to_non_nullable
as UserModel,ratingFor: null == ratingFor ? _self.ratingFor : ratingFor // ignore: cast_nullable_to_non_nullable
as UserModel,ratingValue: null == ratingValue ? _self.ratingValue : ratingValue // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingSessionModelCopyWith<$Res> get session {
  
  return $RatingSessionModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get ratingBy {
  
  return $UserModelCopyWith<$Res>(_self.ratingBy, (value) {
    return _then(_self.copyWith(ratingBy: value));
  });
}/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get ratingFor {
  
  return $UserModelCopyWith<$Res>(_self.ratingFor, (value) {
    return _then(_self.copyWith(ratingFor: value));
  });
}
}

// dart format on
