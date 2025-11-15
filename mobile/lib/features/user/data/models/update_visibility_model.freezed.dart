// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_visibility_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateVisibilityModel {

 ProfileVisibility get visibility;
/// Create a copy of UpdateVisibilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateVisibilityModelCopyWith<UpdateVisibilityModel> get copyWith => _$UpdateVisibilityModelCopyWithImpl<UpdateVisibilityModel>(this as UpdateVisibilityModel, _$identity);

  /// Serializes this UpdateVisibilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateVisibilityModel&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visibility);

@override
String toString() {
  return 'UpdateVisibilityModel(visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class $UpdateVisibilityModelCopyWith<$Res>  {
  factory $UpdateVisibilityModelCopyWith(UpdateVisibilityModel value, $Res Function(UpdateVisibilityModel) _then) = _$UpdateVisibilityModelCopyWithImpl;
@useResult
$Res call({
 ProfileVisibility visibility
});




}
/// @nodoc
class _$UpdateVisibilityModelCopyWithImpl<$Res>
    implements $UpdateVisibilityModelCopyWith<$Res> {
  _$UpdateVisibilityModelCopyWithImpl(this._self, this._then);

  final UpdateVisibilityModel _self;
  final $Res Function(UpdateVisibilityModel) _then;

/// Create a copy of UpdateVisibilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visibility = null,}) {
  return _then(_self.copyWith(
visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as ProfileVisibility,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateVisibilityModel].
extension UpdateVisibilityModelPatterns on UpdateVisibilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateVisibilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateVisibilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateVisibilityModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateVisibilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateVisibilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateVisibilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfileVisibility visibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateVisibilityModel() when $default != null:
return $default(_that.visibility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfileVisibility visibility)  $default,) {final _that = this;
switch (_that) {
case _UpdateVisibilityModel():
return $default(_that.visibility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfileVisibility visibility)?  $default,) {final _that = this;
switch (_that) {
case _UpdateVisibilityModel() when $default != null:
return $default(_that.visibility);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateVisibilityModel implements UpdateVisibilityModel {
  const _UpdateVisibilityModel({required this.visibility});
  factory _UpdateVisibilityModel.fromJson(Map<String, dynamic> json) => _$UpdateVisibilityModelFromJson(json);

@override final  ProfileVisibility visibility;

/// Create a copy of UpdateVisibilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateVisibilityModelCopyWith<_UpdateVisibilityModel> get copyWith => __$UpdateVisibilityModelCopyWithImpl<_UpdateVisibilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateVisibilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateVisibilityModel&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visibility);

@override
String toString() {
  return 'UpdateVisibilityModel(visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class _$UpdateVisibilityModelCopyWith<$Res> implements $UpdateVisibilityModelCopyWith<$Res> {
  factory _$UpdateVisibilityModelCopyWith(_UpdateVisibilityModel value, $Res Function(_UpdateVisibilityModel) _then) = __$UpdateVisibilityModelCopyWithImpl;
@override @useResult
$Res call({
 ProfileVisibility visibility
});




}
/// @nodoc
class __$UpdateVisibilityModelCopyWithImpl<$Res>
    implements _$UpdateVisibilityModelCopyWith<$Res> {
  __$UpdateVisibilityModelCopyWithImpl(this._self, this._then);

  final _UpdateVisibilityModel _self;
  final $Res Function(_UpdateVisibilityModel) _then;

/// Create a copy of UpdateVisibilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? visibility = null,}) {
  return _then(_UpdateVisibilityModel(
visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as ProfileVisibility,
  ));
}


}

// dart format on
