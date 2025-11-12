// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_participant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SessionParticipantIdModel _$SessionParticipantIdModelFromJson(
  Map<String, dynamic> json,
) {
  return _SessionParticipantIdModel.fromJson(json);
}

/// @nodoc
mixin _$SessionParticipantIdModel {
  String get sessionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this SessionParticipantIdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionParticipantIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionParticipantIdModelCopyWith<SessionParticipantIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionParticipantIdModelCopyWith<$Res> {
  factory $SessionParticipantIdModelCopyWith(
    SessionParticipantIdModel value,
    $Res Function(SessionParticipantIdModel) then,
  ) = _$SessionParticipantIdModelCopyWithImpl<$Res, SessionParticipantIdModel>;
  @useResult
  $Res call({String sessionId, String userId});
}

/// @nodoc
class _$SessionParticipantIdModelCopyWithImpl<
  $Res,
  $Val extends SessionParticipantIdModel
>
    implements $SessionParticipantIdModelCopyWith<$Res> {
  _$SessionParticipantIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionParticipantIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sessionId = null, Object? userId = null}) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SessionParticipantIdModelImplCopyWith<$Res>
    implements $SessionParticipantIdModelCopyWith<$Res> {
  factory _$$SessionParticipantIdModelImplCopyWith(
    _$SessionParticipantIdModelImpl value,
    $Res Function(_$SessionParticipantIdModelImpl) then,
  ) = __$$SessionParticipantIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionId, String userId});
}

