// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_badge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBadgeIdModel {
  String get userId;
  int get badgeId;

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBadgeIdModelCopyWith<UserBadgeIdModel> get copyWith =>
      _$UserBadgeIdModelCopyWithImpl<UserBadgeIdModel>(
          this as UserBadgeIdModel, _$identity);

  /// Serializes this UserBadgeIdModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBadgeIdModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.badgeId, badgeId) || other.badgeId == badgeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, badgeId);

  @override
  String toString() {
    return 'UserBadgeIdModel(userId: $userId, badgeId: $badgeId)';
  }
}

/// @nodoc
abstract mixin class $UserBadgeIdModelCopyWith<$Res> {
  factory $UserBadgeIdModelCopyWith(
          UserBadgeIdModel value, $Res Function(UserBadgeIdModel) _then) =
      _$UserBadgeIdModelCopyWithImpl;
  @useResult
  $Res call({String userId, int badgeId});
}

/// @nodoc
class _$UserBadgeIdModelCopyWithImpl<$Res>
    implements $UserBadgeIdModelCopyWith<$Res> {
  _$UserBadgeIdModelCopyWithImpl(this._self, this._then);

  final UserBadgeIdModel _self;
  final $Res Function(UserBadgeIdModel) _then;

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? badgeId = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      badgeId: null == badgeId
          ? _self.badgeId
          : badgeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserBadgeIdModel].
