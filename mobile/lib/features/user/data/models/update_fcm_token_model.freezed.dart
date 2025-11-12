// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_fcm_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateFcmTokenModel {
  String get fcmToken;

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateFcmTokenModelCopyWith<UpdateFcmTokenModel> get copyWith =>
      _$UpdateFcmTokenModelCopyWithImpl<UpdateFcmTokenModel>(
          this as UpdateFcmTokenModel, _$identity);

  /// Serializes this UpdateFcmTokenModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFcmTokenModel &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  @override
  String toString() {
    return 'UpdateFcmTokenModel(fcmToken: $fcmToken)';
  }
}

/// @nodoc
abstract mixin class $UpdateFcmTokenModelCopyWith<$Res> {
  factory $UpdateFcmTokenModelCopyWith(
          UpdateFcmTokenModel value, $Res Function(UpdateFcmTokenModel) _then) =
      _$UpdateFcmTokenModelCopyWithImpl;
  @useResult
  $Res call({String fcmToken});
}

/// @nodoc
class _$UpdateFcmTokenModelCopyWithImpl<$Res>
    implements $UpdateFcmTokenModelCopyWith<$Res> {
  _$UpdateFcmTokenModelCopyWithImpl(this._self, this._then);

  final UpdateFcmTokenModel _self;
  final $Res Function(UpdateFcmTokenModel) _then;

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_self.copyWith(
      fcmToken: null == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateFcmTokenModel].
extension UpdateFcmTokenModelPatterns on UpdateFcmTokenModel {
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
    TResult Function(_UpdateFcmTokenModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateFcmTokenModel() when $default != null:
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
    TResult Function(_UpdateFcmTokenModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateFcmTokenModel():
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
    TResult? Function(_UpdateFcmTokenModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateFcmTokenModel() when $default != null:
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
    TResult Function(String fcmToken)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateFcmTokenModel() when $default != null:
        return $default(_that.fcmToken);
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
    TResult Function(String fcmToken) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateFcmTokenModel():
        return $default(_that.fcmToken);
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
    TResult? Function(String fcmToken)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateFcmTokenModel() when $default != null:
        return $default(_that.fcmToken);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _UpdateFcmTokenModel implements UpdateFcmTokenModel {
  const _UpdateFcmTokenModel({required this.fcmToken});
  factory _UpdateFcmTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenModelFromJson(json);

  @override
  final String fcmToken;

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateFcmTokenModelCopyWith<_UpdateFcmTokenModel> get copyWith =>
      __$UpdateFcmTokenModelCopyWithImpl<_UpdateFcmTokenModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateFcmTokenModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateFcmTokenModel &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  @override
  String toString() {
    return 'UpdateFcmTokenModel(fcmToken: $fcmToken)';
  }
}

/// @nodoc
abstract mixin class _$UpdateFcmTokenModelCopyWith<$Res>
    implements $UpdateFcmTokenModelCopyWith<$Res> {
  factory _$UpdateFcmTokenModelCopyWith(_UpdateFcmTokenModel value,
          $Res Function(_UpdateFcmTokenModel) _then) =
      __$UpdateFcmTokenModelCopyWithImpl;
  @override
  @useResult
  $Res call({String fcmToken});
}

/// @nodoc
class __$UpdateFcmTokenModelCopyWithImpl<$Res>
    implements _$UpdateFcmTokenModelCopyWith<$Res> {
  __$UpdateFcmTokenModelCopyWithImpl(this._self, this._then);

  final _UpdateFcmTokenModel _self;
  final $Res Function(_UpdateFcmTokenModel) _then;

  /// Create a copy of UpdateFcmTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_UpdateFcmTokenModel(
      fcmToken: null == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
