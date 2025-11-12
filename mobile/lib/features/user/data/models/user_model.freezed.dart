// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get userId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  VerificationStatus get verificationStatus =>
      throw _privateConstructorUsedError;
  VerifiedGender get verifiedGender => throw _privateConstructorUsedError;
  ProfileVisibility get profileVisibility => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;
  int get groupSessionCount => throw _privateConstructorUsedError;
  int get noShowCount => throw _privateConstructorUsedError;
  GymModel? get primaryGym => throw _privateConstructorUsedError;
  List<BadgeModel> get userBadges => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
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
    List<BadgeModel> userBadges,
  });

  $GymModelCopyWith<$Res>? get primaryGym;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            profilePhotoUrl: freezed == profilePhotoUrl
                ? _value.profilePhotoUrl
                : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationStatus: null == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as VerificationStatus,
            verifiedGender: null == verifiedGender
                ? _value.verifiedGender
                : verifiedGender // ignore: cast_nullable_to_non_nullable
                      as VerifiedGender,
            profileVisibility: null == profileVisibility
                ? _value.profileVisibility
                : profileVisibility // ignore: cast_nullable_to_non_nullable
                      as ProfileVisibility,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as UserRole,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as UserStatus,
            groupSessionCount: null == groupSessionCount
                ? _value.groupSessionCount
                : groupSessionCount // ignore: cast_nullable_to_non_nullable
                      as int,
            noShowCount: null == noShowCount
                ? _value.noShowCount
                : noShowCount // ignore: cast_nullable_to_non_nullable
                      as int,
            primaryGym: freezed == primaryGym
                ? _value.primaryGym
                : primaryGym // ignore: cast_nullable_to_non_nullable
                      as GymModel?,
            userBadges: null == userBadges
                ? _value.userBadges
                : userBadges // ignore: cast_nullable_to_non_nullable
                      as List<BadgeModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GymModelCopyWith<$Res>? get primaryGym {
    if (_value.primaryGym == null) {
      return null;
    }

    return $GymModelCopyWith<$Res>(_value.primaryGym!, (value) {
      return _then(_value.copyWith(primaryGym: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
    List<BadgeModel> userBadges,
  });

  @override
  $GymModelCopyWith<$Res>? get primaryGym;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$UserModelImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        profilePhotoUrl: freezed == profilePhotoUrl
            ? _value.profilePhotoUrl
            : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationStatus: null == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as VerificationStatus,
        verifiedGender: null == verifiedGender
            ? _value.verifiedGender
            : verifiedGender // ignore: cast_nullable_to_non_nullable
                  as VerifiedGender,
        profileVisibility: null == profileVisibility
            ? _value.profileVisibility
            : profileVisibility // ignore: cast_nullable_to_non_nullable
                  as ProfileVisibility,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UserStatus,
        groupSessionCount: null == groupSessionCount
            ? _value.groupSessionCount
            : groupSessionCount // ignore: cast_nullable_to_non_nullable
                  as int,
        noShowCount: null == noShowCount
            ? _value.noShowCount
            : noShowCount // ignore: cast_nullable_to_non_nullable
                  as int,
        primaryGym: freezed == primaryGym
            ? _value.primaryGym
            : primaryGym // ignore: cast_nullable_to_non_nullable
                  as GymModel?,
        userBadges: null == userBadges
            ? _value._userBadges
            : userBadges // ignore: cast_nullable_to_non_nullable
                  as List<BadgeModel>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl({
    required this.userId,
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
    final List<BadgeModel> userBadges = const [],
  }) : _userBadges = userBadges,
       super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

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

  @override
  String toString() {
    return 'UserModel(userId: $userId, firstName: $firstName, profilePhotoUrl: $profilePhotoUrl, verificationStatus: $verificationStatus, verifiedGender: $verifiedGender, profileVisibility: $profileVisibility, role: $role, status: $status, groupSessionCount: $groupSessionCount, noShowCount: $noShowCount, primaryGym: $primaryGym, userBadges: $userBadges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
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
            const DeepCollectionEquality().equals(
              other._userBadges,
              _userBadges,
            ));
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
    const DeepCollectionEquality().hash(_userBadges),
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel({
    required final String userId,
    required final String firstName,
    final String? profilePhotoUrl,
    required final VerificationStatus verificationStatus,
    required final VerifiedGender verifiedGender,
    required final ProfileVisibility profileVisibility,
    required final UserRole role,
    required final UserStatus status,
    required final int groupSessionCount,
    required final int noShowCount,
    final GymModel? primaryGym,
    final List<BadgeModel> userBadges,
  }) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get firstName;
  @override
  String? get profilePhotoUrl;
  @override
  VerificationStatus get verificationStatus;
  @override
  VerifiedGender get verifiedGender;
  @override
  ProfileVisibility get profileVisibility;
  @override
  UserRole get role;
  @override
  UserStatus get status;
  @override
  int get groupSessionCount;
  @override
  int get noShowCount;
  @override
  GymModel? get primaryGym;
  @override
  List<BadgeModel> get userBadges;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
