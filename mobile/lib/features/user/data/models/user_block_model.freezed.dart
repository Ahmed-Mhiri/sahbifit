// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_block_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserBlockIdModel _$UserBlockIdModelFromJson(Map<String, dynamic> json) {
  return _UserBlockIdModel.fromJson(json);
}

/// @nodoc
mixin _$UserBlockIdModel {
  String get blockerUserId => throw _privateConstructorUsedError;
  String get blockedUserId => throw _privateConstructorUsedError;

  /// Serializes this UserBlockIdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockIdModelCopyWith<UserBlockIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockIdModelCopyWith<$Res> {
  factory $UserBlockIdModelCopyWith(
    UserBlockIdModel value,
    $Res Function(UserBlockIdModel) then,
  ) = _$UserBlockIdModelCopyWithImpl<$Res, UserBlockIdModel>;
  @useResult
  $Res call({String blockerUserId, String blockedUserId});
}

/// @nodoc
class _$UserBlockIdModelCopyWithImpl<$Res, $Val extends UserBlockIdModel>
    implements $UserBlockIdModelCopyWith<$Res> {
  _$UserBlockIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? blockerUserId = null, Object? blockedUserId = null}) {
    return _then(
      _value.copyWith(
            blockerUserId: null == blockerUserId
                ? _value.blockerUserId
                : blockerUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            blockedUserId: null == blockedUserId
                ? _value.blockedUserId
                : blockedUserId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserBlockIdModelImplCopyWith<$Res>
    implements $UserBlockIdModelCopyWith<$Res> {
  factory _$$UserBlockIdModelImplCopyWith(
    _$UserBlockIdModelImpl value,
    $Res Function(_$UserBlockIdModelImpl) then,
  ) = __$$UserBlockIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String blockerUserId, String blockedUserId});
}

/// @nodoc
class __$$UserBlockIdModelImplCopyWithImpl<$Res>
    extends _$UserBlockIdModelCopyWithImpl<$Res, _$UserBlockIdModelImpl>
    implements _$$UserBlockIdModelImplCopyWith<$Res> {
  __$$UserBlockIdModelImplCopyWithImpl(
    _$UserBlockIdModelImpl _value,
    $Res Function(_$UserBlockIdModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? blockerUserId = null, Object? blockedUserId = null}) {
    return _then(
      _$UserBlockIdModelImpl(
        blockerUserId: null == blockerUserId
            ? _value.blockerUserId
            : blockerUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        blockedUserId: null == blockedUserId
            ? _value.blockedUserId
            : blockedUserId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$UserBlockIdModelImpl implements _UserBlockIdModel {
  const _$UserBlockIdModelImpl({
    required this.blockerUserId,
    required this.blockedUserId,
  });

  factory _$UserBlockIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBlockIdModelImplFromJson(json);

  @override
  final String blockerUserId;
  @override
  final String blockedUserId;

  @override
  String toString() {
    return 'UserBlockIdModel(blockerUserId: $blockerUserId, blockedUserId: $blockedUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockIdModelImpl &&
            (identical(other.blockerUserId, blockerUserId) ||
                other.blockerUserId == blockerUserId) &&
            (identical(other.blockedUserId, blockedUserId) ||
                other.blockedUserId == blockedUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, blockerUserId, blockedUserId);

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockIdModelImplCopyWith<_$UserBlockIdModelImpl> get copyWith =>
      __$$UserBlockIdModelImplCopyWithImpl<_$UserBlockIdModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBlockIdModelImplToJson(this);
  }
}

abstract class _UserBlockIdModel implements UserBlockIdModel {
  const factory _UserBlockIdModel({
    required final String blockerUserId,
    required final String blockedUserId,
  }) = _$UserBlockIdModelImpl;

  factory _UserBlockIdModel.fromJson(Map<String, dynamic> json) =
      _$UserBlockIdModelImpl.fromJson;

  @override
  String get blockerUserId;
  @override
  String get blockedUserId;

  /// Create a copy of UserBlockIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockIdModelImplCopyWith<_$UserBlockIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserBlockModel _$UserBlockModelFromJson(Map<String, dynamic> json) {
  return _UserBlockModel.fromJson(json);
}

/// @nodoc
mixin _$UserBlockModel {
  UserBlockIdModel get id => throw _privateConstructorUsedError;
  UserModel get blocker =>
      throw _privateConstructorUsedError; // The user who did the blocking
  UserModel get blocked =>
      throw _privateConstructorUsedError; // The user who was blocked
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserBlockModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockModelCopyWith<UserBlockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockModelCopyWith<$Res> {
  factory $UserBlockModelCopyWith(
    UserBlockModel value,
    $Res Function(UserBlockModel) then,
  ) = _$UserBlockModelCopyWithImpl<$Res, UserBlockModel>;
  @useResult
  $Res call({
    UserBlockIdModel id,
    UserModel blocker,
    UserModel blocked,
    String createdAt,
  });

  $UserBlockIdModelCopyWith<$Res> get id;
  $UserModelCopyWith<$Res> get blocker;
  $UserModelCopyWith<$Res> get blocked;
}

/// @nodoc
class _$UserBlockModelCopyWithImpl<$Res, $Val extends UserBlockModel>
    implements $UserBlockModelCopyWith<$Res> {
  _$UserBlockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as UserBlockIdModel,
            blocker: null == blocker
                ? _value.blocker
                : blocker // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            blocked: null == blocked
                ? _value.blocked
                : blocked // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserBlockIdModelCopyWith<$Res> get id {
    return $UserBlockIdModelCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get blocker {
    return $UserModelCopyWith<$Res>(_value.blocker, (value) {
      return _then(_value.copyWith(blocker: value) as $Val);
    });
  }

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get blocked {
    return $UserModelCopyWith<$Res>(_value.blocked, (value) {
      return _then(_value.copyWith(blocked: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserBlockModelImplCopyWith<$Res>
    implements $UserBlockModelCopyWith<$Res> {
  factory _$$UserBlockModelImplCopyWith(
    _$UserBlockModelImpl value,
    $Res Function(_$UserBlockModelImpl) then,
  ) = __$$UserBlockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserBlockIdModel id,
    UserModel blocker,
    UserModel blocked,
    String createdAt,
  });

  @override
  $UserBlockIdModelCopyWith<$Res> get id;
  @override
  $UserModelCopyWith<$Res> get blocker;
  @override
  $UserModelCopyWith<$Res> get blocked;
}

/// @nodoc
class __$$UserBlockModelImplCopyWithImpl<$Res>
    extends _$UserBlockModelCopyWithImpl<$Res, _$UserBlockModelImpl>
    implements _$$UserBlockModelImplCopyWith<$Res> {
  __$$UserBlockModelImplCopyWithImpl(
    _$UserBlockModelImpl _value,
    $Res Function(_$UserBlockModelImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$UserBlockModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as UserBlockIdModel,
        blocker: null == blocker
            ? _value.blocker
            : blocker // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        blocked: null == blocked
            ? _value.blocked
            : blocked // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$UserBlockModelImpl implements _UserBlockModel {
  const _$UserBlockModelImpl({
    required this.id,
    required this.blocker,
    required this.blocked,
    required this.createdAt,
  });

  factory _$UserBlockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBlockModelImplFromJson(json);

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

  @override
  String toString() {
    return 'UserBlockModel(id: $id, blocker: $blocker, blocked: $blocked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blocker, blocker) || other.blocker == blocker) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, blocker, blocked, createdAt);

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockModelImplCopyWith<_$UserBlockModelImpl> get copyWith =>
      __$$UserBlockModelImplCopyWithImpl<_$UserBlockModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBlockModelImplToJson(this);
  }
}

abstract class _UserBlockModel implements UserBlockModel {
  const factory _UserBlockModel({
    required final UserBlockIdModel id,
    required final UserModel blocker,
    required final UserModel blocked,
    required final String createdAt,
  }) = _$UserBlockModelImpl;

  factory _UserBlockModel.fromJson(Map<String, dynamic> json) =
      _$UserBlockModelImpl.fromJson;

  @override
  UserBlockIdModel get id;
  @override
  UserModel get blocker; // The user who did the blocking
  @override
  UserModel get blocked; // The user who was blocked
  @override
  String get createdAt;

  /// Create a copy of UserBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockModelImplCopyWith<_$UserBlockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
