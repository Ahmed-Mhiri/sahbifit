// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel {
  String get sessionId;
  String get title;
  SessionType get sessionType;
  SessionStatus get status;
  String get startTime; // Receive as ISO 8601 String
  String get endTime; // Receive as ISO 8601 String
  int get maxParticipants;
  int get participantCount;
  UserModel get creator; // Nested JSON object
  GymModel get gym;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionModelCopyWith<SessionModel> get copyWith =>
      _$SessionModelCopyWithImpl<SessionModel>(
          this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionModel &&
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
      gym);

  @override
  String toString() {
    return 'SessionModel(sessionId: $sessionId, title: $title, sessionType: $sessionType, status: $status, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants, participantCount: $participantCount, creator: $creator, gym: $gym)';
  }
}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res> {
  factory $SessionModelCopyWith(
          SessionModel value, $Res Function(SessionModel) _then) =
      _$SessionModelCopyWithImpl;
  @useResult
  $Res call(
      {String sessionId,
      String title,
      SessionType sessionType,
      SessionStatus status,
      String startTime,
      String endTime,
      int maxParticipants,
      int participantCount,
      UserModel creator,
      GymModel gym});

  $UserModelCopyWith<$Res> get creator;
  $GymModelCopyWith<$Res> get gym;
}

/// @nodoc
class _$SessionModelCopyWithImpl<$Res> implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

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
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      sessionType: null == sessionType
          ? _self.sessionType
          : sessionType // ignore: cast_nullable_to_non_nullable
              as SessionType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      maxParticipants: null == maxParticipants
          ? _self.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      participantCount: null == participantCount
          ? _self.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
      creator: null == creator
          ? _self.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserModel,
      gym: null == gym
          ? _self.gym
          : gym // ignore: cast_nullable_to_non_nullable
              as GymModel,
    ));
  }

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get creator {
    return $UserModelCopyWith<$Res>(_self.creator, (value) {
      return _then(_self.copyWith(creator: value));
    });
  }

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GymModelCopyWith<$Res> get gym {
    return $GymModelCopyWith<$Res>(_self.gym, (value) {
      return _then(_self.copyWith(gym: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
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
    TResult Function(_SessionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionModel() when $default != null:
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
    TResult Function(_SessionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionModel():
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
    TResult? Function(_SessionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionModel() when $default != null:
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
    TResult Function(
            String sessionId,
            String title,
            SessionType sessionType,
            SessionStatus status,
            String startTime,
            String endTime,
            int maxParticipants,
            int participantCount,
            UserModel creator,
            GymModel gym)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionModel() when $default != null:
        return $default(
            _that.sessionId,
            _that.title,
            _that.sessionType,
            _that.status,
            _that.startTime,
            _that.endTime,
            _that.maxParticipants,
            _that.participantCount,
            _that.creator,
            _that.gym);
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
    TResult Function(
            String sessionId,
            String title,
            SessionType sessionType,
            SessionStatus status,
            String startTime,
            String endTime,
            int maxParticipants,
            int participantCount,
            UserModel creator,
            GymModel gym)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionModel():
        return $default(
            _that.sessionId,
            _that.title,
            _that.sessionType,
            _that.status,
            _that.startTime,
            _that.endTime,
            _that.maxParticipants,
            _that.participantCount,
            _that.creator,
            _that.gym);
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
    TResult? Function(
            String sessionId,
            String title,
            SessionType sessionType,
            SessionStatus status,
            String startTime,
            String endTime,
            int maxParticipants,
            int participantCount,
            UserModel creator,
            GymModel gym)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionModel() when $default != null:
        return $default(
            _that.sessionId,
            _that.title,
            _that.sessionType,
            _that.status,
            _that.startTime,
            _that.endTime,
            _that.maxParticipants,
            _that.participantCount,
            _that.creator,
            _that.gym);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _SessionModel extends SessionModel {
  const _SessionModel(
      {required this.sessionId,
      required this.title,
      required this.sessionType,
      required this.status,
      required this.startTime,
      required this.endTime,
      required this.maxParticipants,
      required this.participantCount,
      required this.creator,
      required this.gym})
      : super._();
  factory _SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

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

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionModelCopyWith<_SessionModel> get copyWith =>
      __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionModel &&
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
      gym);

  @override
  String toString() {
    return 'SessionModel(sessionId: $sessionId, title: $title, sessionType: $sessionType, status: $status, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants, participantCount: $participantCount, creator: $creator, gym: $gym)';
  }
}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res>
    implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(
          _SessionModel value, $Res Function(_SessionModel) _then) =
      __$SessionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String title,
      SessionType sessionType,
      SessionStatus status,
      String startTime,
      String endTime,
      int maxParticipants,
      int participantCount,
      UserModel creator,
      GymModel gym});

  @override
  $UserModelCopyWith<$Res> get creator;
  @override
  $GymModelCopyWith<$Res> get gym;
}

/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_SessionModel(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      sessionType: null == sessionType
          ? _self.sessionType
          : sessionType // ignore: cast_nullable_to_non_nullable
              as SessionType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      maxParticipants: null == maxParticipants
          ? _self.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      participantCount: null == participantCount
          ? _self.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
      creator: null == creator
          ? _self.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserModel,
      gym: null == gym
          ? _self.gym
          : gym // ignore: cast_nullable_to_non_nullable
              as GymModel,
    ));
  }

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get creator {
    return $UserModelCopyWith<$Res>(_self.creator, (value) {
      return _then(_self.copyWith(creator: value));
    });
  }

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GymModelCopyWith<$Res> get gym {
    return $GymModelCopyWith<$Res>(_self.gym, (value) {
      return _then(_self.copyWith(gym: value));
    });
  }
}

// dart format on
