// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PendingRatingModel _$PendingRatingModelFromJson(Map<String, dynamic> json) {
  return _PendingRatingModel.fromJson(json);
}

/// @nodoc
mixin _$PendingRatingModel {
  String get sessionId => throw _privateConstructorUsedError;
  String get sessionTitle => throw _privateConstructorUsedError;
  String get userIdToRate => throw _privateConstructorUsedError;
  String get userNameToRate => throw _privateConstructorUsedError;

  /// Serializes this PendingRatingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingRatingModelCopyWith<PendingRatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingRatingModelCopyWith<$Res> {
  factory $PendingRatingModelCopyWith(
    PendingRatingModel value,
    $Res Function(PendingRatingModel) then,
  ) = _$PendingRatingModelCopyWithImpl<$Res, PendingRatingModel>;
  @useResult
  $Res call({
    String sessionId,
    String sessionTitle,
    String userIdToRate,
    String userNameToRate,
  });
}

/// @nodoc
class _$PendingRatingModelCopyWithImpl<$Res, $Val extends PendingRatingModel>
    implements $PendingRatingModelCopyWith<$Res> {
  _$PendingRatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? sessionTitle = null,
    Object? userIdToRate = null,
    Object? userNameToRate = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionTitle: null == sessionTitle
                ? _value.sessionTitle
                : sessionTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            userIdToRate: null == userIdToRate
                ? _value.userIdToRate
                : userIdToRate // ignore: cast_nullable_to_non_nullable
                      as String,
            userNameToRate: null == userNameToRate
                ? _value.userNameToRate
                : userNameToRate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingRatingModelImplCopyWith<$Res>
    implements $PendingRatingModelCopyWith<$Res> {
  factory _$$PendingRatingModelImplCopyWith(
    _$PendingRatingModelImpl value,
    $Res Function(_$PendingRatingModelImpl) then,
  ) = __$$PendingRatingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sessionId,
    String sessionTitle,
    String userIdToRate,
    String userNameToRate,
  });
}

/// @nodoc
class __$$PendingRatingModelImplCopyWithImpl<$Res>
    extends _$PendingRatingModelCopyWithImpl<$Res, _$PendingRatingModelImpl>
    implements _$$PendingRatingModelImplCopyWith<$Res> {
  __$$PendingRatingModelImplCopyWithImpl(
    _$PendingRatingModelImpl _value,
    $Res Function(_$PendingRatingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? sessionTitle = null,
    Object? userIdToRate = null,
    Object? userNameToRate = null,
  }) {
    return _then(
      _$PendingRatingModelImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionTitle: null == sessionTitle
            ? _value.sessionTitle
            : sessionTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        userIdToRate: null == userIdToRate
            ? _value.userIdToRate
            : userIdToRate // ignore: cast_nullable_to_non_nullable
                  as String,
        userNameToRate: null == userNameToRate
            ? _value.userNameToRate
            : userNameToRate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$PendingRatingModelImpl extends _PendingRatingModel {
  const _$PendingRatingModelImpl({
    required this.sessionId,
    required this.sessionTitle,
    required this.userIdToRate,
    required this.userNameToRate,
  }) : super._();

  factory _$PendingRatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingRatingModelImplFromJson(json);

  @override
  final String sessionId;
  @override
  final String sessionTitle;
  @override
  final String userIdToRate;
  @override
  final String userNameToRate;

  @override
  String toString() {
    return 'PendingRatingModel(sessionId: $sessionId, sessionTitle: $sessionTitle, userIdToRate: $userIdToRate, userNameToRate: $userNameToRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingRatingModelImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.sessionTitle, sessionTitle) ||
                other.sessionTitle == sessionTitle) &&
            (identical(other.userIdToRate, userIdToRate) ||
                other.userIdToRate == userIdToRate) &&
            (identical(other.userNameToRate, userNameToRate) ||
                other.userNameToRate == userNameToRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    sessionTitle,
    userIdToRate,
    userNameToRate,
  );

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingRatingModelImplCopyWith<_$PendingRatingModelImpl> get copyWith =>
      __$$PendingRatingModelImplCopyWithImpl<_$PendingRatingModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingRatingModelImplToJson(this);
  }
}

abstract class _PendingRatingModel extends PendingRatingModel {
  const factory _PendingRatingModel({
    required final String sessionId,
    required final String sessionTitle,
    required final String userIdToRate,
    required final String userNameToRate,
  }) = _$PendingRatingModelImpl;
  const _PendingRatingModel._() : super._();

  factory _PendingRatingModel.fromJson(Map<String, dynamic> json) =
      _$PendingRatingModelImpl.fromJson;

  @override
  String get sessionId;
  @override
  String get sessionTitle;
  @override
  String get userIdToRate;
  @override
  String get userNameToRate;

  /// Create a copy of PendingRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingRatingModelImplCopyWith<_$PendingRatingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
