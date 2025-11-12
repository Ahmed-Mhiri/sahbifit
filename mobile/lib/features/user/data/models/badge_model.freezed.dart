// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BadgeModel {
  int get badgeId;
  String get badgeName;
  String get description;
  String? get iconUrl;

  /// Create a copy of BadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BadgeModelCopyWith<BadgeModel> get copyWith =>
      _$BadgeModelCopyWithImpl<BadgeModel>(this as BadgeModel, _$identity);

  /// Serializes this BadgeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BadgeModel &&
            (identical(other.badgeId, badgeId) || other.badgeId == badgeId) &&
            (identical(other.badgeName, badgeName) ||
                other.badgeName == badgeName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, badgeId, badgeName, description, iconUrl);

  @override
  String toString() {
    return 'BadgeModel(badgeId: $badgeId, badgeName: $badgeName, description: $description, iconUrl: $iconUrl)';
  }
}

/// @nodoc
abstract mixin class $BadgeModelCopyWith<$Res> {
  factory $BadgeModelCopyWith(
          BadgeModel value, $Res Function(BadgeModel) _then) =
      _$BadgeModelCopyWithImpl;
  @useResult
  $Res call(
      {int badgeId, String badgeName, String description, String? iconUrl});
}

/// @nodoc
class _$BadgeModelCopyWithImpl<$Res> implements $BadgeModelCopyWith<$Res> {
  _$BadgeModelCopyWithImpl(this._self, this._then);

  final BadgeModel _self;
  final $Res Function(BadgeModel) _then;

  /// Create a copy of BadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgeId = null,
    Object? badgeName = null,
    Object? description = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_self.copyWith(
      badgeId: null == badgeId
          ? _self.badgeId
          : badgeId // ignore: cast_nullable_to_non_nullable
              as int,
      badgeName: null == badgeName
          ? _self.badgeName
          : badgeName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _self.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BadgeModel].
extension BadgeModelPatterns on BadgeModel {
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
    TResult Function(_BadgeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BadgeModel() when $default != null:
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
    TResult Function(_BadgeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BadgeModel():
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
    TResult? Function(_BadgeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BadgeModel() when $default != null:
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
    TResult Function(
            int badgeId, String badgeName, String description, String? iconUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BadgeModel() when $default != null:
        return $default(
            _that.badgeId, _that.badgeName, _that.description, _that.iconUrl);
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
    TResult Function(
            int badgeId, String badgeName, String description, String? iconUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BadgeModel():
        return $default(
            _that.badgeId, _that.badgeName, _that.description, _that.iconUrl);
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
    TResult? Function(
            int badgeId, String badgeName, String description, String? iconUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BadgeModel() when $default != null:
        return $default(
            _that.badgeId, _that.badgeName, _that.description, _that.iconUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _BadgeModel extends BadgeModel {
  const _BadgeModel(
      {required this.badgeId,
      required this.badgeName,
      required this.description,
      this.iconUrl})
      : super._();
  factory _BadgeModel.fromJson(Map<String, dynamic> json) =>
      _$BadgeModelFromJson(json);

  @override
  final int badgeId;
  @override
  final String badgeName;
  @override
  final String description;
  @override
  final String? iconUrl;

  /// Create a copy of BadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BadgeModelCopyWith<_BadgeModel> get copyWith =>
      __$BadgeModelCopyWithImpl<_BadgeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BadgeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BadgeModel &&
            (identical(other.badgeId, badgeId) || other.badgeId == badgeId) &&
            (identical(other.badgeName, badgeName) ||
                other.badgeName == badgeName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, badgeId, badgeName, description, iconUrl);

  @override
  String toString() {
    return 'BadgeModel(badgeId: $badgeId, badgeName: $badgeName, description: $description, iconUrl: $iconUrl)';
  }
}

/// @nodoc
abstract mixin class _$BadgeModelCopyWith<$Res>
    implements $BadgeModelCopyWith<$Res> {
  factory _$BadgeModelCopyWith(
          _BadgeModel value, $Res Function(_BadgeModel) _then) =
      __$BadgeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int badgeId, String badgeName, String description, String? iconUrl});
}

/// @nodoc
class __$BadgeModelCopyWithImpl<$Res> implements _$BadgeModelCopyWith<$Res> {
  __$BadgeModelCopyWithImpl(this._self, this._then);

  final _BadgeModel _self;
  final $Res Function(_BadgeModel) _then;

  /// Create a copy of BadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? badgeId = null,
    Object? badgeName = null,
    Object? description = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_BadgeModel(
      badgeId: null == badgeId
          ? _self.badgeId
          : badgeId // ignore: cast_nullable_to_non_nullable
              as int,
      badgeName: null == badgeName
          ? _self.badgeName
          : badgeName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _self.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
