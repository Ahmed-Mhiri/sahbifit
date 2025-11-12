// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterRequestModel {
  String get phoneNumber;
  String get password;
  String get recaptchaToken;
  String get firstName;
  String get dateOfBirth; // Send as "YYYY-MM-DD" string
  String get primaryGymId; // Send the UUID as a String
  String? get profilePhotoUrl; // Optional
  List<int> get goalTagIds;
  List<int> get scheduleTagIds;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterRequestModelCopyWith<RegisterRequestModel> get copyWith =>
      _$RegisterRequestModelCopyWithImpl<RegisterRequestModel>(
          this as RegisterRequestModel, _$identity);

  /// Serializes this RegisterRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterRequestModel &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.recaptchaToken, recaptchaToken) ||
                other.recaptchaToken == recaptchaToken) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.primaryGymId, primaryGymId) ||
                other.primaryGymId == primaryGymId) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            const DeepCollectionEquality()
                .equals(other.goalTagIds, goalTagIds) &&
            const DeepCollectionEquality()
                .equals(other.scheduleTagIds, scheduleTagIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      phoneNumber,
      password,
      recaptchaToken,
      firstName,
      dateOfBirth,
      primaryGymId,
      profilePhotoUrl,
      const DeepCollectionEquality().hash(goalTagIds),
      const DeepCollectionEquality().hash(scheduleTagIds));

  @override
  String toString() {
    return 'RegisterRequestModel(phoneNumber: $phoneNumber, password: $password, recaptchaToken: $recaptchaToken, firstName: $firstName, dateOfBirth: $dateOfBirth, primaryGymId: $primaryGymId, profilePhotoUrl: $profilePhotoUrl, goalTagIds: $goalTagIds, scheduleTagIds: $scheduleTagIds)';
  }
}

/// @nodoc
abstract mixin class $RegisterRequestModelCopyWith<$Res> {
  factory $RegisterRequestModelCopyWith(RegisterRequestModel value,
          $Res Function(RegisterRequestModel) _then) =
      _$RegisterRequestModelCopyWithImpl;
  @useResult
  $Res call(
      {String phoneNumber,
      String password,
      String recaptchaToken,
      String firstName,
      String dateOfBirth,
      String primaryGymId,
      String? profilePhotoUrl,
      List<int> goalTagIds,
      List<int> scheduleTagIds});
}

