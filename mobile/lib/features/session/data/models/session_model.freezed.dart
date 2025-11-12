// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) {
  return _SessionModel.fromJson(json);
}

/// @nodoc
mixin _$SessionModel {
  String get sessionId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  SessionType get sessionType => throw _privateConstructorUsedError;
  SessionStatus get status => throw _privateConstructorUsedError;
  String get startTime =>
      throw _privateConstructorUsedError; // Receive as ISO 8601 String
  String get endTime =>
      throw _privateConstructorUsedError; // Receive as ISO 8601 String
  int get maxParticipants => throw _privateConstructorUsedError;
  int get participantCount => throw _privateConstructorUsedError;
  UserModel get creator =>
      throw _privateConstructorUsedError; // Nested JSON object
  GymModel get gym => throw _privateConstructorUsedError;

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionModelCopyWith<SessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionModelCopyWith<$Res> {
  factory $SessionModelCopyWith(
    SessionModel value,
    $Res Function(SessionModel) then,
  ) = _$SessionModelCopyWithImpl<$Res, SessionModel>;
  @useResult
  $Res call({
    String sessionId,
    String title,
    SessionType sessionType,
    SessionStatus status,
    String startTime,
    String endTime,
    int maxParticipants,
    int participantCount,
    UserModel creator,
    GymModel gym,
  });

  $UserModelCopyWith<$Res> get creator;
  $GymModelCopyWith<$Res> get gym;
}

/// @nodoc
class _$SessionModelCopyWithImpl<$Res, $Val extends SessionModel>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? title = null,
    Object? sessionType = null,
    Object? status = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxParticipants = null,
    Object? participantCount = null,
    Object? creator = null,
    Object? gym = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionType: null == sessionType
                ? _value.sessionType
                : sessionType // ignore: cast_nullable_to_non_nullable
                      as SessionType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as SessionStatus,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
            maxParticipants: null == maxParticipants
                ? _value.maxParticipants
                : maxParticipants // ignore: cast_nullable_to_non_nullable
                      as int,
            participantCount: null == participantCount
                ? _value.participantCount
                : participantCount // ignore: cast_nullable_to_non_nullable
                      as int,
            creator: null == creator
                ? _value.creator
                : creator // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            gym: null == gym
                ? _value.gym
                : gym // ignore: cast_nullable_to_non_nullable
                      as GymModel,
          )
          as $Val,
    );
  }

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get creator {
    return $UserModelCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GymModelCopyWith<$Res> get gym {
    return $GymModelCopyWith<$Res>(_value.gym, (value) {
      return _then(_value.copyWith(gym: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionModelImplCopyWith<$Res>
    implements $SessionModelCopyWith<$Res> {
  factory _$$SessionModelImplCopyWith(
    _$SessionModelImpl value,
    $Res Function(_$SessionModelImpl) then,
  ) = __$$SessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sessionId,
    String title,
    SessionType sessionType,
    SessionStatus status,
    String startTime,
    String endTime,
    int maxParticipants,
    int participantCount,
    UserModel creator,
    GymModel gym,
  });

  @override
  $UserModelCopyWith<$Res> get creator;
  @override
  $GymModelCopyWith<$Res> get gym;
}

/// @nodoc
class __$$SessionModelImplCopyWithImpl<$Res>
    extends _$SessionModelCopyWithImpl<$Res, _$SessionModelImpl>
    implements _$$SessionModelImplCopyWith<$Res> {
  __$$SessionModelImplCopyWithImpl(
    _$SessionModelImpl _value,
    $Res Function(_$SessionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? title = null,
    Object? sessionType = null,
    Object? status = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxParticipants = null,
    Object? participantCount = null,
    Object? creator = null,
    Object? gym = null,
  }) {
    return _then(
      _$SessionModelImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionType: null == sessionType
            ? _value.sessionType
            : sessionType // ignore: cast_nullable_to_non_nullable
                  as SessionType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SessionStatus,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        maxParticipants: null == maxParticipants
            ? _value.maxParticipants
            : maxParticipants // ignore: cast_nullable_to_non_nullable
                  as int,
        participantCount: null == participantCount
            ? _value.participantCount
            : participantCount // ignore: cast_nullable_to_non_nullable
                  as int,
        creator: null == creator
            ? _value.creator
            : creator // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        gym: null == gym
            ? _value.gym
            : gym // ignore: cast_nullable_to_non_nullable
                  as GymModel,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$SessionModelImpl extends _SessionModel {
  const _$SessionModelImpl({
    required this.sessionId,
    required this.title,
    required this.sessionType,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.maxParticipants,
    required this.participantCount,
    required this.creator,
    required this.gym,
  }) : super._();

  factory _$SessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionModelImplFromJson(json);

  @override
  final String sessionId;
  @override
  final String title;
  @override
  final SessionType sessionType;
  @override
  final SessionStatus status;
  @override
  final String startTime;
  // Receive as ISO 8601 String
  @override
  final String endTime;
  // Receive as ISO 8601 String
  @override
  final int maxParticipants;
  @override
  final int participantCount;
  @override
  final UserModel creator;
  // Nested JSON object
  @override
  final GymModel gym;

  @override
  String toString() {
    return 'SessionModel(sessionId: $sessionId, title: $title, sessionType: $sessionType, status: $status, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants, participantCount: $participantCount, creator: $creator, gym: $gym)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionModelImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.sessionType, sessionType) ||
                other.sessionType == sessionType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.participantCount, participantCount) ||
                other.participantCount == participantCount) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.gym, gym) || other.gym == gym));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    title,
    sessionType,
    status,
    startTime,
    endTime,
    maxParticipants,
    participantCount,
    creator,
    gym,
  );

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      __$$SessionModelImplCopyWithImpl<_$SessionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionModelImplToJson(this);
  }
}

abstract class _SessionModel extends SessionModel {
  const factory _SessionModel({
    required final String sessionId,
    required final String title,
    required final SessionType sessionType,
    required final SessionStatus status,
    required final String startTime,
    required final String endTime,
    required final int maxParticipants,
    required final int participantCount,
    required final UserModel creator,
    required final GymModel gym,
  }) = _$SessionModelImpl;
  const _SessionModel._() : super._();

  factory _SessionModel.fromJson(Map<String, dynamic> json) =
      _$SessionModelImpl.fromJson;

  @override
  String get sessionId;
  @override
  String get title;
  @override
  SessionType get sessionType;
  @override
  SessionStatus get status;
  @override
  String get startTime; // Receive as ISO 8601 String
  @override
  String get endTime; // Receive as ISO 8601 String
  @override
  int get maxParticipants;
  @override
  int get participantCount;
  @override
  UserModel get creator; // Nested JSON object
  @override
  GymModel get gym;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
