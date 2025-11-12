// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_badge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserBadgeIdModel _$UserBadgeIdModelFromJson(Map<String, dynamic> json) {
  return _UserBadgeIdModel.fromJson(json);
}

/// @nodoc
mixin _$UserBadgeIdModel {
  String get userId => throw _privateConstructorUsedError;
  int get badgeId => throw _privateConstructorUsedError;

  /// Serializes this UserBadgeIdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBadgeIdModelCopyWith<UserBadgeIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBadgeIdModelCopyWith<$Res> {
  factory $UserBadgeIdModelCopyWith(
    UserBadgeIdModel value,
    $Res Function(UserBadgeIdModel) then,
  ) = _$UserBadgeIdModelCopyWithImpl<$Res, UserBadgeIdModel>;
  @useResult
  $Res call({String userId, int badgeId});
}

/// @nodoc
class _$UserBadgeIdModelCopyWithImpl<$Res, $Val extends UserBadgeIdModel>
    implements $UserBadgeIdModelCopyWith<$Res> {
  _$UserBadgeIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? badgeId = null}) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            badgeId: null == badgeId
                ? _value.badgeId
                : badgeId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserBadgeIdModelImplCopyWith<$Res>
    implements $UserBadgeIdModelCopyWith<$Res> {
  factory _$$UserBadgeIdModelImplCopyWith(
    _$UserBadgeIdModelImpl value,
    $Res Function(_$UserBadgeIdModelImpl) then,
  ) = __$$UserBadgeIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int badgeId});
}