/// @nodoc
class _$RegisterRequestModelCopyWithImpl<$Res>
    implements $RegisterRequestModelCopyWith<$Res> {
  _$RegisterRequestModelCopyWithImpl(this._self, this._then);

  final RegisterRequestModel _self;
  final $Res Function(RegisterRequestModel) _then;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? password = null,
    Object? recaptchaToken = null,
    Object? firstName = null,
    Object? dateOfBirth = null,
    Object? primaryGymId = null,
    Object? profilePhotoUrl = freezed,
    Object? goalTagIds = null,
    Object? scheduleTagIds = null,
  }) {
    return _then(_self.copyWith(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      recaptchaToken: null == recaptchaToken
          ? _self.recaptchaToken
          : recaptchaToken // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      primaryGymId: null == primaryGymId
          ? _self.primaryGymId
          : primaryGymId // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _self.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      goalTagIds: null == goalTagIds
          ? _self.goalTagIds
          : goalTagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      scheduleTagIds: null == scheduleTagIds
          ? _self.scheduleTagIds
          : scheduleTagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [RegisterRequestModel].
extension RegisterRequestModelPatterns on RegisterRequestModel {
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
    TResult Function(_RegisterRequestModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterRequestModel() when $default != null:
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
    TResult Function(_RegisterRequestModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterRequestModel():
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
    TResult? Function(_RegisterRequestModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterRequestModel() when $default != null:
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
            String phoneNumber,
            String password,
            String recaptchaToken,
            String firstName,
            String dateOfBirth,
            String primaryGymId,
            String? profilePhotoUrl,
            List<int> goalTagIds,
            List<int> scheduleTagIds)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterRequestModel() when $default != null:
        return $default(
            _that.phoneNumber,
            _that.password,
            _that.recaptchaToken,
            _that.firstName,
            _that.dateOfBirth,
            _that.primaryGymId,
            _that.profilePhotoUrl,
            _that.goalTagIds,
            _that.scheduleTagIds);
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
            String phoneNumber,
            String password,
            String recaptchaToken,
            String firstName,
            String dateOfBirth,
            String primaryGymId,
            String? profilePhotoUrl,
            List<int> goalTagIds,
            List<int> scheduleTagIds)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterRequestModel():
        return $default(
            _that.phoneNumber,
            _that.password,
            _that.recaptchaToken,
            _that.firstName,
            _that.dateOfBirth,
            _that.primaryGymId,
            _that.profilePhotoUrl,
            _that.goalTagIds,
            _that.scheduleTagIds);
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
            String phoneNumber,
            String password,
            String recaptchaToken,
            String firstName,
            String dateOfBirth,
            String primaryGymId,
            String? profilePhotoUrl,
            List<int> goalTagIds,
            List<int> scheduleTagIds)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterRequestModel() when $default != null:
        return $default(
            _that.phoneNumber,
            _that.password,
            _that.recaptchaToken,
            _that.firstName,
            _that.dateOfBirth,
            _that.primaryGymId,
            _that.profilePhotoUrl,
            _that.goalTagIds,
            _that.scheduleTagIds);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _RegisterRequestModel implements RegisterRequestModel {
  const _RegisterRequestModel(
      {required this.phoneNumber,
      required this.password,
      required this.recaptchaToken,
      required this.firstName,
      required this.dateOfBirth,
      required this.primaryGymId,
      this.profilePhotoUrl,
      required final List<int> goalTagIds,
      required final List<int> scheduleTagIds})
      : _goalTagIds = goalTagIds,
        _scheduleTagIds = scheduleTagIds;
  factory _RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String password;
  @override
  final String recaptchaToken;
  @override
  final String firstName;
  @override
  final String dateOfBirth;
// Send as "YYYY-MM-DD" string
  @override
  final String primaryGymId;
// Send the UUID as a String
  @override
  final String? profilePhotoUrl;
// Optional
  final List<int> _goalTagIds;
// Optional
  @override
  List<int> get goalTagIds {
    if (_goalTagIds is EqualUnmodifiableListView) return _goalTagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goalTagIds);
  }

  final List<int> _scheduleTagIds;
  @override
  List<int> get scheduleTagIds {
    if (_scheduleTagIds is EqualUnmodifiableListView) return _scheduleTagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleTagIds);
  }

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterRequestModelCopyWith<_RegisterRequestModel> get copyWith =>
      __$RegisterRequestModelCopyWithImpl<_RegisterRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterRequestModel &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.recaptchaToken, recaptchaToken) ||
                other.recaptchaToken == recaptchaToken) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.primaryGymId, primaryGymId) ||
                other.primaryGymId == primaryGymId) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            const DeepCollectionEquality()
                .equals(other._goalTagIds, _goalTagIds) &&
            const DeepCollectionEquality()
                .equals(other._scheduleTagIds, _scheduleTagIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      phoneNumber,
      password,
      recaptchaToken,
      firstName,
      dateOfBirth,
      primaryGymId,
      profilePhotoUrl,
      const DeepCollectionEquality().hash(_goalTagIds),
      const DeepCollectionEquality().hash(_scheduleTagIds));

  @override
  String toString() {
    return 'RegisterRequestModel(phoneNumber: $phoneNumber, password: $password, recaptchaToken: $recaptchaToken, firstName: $firstName, dateOfBirth: $dateOfBirth, primaryGymId: $primaryGymId, profilePhotoUrl: $profilePhotoUrl, goalTagIds: $goalTagIds, scheduleTagIds: $scheduleTagIds)';
  }
}

/// @nodoc
abstract mixin class _$RegisterRequestModelCopyWith<$Res>
    implements $RegisterRequestModelCopyWith<$Res> {
  factory _$RegisterRequestModelCopyWith(_RegisterRequestModel value,
          $Res Function(_RegisterRequestModel) _then) =
      __$RegisterRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String password,
      String recaptchaToken,
      String firstName,
      String dateOfBirth,
      String primaryGymId,
      String? profilePhotoUrl,
      List<int> goalTagIds,
      List<int> scheduleTagIds});
}

/// @nodoc
class __$RegisterRequestModelCopyWithImpl<$Res>
    implements _$RegisterRequestModelCopyWith<$Res> {
  __$RegisterRequestModelCopyWithImpl(this._self, this._then);

  final _RegisterRequestModel _self;
  final $Res Function(_RegisterRequestModel) _then;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phoneNumber = null,
    Object? password = null,
    Object? recaptchaToken = null,
    Object? firstName = null,
    Object? dateOfBirth = null,
    Object? primaryGymId = null,
    Object? profilePhotoUrl = freezed,
    Object? goalTagIds = null,
    Object? scheduleTagIds = null,
  }) {
    return _then(_RegisterRequestModel(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      recaptchaToken: null == recaptchaToken
          ? _self.recaptchaToken
          : recaptchaToken // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      primaryGymId: null == primaryGymId
          ? _self.primaryGymId
          : primaryGymId // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _self.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      goalTagIds: null == goalTagIds
          ? _self._goalTagIds
          : goalTagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      scheduleTagIds: null == scheduleTagIds
          ? _self._scheduleTagIds
          : scheduleTagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

// dart format on
