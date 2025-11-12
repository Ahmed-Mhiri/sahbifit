// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateReportModel _$CreateReportModelFromJson(Map<String, dynamic> json) {
  return _CreateReportModel.fromJson(json);
}

/// @nodoc
mixin _$CreateReportModel {
  String get reportedUserId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;

  /// Serializes this CreateReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReportModelCopyWith<CreateReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReportModelCopyWith<$Res> {
  factory $CreateReportModelCopyWith(
    CreateReportModel value,
    $Res Function(CreateReportModel) then,
  ) = _$CreateReportModelCopyWithImpl<$Res, CreateReportModel>;
  @useResult
  $Res call({String reportedUserId, String reason, String? sessionId});
}

/// @nodoc
class _$CreateReportModelCopyWithImpl<$Res, $Val extends CreateReportModel>
    implements $CreateReportModelCopyWith<$Res> {
  _$CreateReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportedUserId = null,
    Object? reason = null,
    Object? sessionId = freezed,
  }) {
    return _then(
      _value.copyWith(
            reportedUserId: null == reportedUserId
                ? _value.reportedUserId
                : reportedUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionId: freezed == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateReportModelImplCopyWith<$Res>
    implements $CreateReportModelCopyWith<$Res> {
  factory _$$CreateReportModelImplCopyWith(
    _$CreateReportModelImpl value,
    $Res Function(_$CreateReportModelImpl) then,
  ) = __$$CreateReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reportedUserId, String reason, String? sessionId});
}

/// @nodoc
class __$$CreateReportModelImplCopyWithImpl<$Res>
    extends _$CreateReportModelCopyWithImpl<$Res, _$CreateReportModelImpl>
    implements _$$CreateReportModelImplCopyWith<$Res> {
  __$$CreateReportModelImplCopyWithImpl(
    _$CreateReportModelImpl _value,
    $Res Function(_$CreateReportModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportedUserId = null,
    Object? reason = null,
    Object? sessionId = freezed,
  }) {
    return _then(
      _$CreateReportModelImpl(
        reportedUserId: null == reportedUserId
            ? _value.reportedUserId
            : reportedUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$CreateReportModelImpl implements _CreateReportModel {
  const _$CreateReportModelImpl({
    required this.reportedUserId,
    required this.reason,
    this.sessionId,
  });

  factory _$CreateReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReportModelImplFromJson(json);

  @override
  final String reportedUserId;
  @override
  final String reason;
  @override
  final String? sessionId;

  @override
  String toString() {
    return 'CreateReportModel(reportedUserId: $reportedUserId, reason: $reason, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReportModelImpl &&
            (identical(other.reportedUserId, reportedUserId) ||
                other.reportedUserId == reportedUserId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reportedUserId, reason, sessionId);

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReportModelImplCopyWith<_$CreateReportModelImpl> get copyWith =>
      __$$CreateReportModelImplCopyWithImpl<_$CreateReportModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReportModelImplToJson(this);
  }
}

abstract class _CreateReportModel implements CreateReportModel {
  const factory _CreateReportModel({
    required final String reportedUserId,
    required final String reason,
    final String? sessionId,
  }) = _$CreateReportModelImpl;

  factory _CreateReportModel.fromJson(Map<String, dynamic> json) =
      _$CreateReportModelImpl.fromJson;

  @override
  String get reportedUserId;
  @override
  String get reason;
  @override
  String? get sessionId;

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReportModelImplCopyWith<_$CreateReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
