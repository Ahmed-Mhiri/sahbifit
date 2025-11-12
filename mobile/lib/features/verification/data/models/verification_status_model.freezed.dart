// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationStatusModel {
  VerificationStatus get status;
  VerifiedGender get gender;

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerificationStatusModelCopyWith<VerificationStatusModel> get copyWith =>
      _$VerificationStatusModelCopyWithImpl<VerificationStatusModel>(
          this as VerificationStatusModel, _$identity);

  /// Serializes this VerificationStatusModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerificationStatusModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, gender);

  @override
  String toString() {
    return 'VerificationStatusModel(status: $status, gender: $gender)';
  }
}

/// @nodoc
abstract mixin class $VerificationStatusModelCopyWith<$Res> {
  factory $VerificationStatusModelCopyWith(VerificationStatusModel value,
          $Res Function(VerificationStatusModel) _then) =
      _$VerificationStatusModelCopyWithImpl;
  @useResult
  $Res call({VerificationStatus status, VerifiedGender gender});
}

/// @nodoc
class _$VerificationStatusModelCopyWithImpl<$Res>
    implements $VerificationStatusModelCopyWith<$Res> {
  _$VerificationStatusModelCopyWithImpl(this._self, this._then);

  final VerificationStatusModel _self;
  final $Res Function(VerificationStatusModel) _then;

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? gender = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as VerificationStatus,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as VerifiedGender,
    ));
  }
}

/// Adds pattern-matching-related methods to [VerificationStatusModel].
extension VerificationStatusModelPatterns on VerificationStatusModel {
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
    TResult Function(_VerificationStatusModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerificationStatusModel() when $default != null:
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
    TResult Function(_VerificationStatusModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerificationStatusModel():
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
    TResult? Function(_VerificationStatusModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerificationStatusModel() when $default != null:
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
    TResult Function(VerificationStatus status, VerifiedGender gender)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerificationStatusModel() when $default != null:
        return $default(_that.status, _that.gender);
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
    TResult Function(VerificationStatus status, VerifiedGender gender) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerificationStatusModel():
        return $default(_that.status, _that.gender);
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
    TResult? Function(VerificationStatus status, VerifiedGender gender)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerificationStatusModel() when $default != null:
        return $default(_that.status, _that.gender);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _VerificationStatusModel extends VerificationStatusModel {
  const _VerificationStatusModel({required this.status, required this.gender})
      : super._();
  factory _VerificationStatusModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationStatusModelFromJson(json);

  @override
  final VerificationStatus status;
  @override
  final VerifiedGender gender;

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerificationStatusModelCopyWith<_VerificationStatusModel> get copyWith =>
      __$VerificationStatusModelCopyWithImpl<_VerificationStatusModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerificationStatusModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerificationStatusModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, gender);

  @override
  String toString() {
    return 'VerificationStatusModel(status: $status, gender: $gender)';
  }
}

/// @nodoc
abstract mixin class _$VerificationStatusModelCopyWith<$Res>
    implements $VerificationStatusModelCopyWith<$Res> {
  factory _$VerificationStatusModelCopyWith(_VerificationStatusModel value,
          $Res Function(_VerificationStatusModel) _then) =
      __$VerificationStatusModelCopyWithImpl;
  @override
  @useResult
  $Res call({VerificationStatus status, VerifiedGender gender});
}

/// @nodoc
class __$VerificationStatusModelCopyWithImpl<$Res>
    implements _$VerificationStatusModelCopyWith<$Res> {
  __$VerificationStatusModelCopyWithImpl(this._self, this._then);

  final _VerificationStatusModel _self;
  final $Res Function(_VerificationStatusModel) _then;

  /// Create a copy of VerificationStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? gender = null,
  }) {
    return _then(_VerificationStatusModel(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as VerificationStatus,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as VerifiedGender,
    ));
  }
}

// dart format on
