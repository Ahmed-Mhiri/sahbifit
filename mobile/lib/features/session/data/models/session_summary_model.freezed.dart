// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionSummaryModel {

 String get sessionId; String get title; String get startTime;
/// Create a copy of SessionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSummaryModelCopyWith<SessionSummaryModel> get copyWith => _$SessionSummaryModelCopyWithImpl<SessionSummaryModel>(this as SessionSummaryModel, _$identity);

  /// Serializes this SessionSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSummaryModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,title,startTime);

@override
String toString() {
  return 'SessionSummaryModel(sessionId: $sessionId, title: $title, startTime: $startTime)';
}


}

/// @nodoc
abstract mixin class $SessionSummaryModelCopyWith<$Res>  {
  factory $SessionSummaryModelCopyWith(SessionSummaryModel value, $Res Function(SessionSummaryModel) _then) = _$SessionSummaryModelCopyWithImpl;
@useResult
$Res call({
 String sessionId, String title, String startTime
});




}
/// @nodoc
class _$SessionSummaryModelCopyWithImpl<$Res>
    implements $SessionSummaryModelCopyWith<$Res> {
  _$SessionSummaryModelCopyWithImpl(this._self, this._then);

  final SessionSummaryModel _self;
  final $Res Function(SessionSummaryModel) _then;

/// Create a copy of SessionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? title = null,Object? startTime = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionSummaryModel].
extension SessionSummaryModelPatterns on SessionSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String title,  String startTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionSummaryModel() when $default != null:
return $default(_that.sessionId,_that.title,_that.startTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String title,  String startTime)  $default,) {final _that = this;
switch (_that) {
case _SessionSummaryModel():
return $default(_that.sessionId,_that.title,_that.startTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String title,  String startTime)?  $default,) {final _that = this;
switch (_that) {
case _SessionSummaryModel() when $default != null:
return $default(_that.sessionId,_that.title,_that.startTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionSummaryModel implements SessionSummaryModel {
  const _SessionSummaryModel({required this.sessionId, required this.title, required this.startTime});
  factory _SessionSummaryModel.fromJson(Map<String, dynamic> json) => _$SessionSummaryModelFromJson(json);

@override final  String sessionId;
@override final  String title;
@override final  String startTime;

/// Create a copy of SessionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionSummaryModelCopyWith<_SessionSummaryModel> get copyWith => __$SessionSummaryModelCopyWithImpl<_SessionSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionSummaryModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,title,startTime);

@override
String toString() {
  return 'SessionSummaryModel(sessionId: $sessionId, title: $title, startTime: $startTime)';
}


}

/// @nodoc
abstract mixin class _$SessionSummaryModelCopyWith<$Res> implements $SessionSummaryModelCopyWith<$Res> {
  factory _$SessionSummaryModelCopyWith(_SessionSummaryModel value, $Res Function(_SessionSummaryModel) _then) = __$SessionSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String title, String startTime
});




}
/// @nodoc
class __$SessionSummaryModelCopyWithImpl<$Res>
    implements _$SessionSummaryModelCopyWith<$Res> {
  __$SessionSummaryModelCopyWithImpl(this._self, this._then);

  final _SessionSummaryModel _self;
  final $Res Function(_SessionSummaryModel) _then;

/// Create a copy of SessionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? title = null,Object? startTime = null,}) {
  return _then(_SessionSummaryModel(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
