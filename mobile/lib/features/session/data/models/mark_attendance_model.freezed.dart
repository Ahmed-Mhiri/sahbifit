// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarkAttendanceModel {
  String get sessionId;
  String get participantUserId;
  @JsonKey(name: 'newStatus')
  ParticipantStatus get status;

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MarkAttendanceModelCopyWith<MarkAttendanceModel> get copyWith =>
      _$MarkAttendanceModelCopyWithImpl<MarkAttendanceModel>(
          this as MarkAttendanceModel, _$identity);

  /// Serializes this MarkAttendanceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkAttendanceModel &&
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

  @override
  String toString() {
    return 'MarkAttendanceModel(sessionId: $sessionId, participantUserId: $participantUserId, status: $status)';
  }
}

/// @nodoc
abstract mixin class $MarkAttendanceModelCopyWith<$Res> {
  factory $MarkAttendanceModelCopyWith(
          MarkAttendanceModel value, $Res Function(MarkAttendanceModel) _then) =
      _$MarkAttendanceModelCopyWithImpl;
  @useResult
  $Res call(
      {String sessionId,
      String participantUserId,
      @JsonKey(name: 'newStatus') ParticipantStatus status});
}

/// @nodoc
class _$MarkAttendanceModelCopyWithImpl<$Res>
    implements $MarkAttendanceModelCopyWith<$Res> {
  _$MarkAttendanceModelCopyWithImpl(this._self, this._then);

  final MarkAttendanceModel _self;
  final $Res Function(MarkAttendanceModel) _then;

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? participantUserId = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      participantUserId: null == participantUserId
          ? _self.participantUserId
          : participantUserId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ParticipantStatus,
    ));
  }
}

/// Adds pattern-matching-related methods to [MarkAttendanceModel].
extension MarkAttendanceModelPatterns on MarkAttendanceModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MarkAttendanceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MarkAttendanceModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MarkAttendanceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarkAttendanceModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MarkAttendanceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarkAttendanceModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String sessionId, String participantUserId,
            @JsonKey(name: 'newStatus') ParticipantStatus status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MarkAttendanceModel() when $default != null:
        return $default(_that.sessionId, _that.participantUserId, _that.status);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String sessionId, String participantUserId,
            @JsonKey(name: 'newStatus') ParticipantStatus status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarkAttendanceModel():
        return $default(_that.sessionId, _that.participantUserId, _that.status);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String sessionId, String participantUserId,
            @JsonKey(name: 'newStatus') ParticipantStatus status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarkAttendanceModel() when $default != null:
        return $default(_that.sessionId, _that.participantUserId, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _MarkAttendanceModel implements MarkAttendanceModel {
  const _MarkAttendanceModel(
      {required this.sessionId,
      required this.participantUserId,
      @JsonKey(name: 'newStatus') required this.status});
  factory _MarkAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$MarkAttendanceModelFromJson(json);

  @override
  final String sessionId;
  @override
  final String participantUserId;
  @override
  @JsonKey(name: 'newStatus')
  final ParticipantStatus status;

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MarkAttendanceModelCopyWith<_MarkAttendanceModel> get copyWith =>
      __$MarkAttendanceModelCopyWithImpl<_MarkAttendanceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MarkAttendanceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MarkAttendanceModel &&
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

  @override
  String toString() {
    return 'MarkAttendanceModel(sessionId: $sessionId, participantUserId: $participantUserId, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$MarkAttendanceModelCopyWith<$Res>
    implements $MarkAttendanceModelCopyWith<$Res> {
  factory _$MarkAttendanceModelCopyWith(_MarkAttendanceModel value,
          $Res Function(_MarkAttendanceModel) _then) =
      __$MarkAttendanceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String participantUserId,
      @JsonKey(name: 'newStatus') ParticipantStatus status});
}

/// @nodoc
class __$MarkAttendanceModelCopyWithImpl<$Res>
    implements _$MarkAttendanceModelCopyWith<$Res> {
  __$MarkAttendanceModelCopyWithImpl(this._self, this._then);

  final _MarkAttendanceModel _self;
  final $Res Function(_MarkAttendanceModel) _then;

  /// Create a copy of MarkAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? participantUserId = null,
    Object? status = null,
  }) {
    return _then(_MarkAttendanceModel(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      participantUserId: null == participantUserId
          ? _self.participantUserId
          : participantUserId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ParticipantStatus,
    ));
  }
}

// dart format on