extension UserBadgeIdModelPatterns on UserBadgeIdModel {
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
    TResult Function(_UserBadgeIdModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBadgeIdModel() when $default != null:
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
    TResult Function(_UserBadgeIdModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBadgeIdModel():
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
    TResult? Function(_UserBadgeIdModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBadgeIdModel() when $default != null:
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
    TResult Function(String userId, int badgeId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBadgeIdModel() when $default != null:
        return $default(_that.userId, _that.badgeId);
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
    TResult Function(String userId, int badgeId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBadgeIdModel():
        return $default(_that.userId, _that.badgeId);
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
    TResult? Function(String userId, int badgeId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBadgeIdModel() when $default != null:
        return $default(_that.userId, _that.badgeId);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _UserBadgeIdModel implements UserBadgeIdModel {
  const _UserBadgeIdModel({required this.userId, required this.badgeId});
  factory _UserBadgeIdModel.fromJson(Map<String, dynamic> json) =>
      _$UserBadgeIdModelFromJson(json);

  @override
  final String userId;
  @override
  final int badgeId;

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserBadgeIdModelCopyWith<_UserBadgeIdModel> get copyWith =>
      __$UserBadgeIdModelCopyWithImpl<_UserBadgeIdModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserBadgeIdModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserBadgeIdModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.badgeId, badgeId) || other.badgeId == badgeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, badgeId);

  @override
  String toString() {
    return 'UserBadgeIdModel(userId: $userId, badgeId: $badgeId)';
  }
}

/// @nodoc
abstract mixin class _$UserBadgeIdModelCopyWith<$Res>
    implements $UserBadgeIdModelCopyWith<$Res> {
  factory _$UserBadgeIdModelCopyWith(
          _UserBadgeIdModel value, $Res Function(_UserBadgeIdModel) _then) =
      __$UserBadgeIdModelCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, int badgeId});
}

/// @nodoc
class __$UserBadgeIdModelCopyWithImpl<$Res>
    implements _$UserBadgeIdModelCopyWith<$Res> {
  __$UserBadgeIdModelCopyWithImpl(this._self, this._then);

  final _UserBadgeIdModel _self;
  final $Res Function(_UserBadgeIdModel) _then;

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? badgeId = null,
  }) {
    return _then(_UserBadgeIdModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      badgeId: null == badgeId
          ? _self.badgeId
          : badgeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$UserBadgeModel {
  UserBadgeIdModel get id;
  BadgeModel get badge; // The badge that was earned
  String get earnedAt;

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBadgeModelCopyWith<UserBadgeModel> get copyWith =>
      _$UserBadgeModelCopyWithImpl<UserBadgeModel>(
          this as UserBadgeModel, _$identity);

  /// Serializes this UserBadgeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBadgeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.earnedAt, earnedAt) ||
                other.earnedAt == earnedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, badge, earnedAt);

  @override
  String toString() {
    return 'UserBadgeModel(id: $id, badge: $badge, earnedAt: $earnedAt)';
  }
}

/// @nodoc
abstract mixin class $UserBadgeModelCopyWith<$Res> {
  factory $UserBadgeModelCopyWith(
          UserBadgeModel value, $Res Function(UserBadgeModel) _then) =
      _$UserBadgeModelCopyWithImpl;
  @useResult
  $Res call({UserBadgeIdModel id, BadgeModel badge, String earnedAt});

  $UserBadgeIdModelCopyWith<$Res> get id;
  $BadgeModelCopyWith<$Res> get badge;
}

/// @nodoc
class _$UserBadgeModelCopyWithImpl<$Res>
    implements $UserBadgeModelCopyWith<$Res> {
  _$UserBadgeModelCopyWithImpl(this._self, this._then);

  final UserBadgeModel _self;
  final $Res Function(UserBadgeModel) _then;

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? badge = null,
    Object? earnedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserBadgeIdModel,
      badge: null == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as BadgeModel,
      earnedAt: null == earnedAt
          ? _self.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserBadgeIdModelCopyWith<$Res> get id {
    return $UserBadgeIdModelCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BadgeModelCopyWith<$Res> get badge {
    return $BadgeModelCopyWith<$Res>(_self.badge, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserBadgeModel].
extension UserBadgeModelPatterns on UserBadgeModel {
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
    TResult Function(_UserBadgeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBadgeModel() when $default != null:
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
    TResult Function(_UserBadgeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBadgeModel():
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
    TResult? Function(_UserBadgeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBadgeModel() when $default != null:
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
    TResult Function(UserBadgeIdModel id, BadgeModel badge, String earnedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBadgeModel() when $default != null:
        return $default(_that.id, _that.badge, _that.earnedAt);
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
    TResult Function(UserBadgeIdModel id, BadgeModel badge, String earnedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBadgeModel():
        return $default(_that.id, _that.badge, _that.earnedAt);
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
    TResult? Function(UserBadgeIdModel id, BadgeModel badge, String earnedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBadgeModel() when $default != null:
        return $default(_that.id, _that.badge, _that.earnedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _UserBadgeModel implements UserBadgeModel {
  const _UserBadgeModel(
      {required this.id, required this.badge, required this.earnedAt});
  factory _UserBadgeModel.fromJson(Map<String, dynamic> json) =>
      _$UserBadgeModelFromJson(json);

  @override
  final UserBadgeIdModel id;
  @override
  final BadgeModel badge;
// The badge that was earned
  @override
  final String earnedAt;

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserBadgeModelCopyWith<_UserBadgeModel> get copyWith =>
      __$UserBadgeModelCopyWithImpl<_UserBadgeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserBadgeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserBadgeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.earnedAt, earnedAt) ||
                other.earnedAt == earnedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, badge, earnedAt);

  @override
  String toString() {
    return 'UserBadgeModel(id: $id, badge: $badge, earnedAt: $earnedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserBadgeModelCopyWith<$Res>
    implements $UserBadgeModelCopyWith<$Res> {
  factory _$UserBadgeModelCopyWith(
          _UserBadgeModel value, $Res Function(_UserBadgeModel) _then) =
      __$UserBadgeModelCopyWithImpl;
  @override
  @useResult
  $Res call({UserBadgeIdModel id, BadgeModel badge, String earnedAt});

  @override
  $UserBadgeIdModelCopyWith<$Res> get id;
  @override
  $BadgeModelCopyWith<$Res> get badge;
}

/// @nodoc
class __$UserBadgeModelCopyWithImpl<$Res>
    implements _$UserBadgeModelCopyWith<$Res> {
  __$UserBadgeModelCopyWithImpl(this._self, this._then);

  final _UserBadgeModel _self;
  final $Res Function(_UserBadgeModel) _then;

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? badge = null,
    Object? earnedAt = null,
  }) {
    return _then(_UserBadgeModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserBadgeIdModel,
      badge: null == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as BadgeModel,
      earnedAt: null == earnedAt
          ? _self.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserBadgeIdModelCopyWith<$Res> get id {
    return $UserBadgeIdModelCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BadgeModelCopyWith<$Res> get badge {
    return $BadgeModelCopyWith<$Res>(_self.badge, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }
}

// dart format on