/// @nodoc
class __$$SessionParticipantIdModelImplCopyWithImpl<$Res>
    extends
        _$SessionParticipantIdModelCopyWithImpl<
          $Res,
          _$SessionParticipantIdModelImpl
        >
    implements _$$SessionParticipantIdModelImplCopyWith<$Res> {
  __$$SessionParticipantIdModelImplCopyWithImpl(
    _$SessionParticipantIdModelImpl _value,
    $Res Function(_$SessionParticipantIdModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionParticipantIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sessionId = null, Object? userId = null}) {
    return _then(
      _$SessionParticipantIdModelImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$SessionParticipantIdModelImpl implements _SessionParticipantIdModel {
  const _$SessionParticipantIdModelImpl({
    required this.sessionId,
    required this.userId,
  });

  factory _$SessionParticipantIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionParticipantIdModelImplFromJson(json);

  @override
  final String sessionId;
  @override
  final String userId;

  @override
  String toString() {
    return 'SessionParticipantIdModel(sessionId: $sessionId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionParticipantIdModelImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, userId);

  /// Create a copy of SessionParticipantIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionParticipantIdModelImplCopyWith<_$SessionParticipantIdModelImpl>
  get copyWith =>
      __$$SessionParticipantIdModelImplCopyWithImpl<
        _$SessionParticipantIdModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionParticipantIdModelImplToJson(this);
  }
}

abstract class _SessionParticipantIdModel implements SessionParticipantIdModel {
  const factory _SessionParticipantIdModel({
    required final String sessionId,
    required final String userId,
  }) = _$SessionParticipantIdModelImpl;

  factory _SessionParticipantIdModel.fromJson(Map<String, dynamic> json) =
      _$SessionParticipantIdModelImpl.fromJson;

  @override
  String get sessionId;
  @override
  String get userId;

  /// Create a copy of SessionParticipantIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionParticipantIdModelImplCopyWith<_$SessionParticipantIdModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SessionParticipantModel _$SessionParticipantModelFromJson(
  Map<String, dynamic> json,
) {
  return _SessionParticipantModel.fromJson(json);
}

/// @nodoc
mixin _$SessionParticipantModel {
  SessionParticipantIdModel get id => throw _privateConstructorUsedError;
  UserModel get user =>
      throw _privateConstructorUsedError; // The user who joined
  ParticipantStatus get status => throw _privateConstructorUsedError;
  String get joinedAt => throw _privateConstructorUsedError;

  /// Serializes this SessionParticipantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionParticipantModelCopyWith<SessionParticipantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionParticipantModelCopyWith<$Res> {
  factory $SessionParticipantModelCopyWith(
    SessionParticipantModel value,
    $Res Function(SessionParticipantModel) then,
  ) = _$SessionParticipantModelCopyWithImpl<$Res, SessionParticipantModel>;
  @useResult
  $Res call({
    SessionParticipantIdModel id,
    UserModel user,
    ParticipantStatus status,
    String joinedAt,
  });

  $SessionParticipantIdModelCopyWith<$Res> get id;
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$SessionParticipantModelCopyWithImpl<
  $Res,
  $Val extends SessionParticipantModel
>
    implements $SessionParticipantModelCopyWith<$Res> {
  _$SessionParticipantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? status = null,
    Object? joinedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as SessionParticipantIdModel,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ParticipantStatus,
            joinedAt: null == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of SessionParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionParticipantIdModelCopyWith<$Res> get id {
    return $SessionParticipantIdModelCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  /// Create a copy of SessionParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionParticipantModelImplCopyWith<$Res>
    implements $SessionParticipantModelCopyWith<$Res> {
  factory _$$SessionParticipantModelImplCopyWith(
    _$SessionParticipantModelImpl value,
    $Res Function(_$SessionParticipantModelImpl) then,
  ) = __$$SessionParticipantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SessionParticipantIdModel id,
    UserModel user,
    ParticipantStatus status,
    String joinedAt,
  });

  @override
  $SessionParticipantIdModelCopyWith<$Res> get id;
  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$SessionParticipantModelImplCopyWithImpl<$Res>
    extends
        _$SessionParticipantModelCopyWithImpl<
          $Res,
          _$SessionParticipantModelImpl
        >
    implements _$$SessionParticipantModelImplCopyWith<$Res> {
  __$$SessionParticipantModelImplCopyWithImpl(
    _$SessionParticipantModelImpl _value,
    $Res Function(_$SessionParticipantModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? status = null,
    Object? joinedAt = null,
  }) {
    return _then(
      _$SessionParticipantModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as SessionParticipantIdModel,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ParticipantStatus,
        joinedAt: null == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$SessionParticipantModelImpl extends _SessionParticipantModel {
  const _$SessionParticipantModelImpl({
    required this.id,
    required this.user,
    required this.status,
    required this.joinedAt,
  }) : super._();

  factory _$SessionParticipantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionParticipantModelImplFromJson(json);

  @override
  final SessionParticipantIdModel id;
  @override
  final UserModel user;
  // The user who joined
  @override
  final ParticipantStatus status;
  @override
  final String joinedAt;

  @override
  String toString() {
    return 'SessionParticipantModel(id: $id, user: $user, status: $status, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionParticipantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, status, joinedAt);

  /// Create a copy of SessionParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionParticipantModelImplCopyWith<_$SessionParticipantModelImpl>
  get copyWith =>
      __$$SessionParticipantModelImplCopyWithImpl<
        _$SessionParticipantModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionParticipantModelImplToJson(this);
  }
}

abstract class _SessionParticipantModel extends SessionParticipantModel {
  const factory _SessionParticipantModel({
    required final SessionParticipantIdModel id,
    required final UserModel user,
    required final ParticipantStatus status,
    required final String joinedAt,
  }) = _$SessionParticipantModelImpl;
  const _SessionParticipantModel._() : super._();

  factory _SessionParticipantModel.fromJson(Map<String, dynamic> json) =
      _$SessionParticipantModelImpl.fromJson;

  @override
  SessionParticipantIdModel get id;
  @override
  UserModel get user; // The user who joined
  @override
  ParticipantStatus get status;
  @override
  String get joinedAt;

  /// Create a copy of SessionParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionParticipantModelImplCopyWith<_$SessionParticipantModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
