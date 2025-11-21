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
mixin _$RatingModel {

 String get ratingId; UserSummaryModel get ratingBy; UserSummaryModel get ratingFor; SessionSummaryModel get session; int get ratingValue; String? get comment; String get createdAt;
/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingModelCopyWith<RatingModel> get copyWith => _$RatingModelCopyWithImpl<RatingModel>(this as RatingModel, _$identity);

  /// Serializes this RatingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingModel&&(identical(other.ratingId, ratingId) || other.ratingId == ratingId)&&(identical(other.ratingBy, ratingBy) || other.ratingBy == ratingBy)&&(identical(other.ratingFor, ratingFor) || other.ratingFor == ratingFor)&&(identical(other.session, session) || other.session == session)&&(identical(other.ratingValue, ratingValue) || other.ratingValue == ratingValue)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ratingId,ratingBy,ratingFor,session,ratingValue,comment,createdAt);

@override
String toString() {
  return 'RatingModel(ratingId: $ratingId, ratingBy: $ratingBy, ratingFor: $ratingFor, session: $session, ratingValue: $ratingValue, comment: $comment, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RatingModelCopyWith<$Res>  {
  factory $RatingModelCopyWith(RatingModel value, $Res Function(RatingModel) _then) = _$RatingModelCopyWithImpl;
@useResult
$Res call({
 String ratingId, UserSummaryModel ratingBy, UserSummaryModel ratingFor, SessionSummaryModel session, int ratingValue, String? comment, String createdAt
});


$UserSummaryModelCopyWith<$Res> get ratingBy;$UserSummaryModelCopyWith<$Res> get ratingFor;$SessionSummaryModelCopyWith<$Res> get session;

}
/// @nodoc
class _$RatingModelCopyWithImpl<$Res>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._self, this._then);

  final RatingModel _self;
  final $Res Function(RatingModel) _then;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ratingId = null,Object? ratingBy = null,Object? ratingFor = null,Object? session = null,Object? ratingValue = null,Object? comment = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
ratingId: null == ratingId ? _self.ratingId : ratingId // ignore: cast_nullable_to_non_nullable
as String,ratingBy: null == ratingBy ? _self.ratingBy : ratingBy // ignore: cast_nullable_to_non_nullable
as UserSummaryModel,ratingFor: null == ratingFor ? _self.ratingFor : ratingFor // ignore: cast_nullable_to_non_nullable
as UserSummaryModel,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionSummaryModel,ratingValue: null == ratingValue ? _self.ratingValue : ratingValue // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<$Res> get ratingBy {
  
  return $UserSummaryModelCopyWith<$Res>(_self.ratingBy, (value) {
    return _then(_self.copyWith(ratingBy: value));
  });
}/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<$Res> get ratingFor {
  
  return $UserSummaryModelCopyWith<$Res>(_self.ratingFor, (value) {
    return _then(_self.copyWith(ratingFor: value));
  });
}/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionSummaryModelCopyWith<$Res> get session {
  
  return $SessionSummaryModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ratingId,  UserSummaryModel ratingBy,  UserSummaryModel ratingFor,  SessionSummaryModel session,  int ratingValue,  String? comment,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that.ratingId,_that.ratingBy,_that.ratingFor,_that.session,_that.ratingValue,_that.comment,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ratingId,  UserSummaryModel ratingBy,  UserSummaryModel ratingFor,  SessionSummaryModel session,  int ratingValue,  String? comment,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _RatingModel():
return $default(_that.ratingId,_that.ratingBy,_that.ratingFor,_that.session,_that.ratingValue,_that.comment,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ratingId,  UserSummaryModel ratingBy,  UserSummaryModel ratingFor,  SessionSummaryModel session,  int ratingValue,  String? comment,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that.ratingId,_that.ratingBy,_that.ratingFor,_that.session,_that.ratingValue,_that.comment,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingModel extends RatingModel {
  const _RatingModel({required this.ratingId, required this.ratingBy, required this.ratingFor, required this.session, required this.ratingValue, this.comment, required this.createdAt}): super._();
  factory _RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);

@override final  String ratingId;
@override final  UserSummaryModel ratingBy;
@override final  UserSummaryModel ratingFor;
@override final  SessionSummaryModel session;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingModel&&(identical(other.ratingId, ratingId) || other.ratingId == ratingId)&&(identical(other.ratingBy, ratingBy) || other.ratingBy == ratingBy)&&(identical(other.ratingFor, ratingFor) || other.ratingFor == ratingFor)&&(identical(other.session, session) || other.session == session)&&(identical(other.ratingValue, ratingValue) || other.ratingValue == ratingValue)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ratingId,ratingBy,ratingFor,session,ratingValue,comment,createdAt);

@override
String toString() {
  return 'RatingModel(ratingId: $ratingId, ratingBy: $ratingBy, ratingFor: $ratingFor, session: $session, ratingValue: $ratingValue, comment: $comment, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RatingModelCopyWith<$Res> implements $RatingModelCopyWith<$Res> {
  factory _$RatingModelCopyWith(_RatingModel value, $Res Function(_RatingModel) _then) = __$RatingModelCopyWithImpl;
@override @useResult
$Res call({
 String ratingId, UserSummaryModel ratingBy, UserSummaryModel ratingFor, SessionSummaryModel session, int ratingValue, String? comment, String createdAt
});


@override $UserSummaryModelCopyWith<$Res> get ratingBy;@override $UserSummaryModelCopyWith<$Res> get ratingFor;@override $SessionSummaryModelCopyWith<$Res> get session;

}
/// @nodoc
class __$RatingModelCopyWithImpl<$Res>
    implements _$RatingModelCopyWith<$Res> {
  __$RatingModelCopyWithImpl(this._self, this._then);

  final _RatingModel _self;
  final $Res Function(_RatingModel) _then;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ratingId = null,Object? ratingBy = null,Object? ratingFor = null,Object? session = null,Object? ratingValue = null,Object? comment = freezed,Object? createdAt = null,}) {
  return _then(_RatingModel(
ratingId: null == ratingId ? _self.ratingId : ratingId // ignore: cast_nullable_to_non_nullable
as String,ratingBy: null == ratingBy ? _self.ratingBy : ratingBy // ignore: cast_nullable_to_non_nullable
as UserSummaryModel,ratingFor: null == ratingFor ? _self.ratingFor : ratingFor // ignore: cast_nullable_to_non_nullable
as UserSummaryModel,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionSummaryModel,ratingValue: null == ratingValue ? _self.ratingValue : ratingValue // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<$Res> get ratingBy {
  
  return $UserSummaryModelCopyWith<$Res>(_self.ratingBy, (value) {
    return _then(_self.copyWith(ratingBy: value));
  });
}/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<$Res> get ratingFor {
  
  return $UserSummaryModelCopyWith<$Res>(_self.ratingFor, (value) {
    return _then(_self.copyWith(ratingFor: value));
  });
}/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionSummaryModelCopyWith<$Res> get session {
  
  return $SessionSummaryModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
