// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterRequestModel _$RegisterRequestModelFromJson(Map<String, dynamic> json) {
  return _RegisterRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequestModel {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get recaptchaToken => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get dateOfBirth =>
      throw _privateConstructorUsedError; // Send as "YYYY-MM-DD" string
  String get primaryGymId =>
      throw _privateConstructorUsedError; // Send the UUID as a String
  String? get profilePhotoUrl => throw _privateConstructorUsedError; // Optional
  List<int> get goalTagIds => throw _privateConstructorUsedError;
  List<int> get scheduleTagIds => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestModelCopyWith<RegisterRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestModelCopyWith<$Res> {
  factory $RegisterRequestModelCopyWith(
    RegisterRequestModel value,
    $Res Function(RegisterRequestModel) then,
  ) = _$RegisterRequestModelCopyWithImpl<$Res, RegisterRequestModel>;
  @useResult
  $Res call({
    String phoneNumber,
    String password,
    String recaptchaToken,
    String firstName,
    String dateOfBirth,
    String primaryGymId,
    String? profilePhotoUrl,
    List<int> goalTagIds,
    List<int> scheduleTagIds,
  });
}

/// @nodoc
class _$RegisterRequestModelCopyWithImpl<
  $Res,
  $Val extends RegisterRequestModel
>
    implements $RegisterRequestModelCopyWith<$Res> {
  _$RegisterRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(
      _value.copyWith(
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            recaptchaToken: null == recaptchaToken
                ? _value.recaptchaToken
                : recaptchaToken // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            dateOfBirth: null == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String,
            primaryGymId: null == primaryGymId
                ? _value.primaryGymId
                : primaryGymId // ignore: cast_nullable_to_non_nullable
                      as String,
            profilePhotoUrl: freezed == profilePhotoUrl
                ? _value.profilePhotoUrl
                : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            goalTagIds: null == goalTagIds
                ? _value.goalTagIds
                : goalTagIds // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            scheduleTagIds: null == scheduleTagIds
                ? _value.scheduleTagIds
                : scheduleTagIds // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterRequestModelImplCopyWith<$Res>
    implements $RegisterRequestModelCopyWith<$Res> {
  factory _$$RegisterRequestModelImplCopyWith(
    _$RegisterRequestModelImpl value,
    $Res Function(_$RegisterRequestModelImpl) then,
  ) = __$$RegisterRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String phoneNumber,
    String password,
    String recaptchaToken,
    String firstName,
    String dateOfBirth,
    String primaryGymId,
    String? profilePhotoUrl,
    List<int> goalTagIds,
    List<int> scheduleTagIds,
  });
}

/// @nodoc
class __$$RegisterRequestModelImplCopyWithImpl<$Res>
    extends _$RegisterRequestModelCopyWithImpl<$Res, _$RegisterRequestModelImpl>
    implements _$$RegisterRequestModelImplCopyWith<$Res> {
  __$$RegisterRequestModelImplCopyWithImpl(
    _$RegisterRequestModelImpl _value,
    $Res Function(_$RegisterRequestModelImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$RegisterRequestModelImpl(
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        recaptchaToken: null == recaptchaToken
            ? _value.recaptchaToken
            : recaptchaToken // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        dateOfBirth: null == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String,
        primaryGymId: null == primaryGymId
            ? _value.primaryGymId
            : primaryGymId // ignore: cast_nullable_to_non_nullable
                  as String,
        profilePhotoUrl: freezed == profilePhotoUrl
            ? _value.profilePhotoUrl
            : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        goalTagIds: null == goalTagIds
            ? _value._goalTagIds
            : goalTagIds // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        scheduleTagIds: null == scheduleTagIds
            ? _value._scheduleTagIds
            : scheduleTagIds // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class _$RegisterRequestModelImpl implements _RegisterRequestModel {
  const _$RegisterRequestModelImpl({
    required this.phoneNumber,
    required this.password,
    required this.recaptchaToken,
    required this.firstName,
    required this.dateOfBirth,
    required this.primaryGymId,
    this.profilePhotoUrl,
    required final List<int> goalTagIds,
    required final List<int> scheduleTagIds,
  }) : _goalTagIds = goalTagIds,
       _scheduleTagIds = scheduleTagIds;

  factory _$RegisterRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestModelImplFromJson(json);

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

  @override
  String toString() {
    return 'RegisterRequestModel(phoneNumber: $phoneNumber, password: $password, recaptchaToken: $recaptchaToken, firstName: $firstName, dateOfBirth: $dateOfBirth, primaryGymId: $primaryGymId, profilePhotoUrl: $profilePhotoUrl, goalTagIds: $goalTagIds, scheduleTagIds: $scheduleTagIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestModelImpl &&
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
            const DeepCollectionEquality().equals(
              other._goalTagIds,
              _goalTagIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._scheduleTagIds,
              _scheduleTagIds,
            ));
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
    const DeepCollectionEquality().hash(_scheduleTagIds),
  );

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestModelImplCopyWith<_$RegisterRequestModelImpl>
  get copyWith =>
      __$$RegisterRequestModelImplCopyWithImpl<_$RegisterRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestModelImplToJson(this);
  }
}

abstract class _RegisterRequestModel implements RegisterRequestModel {
  const factory _RegisterRequestModel({
    required final String phoneNumber,
    required final String password,
    required final String recaptchaToken,
    required final String firstName,
    required final String dateOfBirth,
    required final String primaryGymId,
    final String? profilePhotoUrl,
    required final List<int> goalTagIds,
    required final List<int> scheduleTagIds,
  }) = _$RegisterRequestModelImpl;

  factory _RegisterRequestModel.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestModelImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get password;
  @override
  String get recaptchaToken;
  @override
  String get firstName;
  @override
  String get dateOfBirth; // Send as "YYYY-MM-DD" string
  @override
  String get primaryGymId; // Send the UUID as a String
  @override
  String? get profilePhotoUrl; // Optional
  @override
  List<int> get goalTagIds;
  @override
  List<int> get scheduleTagIds;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestModelImplCopyWith<_$RegisterRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
