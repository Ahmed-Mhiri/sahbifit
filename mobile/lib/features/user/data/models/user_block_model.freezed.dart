// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_block_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBlockIdModel {
  String get blockerUserId;
  String get blockedUserId;

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBlockIdModelCopyWith<UserBlockIdModel> get copyWith =>
      _$UserBlockIdModelCopyWithImpl<UserBlockIdModel>(
          this as UserBlockIdModel, _$identity);

  /// Serializes this UserBlockIdModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBlockIdModel &&
            (identical(other.blockerUserId, blockerUserId) ||
                other.blockerUserId == blockerUserId) &&
            (identical(other.blockedUserId, blockedUserId) ||
                other.blockedUserId == blockedUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, blockerUserId, blockedUserId);

  @override
  String toString() {
    return 'UserBlockIdModel(blockerUserId: $blockerUserId, blockedUserId: $blockedUserId)';
  }
}

/// @nodoc
abstract mixin class $UserBlockIdModelCopyWith<$Res> {
  factory $UserBlockIdModelCopyWith(
          UserBlockIdModel value, $Res Function(UserBlockIdModel) _then) =
      _$UserBlockIdModelCopyWithImpl;
  @useResult
  $Res call({String blockerUserId, String blockedUserId});
}

/// @nodoc
class _$UserBlockIdModelCopyWithImpl<$Res>
    implements $UserBlockIdModelCopyWith<$Res> {
  _$UserBlockIdModelCopyWithImpl(this._self, this._then);

  final UserBlockIdModel _self;
  final $Res Function(UserBlockIdModel) _then;

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockerUserId = null,
    Object? blockedUserId = null,
  }) {
    return _then(_self.copyWith(
      blockerUserId: null == blockerUserId
          ? _self.blockerUserId
          : blockerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      blockedUserId: null == blockedUserId
          ? _self.blockedUserId
          : blockedUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserBlockIdModel].
extension UserBlockIdModelPatterns on UserBlockIdModel {
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
    TResult Function(_UserBlockIdModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBlockIdModel() when $default != null:
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
    TResult Function(_UserBlockIdModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBlockIdModel():
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
    TResult? Function(_UserBlockIdModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBlockIdModel() when $default != null:
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
    TResult Function(String blockerUserId, String blockedUserId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBlockIdModel() when $default != null:
        return $default(_that.blockerUserId, _that.blockedUserId);
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
    TResult Function(String blockerUserId, String blockedUserId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBlockIdModel():
        return $default(_that.blockerUserId, _that.blockedUserId);
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
    TResult? Function(String blockerUserId, String blockedUserId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBlockIdModel() when $default != null:
        return $default(_that.blockerUserId, _that.blockedUserId);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _UserBlockIdModel implements UserBlockIdModel {
  const _UserBlockIdModel(
      {required this.blockerUserId, required this.blockedUserId});
  factory _UserBlockIdModel.fromJson(Map<String, dynamic> json) =>
      _$UserBlockIdModelFromJson(json);

  @override
  final String blockerUserId;
  @override
  final String blockedUserId;

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserBlockIdModelCopyWith<_UserBlockIdModel> get copyWith =>
      __$UserBlockIdModelCopyWithImpl<_UserBlockIdModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserBlockIdModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserBlockIdModel &&
            (identical(other.blockerUserId, blockerUserId) ||
                other.blockerUserId == blockerUserId) &&
            (identical(other.blockedUserId, blockedUserId) ||
                other.blockedUserId == blockedUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, blockerUserId, blockedUserId);

  @override
  String toString() {
    return 'UserBlockIdModel(blockerUserId: $blockerUserId, blockedUserId: $blockedUserId)';
  }
}

/// @nodoc
abstract mixin class _$UserBlockIdModelCopyWith<$Res>
    implements $UserBlockIdModelCopyWith<$Res> {
  factory _$UserBlockIdModelCopyWith(
          _UserBlockIdModel value, $Res Function(_UserBlockIdModel) _then) =
      __$UserBlockIdModelCopyWithImpl;
  @override
  @useResult
  $Res call({String blockerUserId, String blockedUserId});
}

/// @nodoc
class __$UserBlockIdModelCopyWithImpl<$Res>
    implements _$UserBlockIdModelCopyWith<$Res> {
  __$UserBlockIdModelCopyWithImpl(this._self, this._then);

  final _UserBlockIdModel _self;
  final $Res Function(_UserBlockIdModel) _then;

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? blockerUserId = null,
    Object? blockedUserId = null,
  }) {
    return _then(_UserBlockIdModel(
      blockerUserId: null == blockerUserId
          ? _self.blockerUserId
          : blockerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      blockedUserId: null == blockedUserId
          ? _self.blockedUserId
          : blockedUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UserBlockModel {
  UserBlockIdModel get id;
  UserModel get blocker; // The user who did the blocking
  UserModel get blocked; // The user who was blocked
  String get createdAt;

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBlockModelCopyWith<UserBlockModel> get copyWith =>
      _$UserBlockModelCopyWithImpl<UserBlockModel>(
          this as UserBlockModel, _$identity);

  /// Serializes this UserBlockModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBlockModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blocker, blocker) || other.blocker == blocker) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, blocker, blocked, createdAt);

  @override
  String toString() {
    return 'UserBlockModel(id: $id, blocker: $blocker, blocked: $blocked, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $UserBlockModelCopyWith<$Res> {
  factory $UserBlockModelCopyWith(
          UserBlockModel value, $Res Function(UserBlockModel) _then) =
      _$UserBlockModelCopyWithImpl;
  @useResult
  $Res call(
      {UserBlockIdModel id,
      UserModel blocker,
      UserModel blocked,
      String createdAt});

  $UserBlockIdModelCopyWith<$Res> get id;
  $UserModelCopyWith<$Res> get blocker;
  $UserModelCopyWith<$Res> get blocked;
}

/// @nodoc
class _$UserBlockModelCopyWithImpl<$Res>
    implements $UserBlockModelCopyWith<$Res> {
  _$UserBlockModelCopyWithImpl(this._self, this._then);

  final UserBlockModel _self;
  final $Res Function(UserBlockModel) _then;

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blocker = null,
    Object? blocked = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserBlockIdModel,
      blocker: null == blocker
          ? _self.blocker
          : blocker // ignore: cast_nullable_to_non_nullable
              as UserModel,
      blocked: null == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as UserModel,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserBlockIdModelCopyWith<$Res> get id {
    return $UserBlockIdModelCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get blocker {
    return $UserModelCopyWith<$Res>(_self.blocker, (value) {
      return _then(_self.copyWith(blocker: value));
    });
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get blocked {
    return $UserModelCopyWith<$Res>(_self.blocked, (value) {
      return _then(_self.copyWith(blocked: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserBlockModel].
extension UserBlockModelPatterns on UserBlockModel {
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
    TResult Function(_UserBlockModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBlockModel() when $default != null:
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
    TResult Function(_UserBlockModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBlockModel():
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
    TResult? Function(_UserBlockModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBlockModel() when $default != null:
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
    TResult Function(UserBlockIdModel id, UserModel blocker, UserModel blocked,
            String createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBlockModel() when $default != null:
        return $default(
            _that.id, _that.blocker, _that.blocked, _that.createdAt);
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
    TResult Function(UserBlockIdModel id, UserModel blocker, UserModel blocked,
            String createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBlockModel():
        return $default(
            _that.id, _that.blocker, _that.blocked, _that.createdAt);
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
    TResult? Function(UserBlockIdModel id, UserModel blocker, UserModel blocked,
            String createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBlockModel() when $default != null:
        return $default(
            _that.id, _that.blocker, _that.blocked, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _UserBlockModel implements UserBlockModel {
  const _UserBlockModel(
      {required this.id,
      required this.blocker,
      required this.blocked,
      required this.createdAt});
  factory _UserBlockModel.fromJson(Map<String, dynamic> json) =>
      _$UserBlockModelFromJson(json);

  @override
  final UserBlockIdModel id;
  @override
  final UserModel blocker;
// The user who did the blocking
  @override
  final UserModel blocked;
// The user who was blocked
  @override
  final String createdAt;

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserBlockModelCopyWith<_UserBlockModel> get copyWith =>
      __$UserBlockModelCopyWithImpl<_UserBlockModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserBlockModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserBlockModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blocker, blocker) || other.blocker == blocker) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, blocker, blocked, createdAt);

  @override
  String toString() {
    return 'UserBlockModel(id: $id, blocker: $blocker, blocked: $blocked, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UserBlockModelCopyWith<$Res>
    implements $UserBlockModelCopyWith<$Res> {
  factory _$UserBlockModelCopyWith(
          _UserBlockModel value, $Res Function(_UserBlockModel) _then) =
      __$UserBlockModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserBlockIdModel id,
      UserModel blocker,
      UserModel blocked,
      String createdAt});

  @override
  $UserBlockIdModelCopyWith<$Res> get id;
  @override
  $UserModelCopyWith<$Res> get blocker;
  @override
  $UserModelCopyWith<$Res> get blocked;
}

/// @nodoc
class __$UserBlockModelCopyWithImpl<$Res>
    implements _$UserBlockModelCopyWith<$Res> {
  __$UserBlockModelCopyWithImpl(this._self, this._then);

  final _UserBlockModel _self;
  final $Res Function(_UserBlockModel) _then;

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? blocker = null,
    Object? blocked = null,
    Object? createdAt = null,
  }) {
    return _then(_UserBlockModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserBlockIdModel,
      blocker: null == blocker
          ? _self.blocker
          : blocker // ignore: cast_nullable_to_non_nullable
              as UserModel,
      blocked: null == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as UserModel,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserBlockIdModelCopyWith<$Res> get id {
    return $UserBlockIdModelCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get blocker {
    return $UserModelCopyWith<$Res>(_self.blocker, (value) {
      return _then(_self.copyWith(blocker: value));
    });
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get blocked {
    return $UserModelCopyWith<$Res>(_self.blocked, (value) {
      return _then(_self.copyWith(blocked: value));
    });
  }
}

// dart format on
