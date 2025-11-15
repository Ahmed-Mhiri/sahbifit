// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gym_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GymModel {

 String get gymId; String get name; String? get address; GymStatus get status; int get memberCount;
/// Create a copy of GymModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GymModelCopyWith<GymModel> get copyWith => _$GymModelCopyWithImpl<GymModel>(this as GymModel, _$identity);

  /// Serializes this GymModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GymModel&&(identical(other.gymId, gymId) || other.gymId == gymId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gymId,name,address,status,memberCount);

@override
String toString() {
  return 'GymModel(gymId: $gymId, name: $name, address: $address, status: $status, memberCount: $memberCount)';
}


}

/// @nodoc
abstract mixin class $GymModelCopyWith<$Res>  {
  factory $GymModelCopyWith(GymModel value, $Res Function(GymModel) _then) = _$GymModelCopyWithImpl;
@useResult
$Res call({
 String gymId, String name, String? address, GymStatus status, int memberCount
});




}
/// @nodoc
class _$GymModelCopyWithImpl<$Res>
    implements $GymModelCopyWith<$Res> {
  _$GymModelCopyWithImpl(this._self, this._then);

  final GymModel _self;
  final $Res Function(GymModel) _then;

/// Create a copy of GymModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gymId = null,Object? name = null,Object? address = freezed,Object? status = null,Object? memberCount = null,}) {
  return _then(_self.copyWith(
gymId: null == gymId ? _self.gymId : gymId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GymStatus,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GymModel].
extension GymModelPatterns on GymModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GymModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GymModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GymModel value)  $default,){
final _that = this;
switch (_that) {
case _GymModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GymModel value)?  $default,){
final _that = this;
switch (_that) {
case _GymModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String gymId,  String name,  String? address,  GymStatus status,  int memberCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GymModel() when $default != null:
return $default(_that.gymId,_that.name,_that.address,_that.status,_that.memberCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String gymId,  String name,  String? address,  GymStatus status,  int memberCount)  $default,) {final _that = this;
switch (_that) {
case _GymModel():
return $default(_that.gymId,_that.name,_that.address,_that.status,_that.memberCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String gymId,  String name,  String? address,  GymStatus status,  int memberCount)?  $default,) {final _that = this;
switch (_that) {
case _GymModel() when $default != null:
return $default(_that.gymId,_that.name,_that.address,_that.status,_that.memberCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GymModel extends GymModel {
  const _GymModel({required this.gymId, required this.name, this.address, required this.status, required this.memberCount}): super._();
  factory _GymModel.fromJson(Map<String, dynamic> json) => _$GymModelFromJson(json);

@override final  String gymId;
@override final  String name;
@override final  String? address;
@override final  GymStatus status;
@override final  int memberCount;

/// Create a copy of GymModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GymModelCopyWith<_GymModel> get copyWith => __$GymModelCopyWithImpl<_GymModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GymModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GymModel&&(identical(other.gymId, gymId) || other.gymId == gymId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gymId,name,address,status,memberCount);

@override
String toString() {
  return 'GymModel(gymId: $gymId, name: $name, address: $address, status: $status, memberCount: $memberCount)';
}


}

/// @nodoc
abstract mixin class _$GymModelCopyWith<$Res> implements $GymModelCopyWith<$Res> {
  factory _$GymModelCopyWith(_GymModel value, $Res Function(_GymModel) _then) = __$GymModelCopyWithImpl;
@override @useResult
$Res call({
 String gymId, String name, String? address, GymStatus status, int memberCount
});




}
/// @nodoc
class __$GymModelCopyWithImpl<$Res>
    implements _$GymModelCopyWith<$Res> {
  __$GymModelCopyWithImpl(this._self, this._then);

  final _GymModel _self;
  final $Res Function(_GymModel) _then;

/// Create a copy of GymModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gymId = null,Object? name = null,Object? address = freezed,Object? status = null,Object? memberCount = null,}) {
  return _then(_GymModel(
gymId: null == gymId ? _self.gymId : gymId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GymStatus,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
