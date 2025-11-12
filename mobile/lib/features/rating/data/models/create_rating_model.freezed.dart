// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateRatingModel _$CreateRatingModelFromJson(Map<String, dynamic> json) {
  return _CreateRatingModel.fromJson(json);
}

/// @nodoc
mixin _$CreateRatingModel {
  String get sessionId => throw _privateConstructorUsedError;
  String get ratedUserId => throw _privateConstructorUsedError;
  int get ratingValue =>
      throw _privateConstructorUsedError; // 'Short' maps to 'int'
  String? get comment => throw _privateConstructorUsedError;

  /// Serializes this CreateRatingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRatingModelCopyWith<CreateRatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRatingModelCopyWith<$Res> {
  factory $CreateRatingModelCopyWith(
    CreateRatingModel value,
    $Res Function(CreateRatingModel) then,
  ) = _$CreateRatingModelCopyWithImpl<$Res, CreateRatingModel>;
  @useResult
  $Res call({
    String sessionId,
    String ratedUserId,
    int ratingValue,
    String? comment,
  });
}

/// @nodoc
class _$CreateRatingModelCopyWithImpl<$Res, $Val extends CreateRatingModel>
    implements $CreateRatingModelCopyWith<$Res> {
  _$CreateRatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? ratedUserId = null,
    Object? ratingValue = null,
    Object? comment = freezed,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            ratedUserId: null == ratedUserId
                ? _value.ratedUserId
                : ratedUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            ratingValue: null == ratingValue
                ? _value.ratingValue
                : ratingValue // ignore: cast_nullable_to_non_nullable
                      as int,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateRatingModelImplCopyWith<$Res>
    implements $CreateRatingModelCopyWith<$Res> {
  factory _$$CreateRatingModelImplCopyWith(
    _$CreateRatingModelImpl value,
    $Res Function(_$CreateRatingModelImpl) then,
  ) = __$$CreateRatingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sessionId,
    String ratedUserId,
    int ratingValue,
    String? comment,
  });
}

/// @nodoc
class __$$CreateRatingModelImplCopyWithImpl<$Res>
    extends _$CreateRatingModelCopyWithImpl<$Res, _$CreateRatingModelImpl>
    implements _$$CreateRatingModelImplCopyWith<$Res> {
  __$$CreateRatingModelImplCopyWithImpl(
    _$CreateRatingModelImpl _value,
    $Res Function(_$CreateRatingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? ratedUserId = null,
    Object? ratingValue = null,
    Object? comment = freezed,
  }) {
    return _then(
      _$CreateRatingModelImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        ratedUserId: null == ratedUserId
            ? _value.ratedUserId
            : ratedUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        ratingValue: null == ratingValue
            ? _value.ratingValue
            : ratingValue // ignore: cast_nullable_to_non_nullable
                  as int,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$CreateRatingModelImpl implements _CreateRatingModel {
  const _$CreateRatingModelImpl({
    required this.sessionId,
    required this.ratedUserId,
    required this.ratingValue,
    this.comment,
  });

  factory _$CreateRatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRatingModelImplFromJson(json);

  @override
  final String sessionId;
  @override
  final String ratedUserId;
  @override
  final int ratingValue;
  // 'Short' maps to 'int'
  @override
  final String? comment;

  @override
  String toString() {
    return 'CreateRatingModel(sessionId: $sessionId, ratedUserId: $ratedUserId, ratingValue: $ratingValue, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRatingModelImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.ratedUserId, ratedUserId) ||
                other.ratedUserId == ratedUserId) &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, ratedUserId, ratingValue, comment);

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRatingModelImplCopyWith<_$CreateRatingModelImpl> get copyWith =>
      __$$CreateRatingModelImplCopyWithImpl<_$CreateRatingModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRatingModelImplToJson(this);
  }
}

abstract class _CreateRatingModel implements CreateRatingModel {
  const factory _CreateRatingModel({
    required final String sessionId,
    required final String ratedUserId,
    required final int ratingValue,
    final String? comment,
  }) = _$CreateRatingModelImpl;

  factory _CreateRatingModel.fromJson(Map<String, dynamic> json) =
      _$CreateRatingModelImpl.fromJson;

  @override
  String get sessionId;
  @override
  String get ratedUserId;
  @override
  int get ratingValue; // 'Short' maps to 'int'
  @override
  String? get comment;

  /// Create a copy of CreateRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRatingModelImplCopyWith<_$CreateRatingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
