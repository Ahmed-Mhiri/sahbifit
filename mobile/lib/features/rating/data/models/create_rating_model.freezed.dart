// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateRatingModel {
  String get sessionId;
  String get ratedUserId;
  int get ratingValue; // 'Short' maps to 'int'
  String? get comment;

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateRatingModelCopyWith<CreateRatingModel> get copyWith =>
      _$CreateRatingModelCopyWithImpl<CreateRatingModel>(
          this as CreateRatingModel, _$identity);

  /// Serializes this CreateRatingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateRatingModel &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.ratedUserId, ratedUserId) ||
                other.ratedUserId == ratedUserId) &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, ratedUserId, ratingValue, comment);

  @override
  String toString() {
    return 'CreateRatingModel(sessionId: $sessionId, ratedUserId: $ratedUserId, ratingValue: $ratingValue, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class $CreateRatingModelCopyWith<$Res> {
  factory $CreateRatingModelCopyWith(
          CreateRatingModel value, $Res Function(CreateRatingModel) _then) =
      _$CreateRatingModelCopyWithImpl;
  @useResult
  $Res call(
      {String sessionId, String ratedUserId, int ratingValue, String? comment});
}

/// @nodoc
class _$CreateRatingModelCopyWithImpl<$Res>
    implements $CreateRatingModelCopyWith<$Res> {
  _$CreateRatingModelCopyWithImpl(this._self, this._then);

  final CreateRatingModel _self;
  final $Res Function(CreateRatingModel) _then;

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? ratedUserId = null,
    Object? ratingValue = null,
    Object? comment = freezed,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      ratedUserId: null == ratedUserId
          ? _self.ratedUserId
          : ratedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      ratingValue: null == ratingValue
          ? _self.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateRatingModel].
extension CreateRatingModelPatterns on CreateRatingModel {
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
    TResult Function(_CreateRatingModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateRatingModel() when $default != null:
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
    TResult Function(_CreateRatingModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRatingModel():
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
    TResult? Function(_CreateRatingModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRatingModel() when $default != null:
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
    TResult Function(String sessionId, String ratedUserId, int ratingValue,
            String? comment)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateRatingModel() when $default != null:
        return $default(_that.sessionId, _that.ratedUserId, _that.ratingValue,
            _that.comment);
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
    TResult Function(String sessionId, String ratedUserId, int ratingValue,
            String? comment)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRatingModel():
        return $default(_that.sessionId, _that.ratedUserId, _that.ratingValue,
            _that.comment);
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
    TResult? Function(String sessionId, String ratedUserId, int ratingValue,
            String? comment)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRatingModel() when $default != null:
        return $default(_that.sessionId, _that.ratedUserId, _that.ratingValue,
            _that.comment);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _CreateRatingModel implements CreateRatingModel {
  const _CreateRatingModel(
      {required this.sessionId,
      required this.ratedUserId,
      required this.ratingValue,
      this.comment});
  factory _CreateRatingModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRatingModelFromJson(json);

  @override
  final String sessionId;
  @override
  final String ratedUserId;
  @override
  final int ratingValue;
// 'Short' maps to 'int'
  @override
  final String? comment;

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateRatingModelCopyWith<_CreateRatingModel> get copyWith =>
      __$CreateRatingModelCopyWithImpl<_CreateRatingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateRatingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateRatingModel &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.ratedUserId, ratedUserId) ||
                other.ratedUserId == ratedUserId) &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, ratedUserId, ratingValue, comment);

  @override
  String toString() {
    return 'CreateRatingModel(sessionId: $sessionId, ratedUserId: $ratedUserId, ratingValue: $ratingValue, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class _$CreateRatingModelCopyWith<$Res>
    implements $CreateRatingModelCopyWith<$Res> {
  factory _$CreateRatingModelCopyWith(
          _CreateRatingModel value, $Res Function(_CreateRatingModel) _then) =
      __$CreateRatingModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sessionId, String ratedUserId, int ratingValue, String? comment});
}

/// @nodoc
class __$CreateRatingModelCopyWithImpl<$Res>
    implements _$CreateRatingModelCopyWith<$Res> {
  __$CreateRatingModelCopyWithImpl(this._self, this._then);

  final _CreateRatingModel _self;
  final $Res Function(_CreateRatingModel) _then;

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? ratedUserId = null,
    Object? ratingValue = null,
    Object? comment = freezed,
  }) {
    return _then(_CreateRatingModel(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      ratedUserId: null == ratedUserId
          ? _self.ratedUserId
          : ratedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      ratingValue: null == ratingValue
          ? _self.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
