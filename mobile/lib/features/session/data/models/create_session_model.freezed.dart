// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateSessionModel {
  String get gymId;
  SessionType get sessionType;
  String get title;
  String get startTime; // Send as ISO 8601 String
  String get endTime; // Send as ISO 8601 String
  int get maxParticipants;

  /// Create a copy of CreateSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateSessionModelCopyWith<CreateSessionModel> get copyWith =>
      _$CreateSessionModelCopyWithImpl<CreateSessionModel>(
          this as CreateSessionModel, _$identity);

  /// Serializes this CreateSessionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateSessionModel &&
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
  int get hashCode => Object.hash(runtimeType, gymId, sessionType, title,
      startTime, endTime, maxParticipants);

  @override
  String toString() {
    return 'CreateSessionModel(gymId: $gymId, sessionType: $sessionType, title: $title, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants)';
  }
}

/// @nodoc
abstract mixin class $CreateSessionModelCopyWith<$Res> {
  factory $CreateSessionModelCopyWith(
          CreateSessionModel value, $Res Function(CreateSessionModel) _then) =
      _$CreateSessionModelCopyWithImpl;
  @useResult
  $Res call(
      {String gymId,
      SessionType sessionType,
      String title,
      String startTime,
      String endTime,
      int maxParticipants});
}

/// @nodoc
class _$CreateSessionModelCopyWithImpl<$Res>
    implements $CreateSessionModelCopyWith<$Res> {
  _$CreateSessionModelCopyWithImpl(this._self, this._then);

  final CreateSessionModel _self;
  final $Res Function(CreateSessionModel) _then;

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
    return _then(_self.copyWith(
      gymId: null == gymId
          ? _self.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionType: null == sessionType
          ? _self.sessionType
          : sessionType // ignore: cast_nullable_to_non_nullable
              as SessionType,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateSessionModel].
extension CreateSessionModelPatterns on CreateSessionModel {
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
    TResult Function(_CreateSessionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateSessionModel() when $default != null:
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
    TResult Function(_CreateSessionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateSessionModel():
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
    TResult? Function(_CreateSessionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateSessionModel() when $default != null:
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
    TResult Function(String gymId, SessionType sessionType, String title,
            String startTime, String endTime, int maxParticipants)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateSessionModel() when $default != null:
        return $default(_that.gymId, _that.sessionType, _that.title,
            _that.startTime, _that.endTime, _that.maxParticipants);
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
    TResult Function(String gymId, SessionType sessionType, String title,
            String startTime, String endTime, int maxParticipants)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateSessionModel():
        return $default(_that.gymId, _that.sessionType, _that.title,
            _that.startTime, _that.endTime, _that.maxParticipants);
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
    TResult? Function(String gymId, SessionType sessionType, String title,
            String startTime, String endTime, int maxParticipants)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateSessionModel() when $default != null:
        return $default(_that.gymId, _that.sessionType, _that.title,
            _that.startTime, _that.endTime, _that.maxParticipants);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _CreateSessionModel implements CreateSessionModel {
  const _CreateSessionModel(
      {required this.gymId,
      required this.sessionType,
      required this.title,
      required this.startTime,
      required this.endTime,
      required this.maxParticipants});
  factory _CreateSessionModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionModelFromJson(json);

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

  /// Create a copy of CreateSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateSessionModelCopyWith<_CreateSessionModel> get copyWith =>
      __$CreateSessionModelCopyWithImpl<_CreateSessionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateSessionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateSessionModel &&
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
  int get hashCode => Object.hash(runtimeType, gymId, sessionType, title,
      startTime, endTime, maxParticipants);

  @override
  String toString() {
    return 'CreateSessionModel(gymId: $gymId, sessionType: $sessionType, title: $title, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants)';
  }
}

/// @nodoc
abstract mixin class _$CreateSessionModelCopyWith<$Res>
    implements $CreateSessionModelCopyWith<$Res> {
  factory _$CreateSessionModelCopyWith(
          _CreateSessionModel value, $Res Function(_CreateSessionModel) _then) =
      __$CreateSessionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String gymId,
      SessionType sessionType,
      String title,
      String startTime,
      String endTime,
      int maxParticipants});
}

/// @nodoc
class __$CreateSessionModelCopyWithImpl<$Res>
    implements _$CreateSessionModelCopyWith<$Res> {
  __$CreateSessionModelCopyWithImpl(this._self, this._then);

  final _CreateSessionModel _self;
  final $Res Function(_CreateSessionModel) _then;

  /// Create a copy of CreateSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gymId = null,
    Object? sessionType = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxParticipants = null,
  }) {
    return _then(_CreateSessionModel(
      gymId: null == gymId
          ? _self.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionType: null == sessionType
          ? _self.sessionType
          : sessionType // ignore: cast_nullable_to_non_nullable
              as SessionType,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

// dart format on
