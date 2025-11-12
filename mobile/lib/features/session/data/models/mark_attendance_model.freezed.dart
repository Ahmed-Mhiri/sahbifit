// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MarkAttendanceModel _$MarkAttendanceModelFromJson(Map<String, dynamic> json) {
  return _MarkAttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$MarkAttendanceModel {
  String get sessionId => throw _privateConstructorUsedError;
  String get participantUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'newStatus')
  ParticipantStatus get status => throw _privateConstructorUsedError;

  /// Serializes this MarkAttendanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarkAttendanceModelCopyWith<MarkAttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkAttendanceModelCopyWith<$Res> {
  factory $MarkAttendanceModelCopyWith(
    MarkAttendanceModel value,
    $Res Function(MarkAttendanceModel) then,
  ) = _$MarkAttendanceModelCopyWithImpl<$Res, MarkAttendanceModel>;
  @useResult
  $Res call({
    String sessionId,
    String participantUserId,
    @JsonKey(name: 'newStatus') ParticipantStatus status,
  });
}

/// @nodoc
class _$MarkAttendanceModelCopyWithImpl<$Res, $Val extends MarkAttendanceModel>
    implements $MarkAttendanceModelCopyWith<$Res> {
  _$MarkAttendanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? participantUserId = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            participantUserId: null == participantUserId
                ? _value.participantUserId
                : participantUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ParticipantStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarkAttendanceModelImplCopyWith<$Res>
    implements $MarkAttendanceModelCopyWith<$Res> {
  factory _$$MarkAttendanceModelImplCopyWith(
    _$MarkAttendanceModelImpl value,
    $Res Function(_$MarkAttendanceModelImpl) then,
  ) = __$$MarkAttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sessionId,
    String participantUserId,
    @JsonKey(name: 'newStatus') ParticipantStatus status,
  });
}

/// @nodoc
class __$$MarkAttendanceModelImplCopyWithImpl<$Res>
    extends _$MarkAttendanceModelCopyWithImpl<$Res, _$MarkAttendanceModelImpl>
    implements _$$MarkAttendanceModelImplCopyWith<$Res> {
  __$$MarkAttendanceModelImplCopyWithImpl(
    _$MarkAttendanceModelImpl _value,
    $Res Function(_$MarkAttendanceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? participantUserId = null,
    Object? status = null,
  }) {
    return _then(
      _$MarkAttendanceModelImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        participantUserId: null == participantUserId
            ? _value.participantUserId
            : participantUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ParticipantStatus,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$MarkAttendanceModelImpl implements _MarkAttendanceModel {
  const _$MarkAttendanceModelImpl({
    required this.sessionId,
    required this.participantUserId,
    @JsonKey(name: 'newStatus') required this.status,
  });

  factory _$MarkAttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkAttendanceModelImplFromJson(json);

  @override
  final String sessionId;
  @override
  final String participantUserId;
  @override
  @JsonKey(name: 'newStatus')
  final ParticipantStatus status;

  @override
  String toString() {
    return 'MarkAttendanceModel(sessionId: $sessionId, participantUserId: $participantUserId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAttendanceModelImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.participantUserId, participantUserId) ||
                other.participantUserId == participantUserId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, participantUserId, status);

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAttendanceModelImplCopyWith<_$MarkAttendanceModelImpl> get copyWith =>
      __$$MarkAttendanceModelImplCopyWithImpl<_$MarkAttendanceModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkAttendanceModelImplToJson(this);
  }
}

abstract class _MarkAttendanceModel implements MarkAttendanceModel {
  const factory _MarkAttendanceModel({
    required final String sessionId,
    required final String participantUserId,
    @JsonKey(name: 'newStatus') required final ParticipantStatus status,
  }) = _$MarkAttendanceModelImpl;

  factory _MarkAttendanceModel.fromJson(Map<String, dynamic> json) =
      _$MarkAttendanceModelImpl.fromJson;

  @override
  String get sessionId;
  @override
  String get participantUserId;
  @override
  @JsonKey(name: 'newStatus')
  ParticipantStatus get status;

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAttendanceModelImplCopyWith<_$MarkAttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
