// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_sms_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifySmsRequestModel {
  String get phoneNumber;
  String get otp;

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifySmsRequestModelCopyWith<VerifySmsRequestModel> get copyWith =>
      _$VerifySmsRequestModelCopyWithImpl<VerifySmsRequestModel>(
          this as VerifySmsRequestModel, _$identity);

  /// Serializes this VerifySmsRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifySmsRequestModel &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp);

  @override
  String toString() {
    return 'VerifySmsRequestModel(phoneNumber: $phoneNumber, otp: $otp)';
  }
}

/// @nodoc
abstract mixin class $VerifySmsRequestModelCopyWith<$Res> {
  factory $VerifySmsRequestModelCopyWith(VerifySmsRequestModel value,
          $Res Function(VerifySmsRequestModel) _then) =
      _$VerifySmsRequestModelCopyWithImpl;
  @useResult
  $Res call({String phoneNumber, String otp});
}

/// @nodoc
class _$VerifySmsRequestModelCopyWithImpl<$Res>
    implements $VerifySmsRequestModelCopyWith<$Res> {
  _$VerifySmsRequestModelCopyWithImpl(this._self, this._then);

  final VerifySmsRequestModel _self;
  final $Res Function(VerifySmsRequestModel) _then;

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
  }) {
    return _then(_self.copyWith(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [VerifySmsRequestModel].
extension VerifySmsRequestModelPatterns on VerifySmsRequestModel {
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
    TResult Function(_VerifySmsRequestModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerifySmsRequestModel() when $default != null:
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
    TResult Function(_VerifySmsRequestModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifySmsRequestModel():
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
    TResult? Function(_VerifySmsRequestModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifySmsRequestModel() when $default != null:
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
    TResult Function(String phoneNumber, String otp)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerifySmsRequestModel() when $default != null:
        return $default(_that.phoneNumber, _that.otp);
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
    TResult Function(String phoneNumber, String otp) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifySmsRequestModel():
        return $default(_that.phoneNumber, _that.otp);
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
    TResult? Function(String phoneNumber, String otp)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifySmsRequestModel() when $default != null:
        return $default(_that.phoneNumber, _that.otp);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _VerifySmsRequestModel implements VerifySmsRequestModel {
  const _VerifySmsRequestModel({required this.phoneNumber, required this.otp});
  factory _VerifySmsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifySmsRequestModelFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String otp;

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerifySmsRequestModelCopyWith<_VerifySmsRequestModel> get copyWith =>
      __$VerifySmsRequestModelCopyWithImpl<_VerifySmsRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerifySmsRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifySmsRequestModel &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp);

  @override
  String toString() {
    return 'VerifySmsRequestModel(phoneNumber: $phoneNumber, otp: $otp)';
  }
}

/// @nodoc
abstract mixin class _$VerifySmsRequestModelCopyWith<$Res>
    implements $VerifySmsRequestModelCopyWith<$Res> {
  factory _$VerifySmsRequestModelCopyWith(_VerifySmsRequestModel value,
          $Res Function(_VerifySmsRequestModel) _then) =
      __$VerifySmsRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({String phoneNumber, String otp});
}

/// @nodoc
class __$VerifySmsRequestModelCopyWithImpl<$Res>
    implements _$VerifySmsRequestModelCopyWith<$Res> {
  __$VerifySmsRequestModelCopyWithImpl(this._self, this._then);

  final _VerifySmsRequestModel _self;
  final $Res Function(_VerifySmsRequestModel) _then;

  /// Create a copy of VerifySmsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
  }) {
    return _then(_VerifySmsRequestModel(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
