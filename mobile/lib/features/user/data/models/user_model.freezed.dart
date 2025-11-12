// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  String get userId;
  String get firstName;
  String? get profilePhotoUrl;
  VerificationStatus get verificationStatus;
  VerifiedGender get verifiedGender;
  ProfileVisibility get profileVisibility;
  UserRole get role;
  UserStatus get status;
  int get groupSessionCount;
  int get noShowCount;
  GymModel? get primaryGym;
  List<BadgeModel> get userBadges;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.verifiedGender, verifiedGender) ||
                other.verifiedGender == verifiedGender) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.groupSessionCount, groupSessionCount) ||
                other.groupSessionCount == groupSessionCount) &&
            (identical(other.noShowCount, noShowCount) ||
                other.noShowCount == noShowCount) &&
            (identical(other.primaryGym, primaryGym) ||
                other.primaryGym == primaryGym) &&
            const DeepCollectionEquality()
                .equals(other.userBadges, userBadges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      firstName,
      profilePhotoUrl,
      verificationStatus,
      verifiedGender,
      profileVisibility,
      role,
      status,
      groupSessionCount,
      noShowCount,
      primaryGym,
      const DeepCollectionEquality().hash(userBadges));

  @override
  String toString() {
    return 'UserModel(userId: $userId, firstName: $firstName, profilePhotoUrl: $profilePhotoUrl, verificationStatus: $verificationStatus, verifiedGender: $verifiedGender, profileVisibility: $profileVisibility, role: $role, status: $status, groupSessionCount: $groupSessionCount, noShowCount: $noShowCount, primaryGym: $primaryGym, userBadges: $userBadges)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String firstName,
      String? profilePhotoUrl,
      VerificationStatus verificationStatus,
      VerifiedGender verifiedGender,
      ProfileVisibility profileVisibility,
      UserRole role,
      UserStatus status,
      int groupSessionCount,
      int noShowCount,
      GymModel? primaryGym,
      List<BadgeModel> userBadges});

  $GymModelCopyWith<$Res>? get primaryGym;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? firstName = null,
    Object? profilePhotoUrl = freezed,
    Object? verificationStatus = null,
    Object? verifiedGender = null,
    Object? profileVisibility = null,
    Object? role = null,
    Object? status = null,
    Object? groupSessionCount = null,
    Object? noShowCount = null,
    Object? primaryGym = freezed,
    Object? userBadges = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _self.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: null == verificationStatus
          ? _self.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as VerificationStatus,
      verifiedGender: null == verifiedGender
          ? _self.verifiedGender
          : verifiedGender // ignore: cast_nullable_to_non_nullable
              as VerifiedGender,
      profileVisibility: null == profileVisibility
          ? _self.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      groupSessionCount: null == groupSessionCount
          ? _self.groupSessionCount
          : groupSessionCount // ignore: cast_nullable_to_non_nullable
              as int,
      noShowCount: null == noShowCount
          ? _self.noShowCount
          : noShowCount // ignore: cast_nullable_to_non_nullable
              as int,
      primaryGym: freezed == primaryGym
          ? _self.primaryGym
          : primaryGym // ignore: cast_nullable_to_non_nullable
              as GymModel?,
      userBadges: null == userBadges
          ? _self.userBadges
          : userBadges // ignore: cast_nullable_to_non_nullable
              as List<BadgeModel>,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GymModelCopyWith<$Res>? get primaryGym {
    if (_self.primaryGym == null) {
      return null;
    }

    return $GymModelCopyWith<$Res>(_self.primaryGym!, (value) {
      return _then(_self.copyWith(primaryGym: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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
    TResult Function(_UserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
    TResult Function(_UserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
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
    TResult? Function(_UserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
            String userId,
            String firstName,
            String? profilePhotoUrl,
            VerificationStatus verificationStatus,
            VerifiedGender verifiedGender,
            ProfileVisibility profileVisibility,
            UserRole role,
            UserStatus status,
            int groupSessionCount,
            int noShowCount,
            GymModel? primaryGym,
            List<BadgeModel> userBadges)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.userId,
            _that.firstName,
            _that.profilePhotoUrl,
            _that.verificationStatus,
            _that.verifiedGender,
            _that.profileVisibility,
            _that.role,
            _that.status,
            _that.groupSessionCount,
            _that.noShowCount,
            _that.primaryGym,
            _that.userBadges);
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
            String userId,
            String firstName,
            String? profilePhotoUrl,
            VerificationStatus verificationStatus,
            VerifiedGender verifiedGender,
            ProfileVisibility profileVisibility,
            UserRole role,
            UserStatus status,
            int groupSessionCount,
            int noShowCount,
            GymModel? primaryGym,
            List<BadgeModel> userBadges)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
        return $default(
            _that.userId,
            _that.firstName,
            _that.profilePhotoUrl,
            _that.verificationStatus,
            _that.verifiedGender,
            _that.profileVisibility,
            _that.role,
            _that.status,
            _that.groupSessionCount,
            _that.noShowCount,
            _that.primaryGym,
            _that.userBadges);
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
            String userId,
            String firstName,
            String? profilePhotoUrl,
            VerificationStatus verificationStatus,
            VerifiedGender verifiedGender,
            ProfileVisibility profileVisibility,
            UserRole role,
            UserStatus status,
            int groupSessionCount,
            int noShowCount,
            GymModel? primaryGym,
            List<BadgeModel> userBadges)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.userId,
            _that.firstName,
            _that.profilePhotoUrl,
            _that.verificationStatus,
            _that.verifiedGender,
            _that.profileVisibility,
            _that.role,
            _that.status,
            _that.groupSessionCount,
            _that.noShowCount,
            _that.primaryGym,
            _that.userBadges);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _UserModel extends UserModel {
  const _UserModel(
      {required this.userId,
      required this.firstName,
      this.profilePhotoUrl,
      required this.verificationStatus,
      required this.verifiedGender,
      required this.profileVisibility,
      required this.role,
      required this.status,
      required this.groupSessionCount,
      required this.noShowCount,
      this.primaryGym,
      final List<BadgeModel> userBadges = const []})
      : _userBadges = userBadges,
        super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String userId;
  @override
  final String firstName;
  @override
  final String? profilePhotoUrl;
  @override
  final VerificationStatus verificationStatus;
  @override
  final VerifiedGender verifiedGender;
  @override
  final ProfileVisibility profileVisibility;
  @override
  final UserRole role;
  @override
  final UserStatus status;
  @override
  final int groupSessionCount;
  @override
  final int noShowCount;
  @override
  final GymModel? primaryGym;
  final List<BadgeModel> _userBadges;
  @override
  @JsonKey()
  List<BadgeModel> get userBadges {
    if (_userBadges is EqualUnmodifiableListView) return _userBadges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userBadges);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.verifiedGender, verifiedGender) ||
                other.verifiedGender == verifiedGender) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.groupSessionCount, groupSessionCount) ||
                other.groupSessionCount == groupSessionCount) &&
            (identical(other.noShowCount, noShowCount) ||
                other.noShowCount == noShowCount) &&
            (identical(other.primaryGym, primaryGym) ||
                other.primaryGym == primaryGym) &&
            const DeepCollectionEquality()
                .equals(other._userBadges, _userBadges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      firstName,
      profilePhotoUrl,
      verificationStatus,
      verifiedGender,
      profileVisibility,
      role,
      status,
      groupSessionCount,
      noShowCount,
      primaryGym,
      const DeepCollectionEquality().hash(_userBadges));

  @override
  String toString() {
    return 'UserModel(userId: $userId, firstName: $firstName, profilePhotoUrl: $profilePhotoUrl, verificationStatus: $verificationStatus, verifiedGender: $verifiedGender, profileVisibility: $profileVisibility, role: $role, status: $status, groupSessionCount: $groupSessionCount, noShowCount: $noShowCount, primaryGym: $primaryGym, userBadges: $userBadges)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String firstName,
      String? profilePhotoUrl,
      VerificationStatus verificationStatus,
      VerifiedGender verifiedGender,
      ProfileVisibility profileVisibility,
      UserRole role,
      UserStatus status,
      int groupSessionCount,
      int noShowCount,
      GymModel? primaryGym,
      List<BadgeModel> userBadges});

  @override
  $GymModelCopyWith<$Res>? get primaryGym;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? firstName = null,
    Object? profilePhotoUrl = freezed,
    Object? verificationStatus = null,
    Object? verifiedGender = null,
    Object? profileVisibility = null,
    Object? role = null,
    Object? status = null,
    Object? groupSessionCount = null,
    Object? noShowCount = null,
    Object? primaryGym = freezed,
    Object? userBadges = null,
  }) {
    return _then(_UserModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _self.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: null == verificationStatus
          ? _self.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as VerificationStatus,
      verifiedGender: null == verifiedGender
          ? _self.verifiedGender
          : verifiedGender // ignore: cast_nullable_to_non_nullable
              as VerifiedGender,
      profileVisibility: null == profileVisibility
          ? _self.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      groupSessionCount: null == groupSessionCount
          ? _self.groupSessionCount
          : groupSessionCount // ignore: cast_nullable_to_non_nullable
              as int,
      noShowCount: null == noShowCount
          ? _self.noShowCount
          : noShowCount // ignore: cast_nullable_to_non_nullable
              as int,
      primaryGym: freezed == primaryGym
          ? _self.primaryGym
          : primaryGym // ignore: cast_nullable_to_non_nullable
              as GymModel?,
      userBadges: null == userBadges
          ? _self._userBadges
          : userBadges // ignore: cast_nullable_to_non_nullable
              as List<BadgeModel>,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GymModelCopyWith<$Res>? get primaryGym {
    if (_self.primaryGym == null) {
      return null;
    }

    return $GymModelCopyWith<$Res>(_self.primaryGym!, (value) {
      return _then(_self.copyWith(primaryGym: value));
    });
  }
}

// dart format on