/// @nodoc
class __$$UserBadgeIdModelImplCopyWithImpl<$Res>
    extends _$UserBadgeIdModelCopyWithImpl<$Res, _$UserBadgeIdModelImpl>
    implements _$$UserBadgeIdModelImplCopyWith<$Res> {
  __$$UserBadgeIdModelImplCopyWithImpl(
    _$UserBadgeIdModelImpl _value,
    $Res Function(_$UserBadgeIdModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? badgeId = null}) {
    return _then(
      _$UserBadgeIdModelImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        badgeId: null == badgeId
            ? _value.badgeId
            : badgeId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$UserBadgeIdModelImpl implements _UserBadgeIdModel {
  const _$UserBadgeIdModelImpl({required this.userId, required this.badgeId});

  factory _$UserBadgeIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBadgeIdModelImplFromJson(json);

  @override
  final String userId;
  @override
  final int badgeId;

  @override
  String toString() {
    return 'UserBadgeIdModel(userId: $userId, badgeId: $badgeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBadgeIdModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.badgeId, badgeId) || other.badgeId == badgeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, badgeId);

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBadgeIdModelImplCopyWith<_$UserBadgeIdModelImpl> get copyWith =>
      __$$UserBadgeIdModelImplCopyWithImpl<_$UserBadgeIdModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBadgeIdModelImplToJson(this);
  }
}

abstract class _UserBadgeIdModel implements UserBadgeIdModel {
  const factory _UserBadgeIdModel({
    required final String userId,
    required final int badgeId,
  }) = _$UserBadgeIdModelImpl;

  factory _UserBadgeIdModel.fromJson(Map<String, dynamic> json) =
      _$UserBadgeIdModelImpl.fromJson;

  @override
  String get userId;
  @override
  int get badgeId;

  /// Create a copy of UserBadgeIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBadgeIdModelImplCopyWith<_$UserBadgeIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserBadgeModel _$UserBadgeModelFromJson(Map<String, dynamic> json) {
  return _UserBadgeModel.fromJson(json);
}

/// @nodoc
mixin _$UserBadgeModel {
  UserBadgeIdModel get id => throw _privateConstructorUsedError;
  BadgeModel get badge =>
      throw _privateConstructorUsedError; // The badge that was earned
  String get earnedAt => throw _privateConstructorUsedError;

  /// Serializes this UserBadgeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBadgeModelCopyWith<UserBadgeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBadgeModelCopyWith<$Res> {
  factory $UserBadgeModelCopyWith(
    UserBadgeModel value,
    $Res Function(UserBadgeModel) then,
  ) = _$UserBadgeModelCopyWithImpl<$Res, UserBadgeModel>;
  @useResult
  $Res call({UserBadgeIdModel id, BadgeModel badge, String earnedAt});

  $UserBadgeIdModelCopyWith<$Res> get id;
  $BadgeModelCopyWith<$Res> get badge;
}

/// @nodoc
class _$UserBadgeModelCopyWithImpl<$Res, $Val extends UserBadgeModel>
    implements $UserBadgeModelCopyWith<$Res> {
  _$UserBadgeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? badge = null,
    Object? earnedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as UserBadgeIdModel,
            badge: null == badge
                ? _value.badge
                : badge // ignore: cast_nullable_to_non_nullable
                      as BadgeModel,
            earnedAt: null == earnedAt
                ? _value.earnedAt
                : earnedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserBadgeIdModelCopyWith<$Res> get id {
    return $UserBadgeIdModelCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BadgeModelCopyWith<$Res> get badge {
    return $BadgeModelCopyWith<$Res>(_value.badge, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserBadgeModelImplCopyWith<$Res>
    implements $UserBadgeModelCopyWith<$Res> {
  factory _$$UserBadgeModelImplCopyWith(
    _$UserBadgeModelImpl value,
    $Res Function(_$UserBadgeModelImpl) then,
  ) = __$$UserBadgeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserBadgeIdModel id, BadgeModel badge, String earnedAt});

  @override
  $UserBadgeIdModelCopyWith<$Res> get id;
  @override
  $BadgeModelCopyWith<$Res> get badge;
}

/// @nodoc
class __$$UserBadgeModelImplCopyWithImpl<$Res>
    extends _$UserBadgeModelCopyWithImpl<$Res, _$UserBadgeModelImpl>
    implements _$$UserBadgeModelImplCopyWith<$Res> {
  __$$UserBadgeModelImplCopyWithImpl(
    _$UserBadgeModelImpl _value,
    $Res Function(_$UserBadgeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? badge = null,
    Object? earnedAt = null,
  }) {
    return _then(
      _$UserBadgeModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as UserBadgeIdModel,
        badge: null == badge
            ? _value.badge
            : badge // ignore: cast_nullable_to_non_nullable
                  as BadgeModel,
        earnedAt: null == earnedAt
            ? _value.earnedAt
            : earnedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$UserBadgeModelImpl implements _UserBadgeModel {
  const _$UserBadgeModelImpl({
    required this.id,
    required this.badge,
    required this.earnedAt,
  });

  factory _$UserBadgeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBadgeModelImplFromJson(json);

  @override
  final UserBadgeIdModel id;
  @override
  final BadgeModel badge;
  // The badge that was earned
  @override
  final String earnedAt;

  @override
  String toString() {
    return 'UserBadgeModel(id: $id, badge: $badge, earnedAt: $earnedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBadgeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.earnedAt, earnedAt) ||
                other.earnedAt == earnedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, badge, earnedAt);

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBadgeModelImplCopyWith<_$UserBadgeModelImpl> get copyWith =>
      __$$UserBadgeModelImplCopyWithImpl<_$UserBadgeModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBadgeModelImplToJson(this);
  }
}

abstract class _UserBadgeModel implements UserBadgeModel {
  const factory _UserBadgeModel({
    required final UserBadgeIdModel id,
    required final BadgeModel badge,
    required final String earnedAt,
  }) = _$UserBadgeModelImpl;

  factory _UserBadgeModel.fromJson(Map<String, dynamic> json) =
      _$UserBadgeModelImpl.fromJson;

  @override
  UserBadgeIdModel get id;
  @override
  BadgeModel get badge; // The badge that was earned
  @override
  String get earnedAt;

  /// Create a copy of UserBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBadgeModelImplCopyWith<_$UserBadgeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
