// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateSessionModel _$CreateSessionModelFromJson(Map<String, dynamic> json) {
  return _CreateSessionModel.fromJson(json);
}

/// @nodoc
mixin _$CreateSessionModel {
  String get gymId => throw _privateConstructorUsedError;
  SessionType get sessionType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get startTime =>
      throw _privateConstructorUsedError; // Send as ISO 8601 String
  String get endTime =>
      throw _privateConstructorUsedError; // Send as ISO 8601 String
  int get maxParticipants => throw _privateConstructorUsedError;

  /// Serializes this CreateSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSessionModelCopyWith<CreateSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSessionModelCopyWith<$Res> {
  factory $CreateSessionModelCopyWith(
    CreateSessionModel value,
    $Res Function(CreateSessionModel) then,
  ) = _$CreateSessionModelCopyWithImpl<$Res, CreateSessionModel>;
  @useResult
  $Res call({
    String gymId,
    SessionType sessionType,
    String title,
    String startTime,
    String endTime,
    int maxParticipants,
  });
}

/// @nodoc
class _$CreateSessionModelCopyWithImpl<$Res, $Val extends CreateSessionModel>
    implements $CreateSessionModelCopyWith<$Res> {
  _$CreateSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? sessionType = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxParticipants = null,
  }) {
    return _then(
      _value.copyWith(
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionType: null == sessionType
                ? _value.sessionType
                : sessionType // ignore: cast_nullable_to_non_nullable
                      as SessionType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateSessionModelImplCopyWith<$Res>
    implements $CreateSessionModelCopyWith<$Res> {
  factory _$$CreateSessionModelImplCopyWith(
    _$CreateSessionModelImpl value,
    $Res Function(_$CreateSessionModelImpl) then,
  ) = __$$CreateSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String gymId,
    SessionType sessionType,
    String title,
    String startTime,
    String endTime,
    int maxParticipants,
  });
}

/// @nodoc
class __$$CreateSessionModelImplCopyWithImpl<$Res>
    extends _$CreateSessionModelCopyWithImpl<$Res, _$CreateSessionModelImpl>
    implements _$$CreateSessionModelImplCopyWith<$Res> {
  __$$CreateSessionModelImplCopyWithImpl(
    _$CreateSessionModelImpl _value,
    $Res Function(_$CreateSessionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? sessionType = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxParticipants = null,
  }) {
    return _then(
      _$CreateSessionModelImpl(
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionType: null == sessionType
            ? _value.sessionType
            : sessionType // ignore: cast_nullable_to_non_nullable
                  as SessionType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
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
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$CreateSessionModelImpl implements _CreateSessionModel {
  const _$CreateSessionModelImpl({
    required this.gymId,
    required this.sessionType,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.maxParticipants,
  });

  factory _$CreateSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSessionModelImplFromJson(json);

  @override
  final String gymId;
  @override
  final SessionType sessionType;
  @override
  final String title;
  @override
  final String startTime;
  // Send as ISO 8601 String
  @override
  final String endTime;
  // Send as ISO 8601 String
  @override
  final int maxParticipants;

  @override
  String toString() {
    return 'CreateSessionModel(gymId: $gymId, sessionType: $sessionType, title: $title, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSessionModelImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.sessionType, sessionType) ||
                other.sessionType == sessionType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    gymId,
    sessionType,
    title,
    startTime,
    endTime,
    maxParticipants,
  );

  /// Create a copy of CreateSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSessionModelImplCopyWith<_$CreateSessionModelImpl> get copyWith =>
      __$$CreateSessionModelImplCopyWithImpl<_$CreateSessionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSessionModelImplToJson(this);
  }
}

abstract class _CreateSessionModel implements CreateSessionModel {
  const factory _CreateSessionModel({
    required final String gymId,
    required final SessionType sessionType,
    required final String title,
    required final String startTime,
    required final String endTime,
    required final int maxParticipants,
  }) = _$CreateSessionModelImpl;

  factory _CreateSessionModel.fromJson(Map<String, dynamic> json) =
      _$CreateSessionModelImpl.fromJson;

  @override
  String get gymId;
  @override
  SessionType get sessionType;
  @override
  String get title;
  @override
  String get startTime; // Send as ISO 8601 String
  @override
  String get endTime; // Send as ISO 8601 String
  @override
  int get maxParticipants;

  /// Create a copy of CreateSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSessionModelImplCopyWith<_$CreateSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
