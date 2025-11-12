// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_otp_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResendOtpRequestModel {
  String get phoneNumber;
  String get recaptchaToken;

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResendOtpRequestModelCopyWith<ResendOtpRequestModel> get copyWith =>
      _$ResendOtpRequestModelCopyWithImpl<ResendOtpRequestModel>(
          this as ResendOtpRequestModel, _$identity);

  /// Serializes this ResendOtpRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResendOtpRequestModel &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.recaptchaToken, recaptchaToken) ||
                other.recaptchaToken == recaptchaToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, recaptchaToken);

  @override
  String toString() {
    return 'ResendOtpRequestModel(phoneNumber: $phoneNumber, recaptchaToken: $recaptchaToken)';
  }
}

/// @nodoc
abstract mixin class $ResendOtpRequestModelCopyWith<$Res> {
  factory $ResendOtpRequestModelCopyWith(ResendOtpRequestModel value,
          $Res Function(ResendOtpRequestModel) _then) =
      _$ResendOtpRequestModelCopyWithImpl;
  @useResult
  $Res call({String phoneNumber, String recaptchaToken});
}

/// @nodoc
class _$ResendOtpRequestModelCopyWithImpl<$Res>
    implements $ResendOtpRequestModelCopyWith<$Res> {
  _$ResendOtpRequestModelCopyWithImpl(this._self, this._then);

  final ResendOtpRequestModel _self;
  final $Res Function(ResendOtpRequestModel) _then;

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? recaptchaToken = null,
  }) {
    return _then(_self.copyWith(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      recaptchaToken: null == recaptchaToken
          ? _self.recaptchaToken
          : recaptchaToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResendOtpRequestModel].
extension ResendOtpRequestModelPatterns on ResendOtpRequestModel {
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
    TResult Function(_ResendOtpRequestModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResendOtpRequestModel() when $default != null:
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
    TResult Function(_ResendOtpRequestModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResendOtpRequestModel():
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
    TResult? Function(_ResendOtpRequestModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResendOtpRequestModel() when $default != null:
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
    TResult Function(String phoneNumber, String recaptchaToken)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResendOtpRequestModel() when $default != null:
        return $default(_that.phoneNumber, _that.recaptchaToken);
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
    TResult Function(String phoneNumber, String recaptchaToken) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResendOtpRequestModel():
        return $default(_that.phoneNumber, _that.recaptchaToken);
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
    TResult? Function(String phoneNumber, String recaptchaToken)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResendOtpRequestModel() when $default != null:
        return $default(_that.phoneNumber, _that.recaptchaToken);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _ResendOtpRequestModel implements ResendOtpRequestModel {
  const _ResendOtpRequestModel(
      {required this.phoneNumber, required this.recaptchaToken});
  factory _ResendOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpRequestModelFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String recaptchaToken;

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResendOtpRequestModelCopyWith<_ResendOtpRequestModel> get copyWith =>
      __$ResendOtpRequestModelCopyWithImpl<_ResendOtpRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResendOtpRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResendOtpRequestModel &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.recaptchaToken, recaptchaToken) ||
                other.recaptchaToken == recaptchaToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, recaptchaToken);

  @override
  String toString() {
    return 'ResendOtpRequestModel(phoneNumber: $phoneNumber, recaptchaToken: $recaptchaToken)';
  }
}

/// @nodoc
abstract mixin class _$ResendOtpRequestModelCopyWith<$Res>
    implements $ResendOtpRequestModelCopyWith<$Res> {
  factory _$ResendOtpRequestModelCopyWith(_ResendOtpRequestModel value,
          $Res Function(_ResendOtpRequestModel) _then) =
      __$ResendOtpRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({String phoneNumber, String recaptchaToken});
}

/// @nodoc
class __$ResendOtpRequestModelCopyWithImpl<$Res>
    implements _$ResendOtpRequestModelCopyWith<$Res> {
  __$ResendOtpRequestModelCopyWithImpl(this._self, this._then);

  final _ResendOtpRequestModel _self;
  final $Res Function(_ResendOtpRequestModel) _then;

  /// Create a copy of ResendOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phoneNumber = null,
    Object? recaptchaToken = null,
  }) {
    return _then(_ResendOtpRequestModel(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      recaptchaToken: null == recaptchaToken
          ? _self.recaptchaToken
          : recaptchaToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
