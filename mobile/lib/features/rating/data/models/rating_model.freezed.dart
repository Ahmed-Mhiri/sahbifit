// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RatingSessionModel _$RatingSessionModelFromJson(Map<String, dynamic> json) {
  return _RatingSessionModel.fromJson(json);
}

/// @nodoc
mixin _$RatingSessionModel {
  String get sessionId => throw _privateConstructorUsedError;

  /// Serializes this RatingSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingSessionModelCopyWith<RatingSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingSessionModelCopyWith<$Res> {
  factory $RatingSessionModelCopyWith(
    RatingSessionModel value,
    $Res Function(RatingSessionModel) then,
  ) = _$RatingSessionModelCopyWithImpl<$Res, RatingSessionModel>;
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class _$RatingSessionModelCopyWithImpl<$Res, $Val extends RatingSessionModel>
    implements $RatingSessionModelCopyWith<$Res> {
  _$RatingSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sessionId = null}) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RatingSessionModelImplCopyWith<$Res>
    implements $RatingSessionModelCopyWith<$Res> {
  factory _$$RatingSessionModelImplCopyWith(
    _$RatingSessionModelImpl value,
    $Res Function(_$RatingSessionModelImpl) then,
  ) = __$$RatingSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$RatingSessionModelImplCopyWithImpl<$Res>
    extends _$RatingSessionModelCopyWithImpl<$Res, _$RatingSessionModelImpl>
    implements _$$RatingSessionModelImplCopyWith<$Res> {
  __$$RatingSessionModelImplCopyWithImpl(
    _$RatingSessionModelImpl _value,
    $Res Function(_$RatingSessionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sessionId = null}) {
    return _then(
      _$RatingSessionModelImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$RatingSessionModelImpl implements _RatingSessionModel {
  const _$RatingSessionModelImpl({required this.sessionId});

  factory _$RatingSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingSessionModelImplFromJson(json);

  @override
  final String sessionId;

  @override
  String toString() {
    return 'RatingSessionModel(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingSessionModelImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of RatingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingSessionModelImplCopyWith<_$RatingSessionModelImpl> get copyWith =>
      __$$RatingSessionModelImplCopyWithImpl<_$RatingSessionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingSessionModelImplToJson(this);
  }
}

abstract class _RatingSessionModel implements RatingSessionModel {
  const factory _RatingSessionModel({required final String sessionId}) =
      _$RatingSessionModelImpl;

  factory _RatingSessionModel.fromJson(Map<String, dynamic> json) =
      _$RatingSessionModelImpl.fromJson;

  @override
  String get sessionId;

  /// Create a copy of RatingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingSessionModelImplCopyWith<_$RatingSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) {
  return _RatingModel.fromJson(json);
}

/// @nodoc
mixin _$RatingModel {
  String get ratingId => throw _privateConstructorUsedError;
  RatingSessionModel get session =>
      throw _privateConstructorUsedError; // Nested session object
  UserModel get ratingBy => throw _privateConstructorUsedError;
  UserModel get ratingFor => throw _privateConstructorUsedError;
  int get ratingValue => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this RatingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingModelCopyWith<RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingModelCopyWith<$Res> {
  factory $RatingModelCopyWith(
    RatingModel value,
    $Res Function(RatingModel) then,
  ) = _$RatingModelCopyWithImpl<$Res, RatingModel>;
  @useResult
  $Res call({
    String ratingId,
    RatingSessionModel session,
    UserModel ratingBy,
    UserModel ratingFor,
    int ratingValue,
    String? comment,
    String createdAt,
  });

  $RatingSessionModelCopyWith<$Res> get session;
  $UserModelCopyWith<$Res> get ratingBy;
  $UserModelCopyWith<$Res> get ratingFor;
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res, $Val extends RatingModel>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingId = null,
    Object? session = null,
    Object? ratingBy = null,
    Object? ratingFor = null,
    Object? ratingValue = null,
    Object? comment = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            ratingId: null == ratingId
                ? _value.ratingId
                : ratingId // ignore: cast_nullable_to_non_nullable
                      as String,
            session: null == session
                ? _value.session
                : session // ignore: cast_nullable_to_non_nullable
                      as RatingSessionModel,
            ratingBy: null == ratingBy
                ? _value.ratingBy
                : ratingBy // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            ratingFor: null == ratingFor
                ? _value.ratingFor
                : ratingFor // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            ratingValue: null == ratingValue
                ? _value.ratingValue
                : ratingValue // ignore: cast_nullable_to_non_nullable
                      as int,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RatingSessionModelCopyWith<$Res> get session {
    return $RatingSessionModelCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get ratingBy {
    return $UserModelCopyWith<$Res>(_value.ratingBy, (value) {
      return _then(_value.copyWith(ratingBy: value) as $Val);
    });
  }

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get ratingFor {
    return $UserModelCopyWith<$Res>(_value.ratingFor, (value) {
      return _then(_value.copyWith(ratingFor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RatingModelImplCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$$RatingModelImplCopyWith(
    _$RatingModelImpl value,
    $Res Function(_$RatingModelImpl) then,
  ) = __$$RatingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String ratingId,
    RatingSessionModel session,
    UserModel ratingBy,
    UserModel ratingFor,
    int ratingValue,
    String? comment,
    String createdAt,
  });

  @override
  $RatingSessionModelCopyWith<$Res> get session;
  @override
  $UserModelCopyWith<$Res> get ratingBy;
  @override
  $UserModelCopyWith<$Res> get ratingFor;
}

/// @nodoc
class __$$RatingModelImplCopyWithImpl<$Res>
    extends _$RatingModelCopyWithImpl<$Res, _$RatingModelImpl>
    implements _$$RatingModelImplCopyWith<$Res> {
  __$$RatingModelImplCopyWithImpl(
    _$RatingModelImpl _value,
    $Res Function(_$RatingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingId = null,
    Object? session = null,
    Object? ratingBy = null,
    Object? ratingFor = null,
    Object? ratingValue = null,
    Object? comment = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$RatingModelImpl(
        ratingId: null == ratingId
            ? _value.ratingId
            : ratingId // ignore: cast_nullable_to_non_nullable
                  as String,
        session: null == session
            ? _value.session
            : session // ignore: cast_nullable_to_non_nullable
                  as RatingSessionModel,
        ratingBy: null == ratingBy
            ? _value.ratingBy
            : ratingBy // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        ratingFor: null == ratingFor
            ? _value.ratingFor
            : ratingFor // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        ratingValue: null == ratingValue
            ? _value.ratingValue
            : ratingValue // ignore: cast_nullable_to_non_nullable
                  as int,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$RatingModelImpl extends _RatingModel {
  const _$RatingModelImpl({
    required this.ratingId,
    required this.session,
    required this.ratingBy,
    required this.ratingFor,
    required this.ratingValue,
    this.comment,
    required this.createdAt,
  }) : super._();

  factory _$RatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingModelImplFromJson(json);

  @override
  final String ratingId;
  @override
  final RatingSessionModel session;
  // Nested session object
  @override
  final UserModel ratingBy;
  @override
  final UserModel ratingFor;
  @override
  final int ratingValue;
  @override
  final String? comment;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'RatingModel(ratingId: $ratingId, session: $session, ratingBy: $ratingBy, ratingFor: $ratingFor, ratingValue: $ratingValue, comment: $comment, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingModelImpl &&
            (identical(other.ratingId, ratingId) ||
                other.ratingId == ratingId) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.ratingBy, ratingBy) ||
                other.ratingBy == ratingBy) &&
            (identical(other.ratingFor, ratingFor) ||
                other.ratingFor == ratingFor) &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    ratingId,
    session,
    ratingBy,
    ratingFor,
    ratingValue,
    comment,
    createdAt,
  );

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingModelImplCopyWith<_$RatingModelImpl> get copyWith =>
      __$$RatingModelImplCopyWithImpl<_$RatingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingModelImplToJson(this);
  }
}

abstract class _RatingModel extends RatingModel {
  const factory _RatingModel({
    required final String ratingId,
    required final RatingSessionModel session,
    required final UserModel ratingBy,
    required final UserModel ratingFor,
    required final int ratingValue,
    final String? comment,
    required final String createdAt,
  }) = _$RatingModelImpl;
  const _RatingModel._() : super._();

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$RatingModelImpl.fromJson;

  @override
  String get ratingId;
  @override
  RatingSessionModel get session; // Nested session object
  @override
  UserModel get ratingBy;
  @override
  UserModel get ratingFor;
  @override
  int get ratingValue;
  @override
  String? get comment;
  @override
  String get createdAt;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingModelImplCopyWith<_$RatingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
