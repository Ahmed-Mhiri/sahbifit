// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateReportModel {
  String get reportedUserId;
  String get reason;
  String? get sessionId;

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateReportModelCopyWith<CreateReportModel> get copyWith =>
      _$CreateReportModelCopyWithImpl<CreateReportModel>(
          this as CreateReportModel, _$identity);

  /// Serializes this CreateReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateReportModel &&
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

  @override
  String toString() {
    return 'CreateReportModel(reportedUserId: $reportedUserId, reason: $reason, sessionId: $sessionId)';
  }
}

/// @nodoc
abstract mixin class $CreateReportModelCopyWith<$Res> {
  factory $CreateReportModelCopyWith(
          CreateReportModel value, $Res Function(CreateReportModel) _then) =
      _$CreateReportModelCopyWithImpl;
  @useResult
  $Res call({String reportedUserId, String reason, String? sessionId});
}

/// @nodoc
class _$CreateReportModelCopyWithImpl<$Res>
    implements $CreateReportModelCopyWith<$Res> {
  _$CreateReportModelCopyWithImpl(this._self, this._then);

  final CreateReportModel _self;
  final $Res Function(CreateReportModel) _then;

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportedUserId = null,
    Object? reason = null,
    Object? sessionId = freezed,
  }) {
    return _then(_self.copyWith(
      reportedUserId: null == reportedUserId
          ? _self.reportedUserId
          : reportedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateReportModel].
extension CreateReportModelPatterns on CreateReportModel {
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
    TResult Function(_CreateReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateReportModel() when $default != null:
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
    TResult Function(_CreateReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportModel():
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
    TResult? Function(_CreateReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportModel() when $default != null:
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
    TResult Function(String reportedUserId, String reason, String? sessionId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateReportModel() when $default != null:
        return $default(_that.reportedUserId, _that.reason, _that.sessionId);
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
    TResult Function(String reportedUserId, String reason, String? sessionId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportModel():
        return $default(_that.reportedUserId, _that.reason, _that.sessionId);
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
    TResult? Function(String reportedUserId, String reason, String? sessionId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportModel() when $default != null:
        return $default(_that.reportedUserId, _that.reason, _that.sessionId);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _CreateReportModel implements CreateReportModel {
  const _CreateReportModel(
      {required this.reportedUserId, required this.reason, this.sessionId});
  factory _CreateReportModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReportModelFromJson(json);

  @override
  final String reportedUserId;
  @override
  final String reason;
  @override
  final String? sessionId;

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateReportModelCopyWith<_CreateReportModel> get copyWith =>
      __$CreateReportModelCopyWithImpl<_CreateReportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateReportModel &&
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

  @override
  String toString() {
    return 'CreateReportModel(reportedUserId: $reportedUserId, reason: $reason, sessionId: $sessionId)';
  }
}

/// @nodoc
abstract mixin class _$CreateReportModelCopyWith<$Res>
    implements $CreateReportModelCopyWith<$Res> {
  factory _$CreateReportModelCopyWith(
          _CreateReportModel value, $Res Function(_CreateReportModel) _then) =
      __$CreateReportModelCopyWithImpl;
  @override
  @useResult
  $Res call({String reportedUserId, String reason, String? sessionId});
}

/// @nodoc
class __$CreateReportModelCopyWithImpl<$Res>
    implements _$CreateReportModelCopyWith<$Res> {
  __$CreateReportModelCopyWithImpl(this._self, this._then);

  final _CreateReportModel _self;
  final $Res Function(_CreateReportModel) _then;

  /// Create a copy of CreateReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reportedUserId = null,
    Object? reason = null,
    Object? sessionId = freezed,
  }) {
    return _then(_CreateReportModel(
      reportedUserId: null == reportedUserId
          ? _self.reportedUserId
          : reportedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
