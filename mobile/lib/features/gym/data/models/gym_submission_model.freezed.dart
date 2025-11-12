// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gym_submission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GymSubmissionModel {
  String get name;
  String get address;

  /// Create a copy of GymSubmissionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GymSubmissionModelCopyWith<GymSubmissionModel> get copyWith =>
      _$GymSubmissionModelCopyWithImpl<GymSubmissionModel>(
          this as GymSubmissionModel, _$identity);

  /// Serializes this GymSubmissionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GymSubmissionModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, address);

  @override
  String toString() {
    return 'GymSubmissionModel(name: $name, address: $address)';
  }
}

/// @nodoc
abstract mixin class $GymSubmissionModelCopyWith<$Res> {
  factory $GymSubmissionModelCopyWith(
          GymSubmissionModel value, $Res Function(GymSubmissionModel) _then) =
      _$GymSubmissionModelCopyWithImpl;
  @useResult
  $Res call({String name, String address});
}

/// @nodoc
class _$GymSubmissionModelCopyWithImpl<$Res>
    implements $GymSubmissionModelCopyWith<$Res> {
  _$GymSubmissionModelCopyWithImpl(this._self, this._then);

  final GymSubmissionModel _self;
  final $Res Function(GymSubmissionModel) _then;

  /// Create a copy of GymSubmissionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [GymSubmissionModel].
extension GymSubmissionModelPatterns on GymSubmissionModel {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GymSubmissionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GymSubmissionModel() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GymSubmissionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GymSubmissionModel():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GymSubmissionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GymSubmissionModel() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, String address)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GymSubmissionModel() when $default != null:
        return $default(_that.name, _that.address);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, String address) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GymSubmissionModel():
        return $default(_that.name, _that.address);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name, String address)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GymSubmissionModel() when $default != null:
        return $default(_that.name, _that.address);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _GymSubmissionModel implements GymSubmissionModel {
  const _GymSubmissionModel({required this.name, required this.address});
  factory _GymSubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$GymSubmissionModelFromJson(json);

  @override
  final String name;
  @override
  final String address;

  /// Create a copy of GymSubmissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GymSubmissionModelCopyWith<_GymSubmissionModel> get copyWith =>
      __$GymSubmissionModelCopyWithImpl<_GymSubmissionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GymSubmissionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GymSubmissionModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, address);

  @override
  String toString() {
    return 'GymSubmissionModel(name: $name, address: $address)';
  }
}

/// @nodoc
abstract mixin class _$GymSubmissionModelCopyWith<$Res>
    implements $GymSubmissionModelCopyWith<$Res> {
  factory _$GymSubmissionModelCopyWith(
          _GymSubmissionModel value, $Res Function(_GymSubmissionModel) _then) =
      __$GymSubmissionModelCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String address});
}

/// @nodoc
class __$GymSubmissionModelCopyWithImpl<$Res>
    implements _$GymSubmissionModelCopyWith<$Res> {
  __$GymSubmissionModelCopyWithImpl(this._self, this._then);

  final _GymSubmissionModel _self;
  final $Res Function(_GymSubmissionModel) _then;

  /// Create a copy of GymSubmissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_GymSubmissionModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
