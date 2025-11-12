// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PendingRatingModel {
  String get sessionId;
  String get sessionTitle;
  String get userIdToRate;
  String get userNameToRate;

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PendingRatingModelCopyWith<PendingRatingModel> get copyWith =>
      _$PendingRatingModelCopyWithImpl<PendingRatingModel>(
          this as PendingRatingModel, _$identity);

  /// Serializes this PendingRatingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingRatingModel &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.sessionTitle, sessionTitle) ||
                other.sessionTitle == sessionTitle) &&
            (identical(other.userIdToRate, userIdToRate) ||
                other.userIdToRate == userIdToRate) &&
            (identical(other.userNameToRate, userNameToRate) ||
                other.userNameToRate == userNameToRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, sessionTitle, userIdToRate, userNameToRate);

  @override
  String toString() {
    return 'PendingRatingModel(sessionId: $sessionId, sessionTitle: $sessionTitle, userIdToRate: $userIdToRate, userNameToRate: $userNameToRate)';
  }
}

/// @nodoc
abstract mixin class $PendingRatingModelCopyWith<$Res> {
  factory $PendingRatingModelCopyWith(
          PendingRatingModel value, $Res Function(PendingRatingModel) _then) =
      _$PendingRatingModelCopyWithImpl;
  @useResult
  $Res call(
      {String sessionId,
      String sessionTitle,
      String userIdToRate,
      String userNameToRate});
}

/// @nodoc
class _$PendingRatingModelCopyWithImpl<$Res>
    implements $PendingRatingModelCopyWith<$Res> {
  _$PendingRatingModelCopyWithImpl(this._self, this._then);

  final PendingRatingModel _self;
  final $Res Function(PendingRatingModel) _then;

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? sessionTitle = null,
    Object? userIdToRate = null,
    Object? userNameToRate = null,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionTitle: null == sessionTitle
          ? _self.sessionTitle
          : sessionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      userIdToRate: null == userIdToRate
          ? _self.userIdToRate
          : userIdToRate // ignore: cast_nullable_to_non_nullable
              as String,
      userNameToRate: null == userNameToRate
          ? _self.userNameToRate
          : userNameToRate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PendingRatingModel].
extension PendingRatingModelPatterns on PendingRatingModel {
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
    TResult Function(_PendingRatingModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PendingRatingModel() when $default != null:
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
    TResult Function(_PendingRatingModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PendingRatingModel():
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
    TResult? Function(_PendingRatingModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PendingRatingModel() when $default != null:
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
    TResult Function(String sessionId, String sessionTitle, String userIdToRate,
            String userNameToRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PendingRatingModel() when $default != null:
        return $default(_that.sessionId, _that.sessionTitle, _that.userIdToRate,
            _that.userNameToRate);
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
    TResult Function(String sessionId, String sessionTitle, String userIdToRate,
            String userNameToRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PendingRatingModel():
        return $default(_that.sessionId, _that.sessionTitle, _that.userIdToRate,
            _that.userNameToRate);
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
    TResult? Function(String sessionId, String sessionTitle,
            String userIdToRate, String userNameToRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PendingRatingModel() when $default != null:
        return $default(_that.sessionId, _that.sessionTitle, _that.userIdToRate,
            _that.userNameToRate);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _PendingRatingModel extends PendingRatingModel {
  const _PendingRatingModel(
      {required this.sessionId,
      required this.sessionTitle,
      required this.userIdToRate,
      required this.userNameToRate})
      : super._();
  factory _PendingRatingModel.fromJson(Map<String, dynamic> json) =>
      _$PendingRatingModelFromJson(json);

  @override
  final String sessionId;
  @override
  final String sessionTitle;
  @override
  final String userIdToRate;
  @override
  final String userNameToRate;

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PendingRatingModelCopyWith<_PendingRatingModel> get copyWith =>
      __$PendingRatingModelCopyWithImpl<_PendingRatingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PendingRatingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingRatingModel &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.sessionTitle, sessionTitle) ||
                other.sessionTitle == sessionTitle) &&
            (identical(other.userIdToRate, userIdToRate) ||
                other.userIdToRate == userIdToRate) &&
            (identical(other.userNameToRate, userNameToRate) ||
                other.userNameToRate == userNameToRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, sessionTitle, userIdToRate, userNameToRate);

  @override
  String toString() {
    return 'PendingRatingModel(sessionId: $sessionId, sessionTitle: $sessionTitle, userIdToRate: $userIdToRate, userNameToRate: $userNameToRate)';
  }
}

/// @nodoc
abstract mixin class _$PendingRatingModelCopyWith<$Res>
    implements $PendingRatingModelCopyWith<$Res> {
  factory _$PendingRatingModelCopyWith(
          _PendingRatingModel value, $Res Function(_PendingRatingModel) _then) =
      __$PendingRatingModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String sessionTitle,
      String userIdToRate,
      String userNameToRate});
}

/// @nodoc
class __$PendingRatingModelCopyWithImpl<$Res>
    implements _$PendingRatingModelCopyWith<$Res> {
  __$PendingRatingModelCopyWithImpl(this._self, this._then);

  final _PendingRatingModel _self;
  final $Res Function(_PendingRatingModel) _then;

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? sessionTitle = null,
    Object? userIdToRate = null,
    Object? userNameToRate = null,
  }) {
    return _then(_PendingRatingModel(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionTitle: null == sessionTitle
          ? _self.sessionTitle
          : sessionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      userIdToRate: null == userIdToRate
          ? _self.userIdToRate
          : userIdToRate // ignore: cast_nullable_to_non_nullable
              as String,
      userNameToRate: null == userNameToRate
          ? _self.userNameToRate
          : userNameToRate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
