// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_user.dart' as _i778;
import '../../features/auth/domain/usecases/register_user.dart' as _i198;
import '../../features/auth/domain/usecases/resend_otp.dart' as _i152;
import '../../features/auth/domain/usecases/verify_sms.dart' as _i699;
import '../../features/chat/data/datasources/chat_remote_datasource.dart'
    as _i159;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i504;
import '../../features/chat/domain/repositories/chat_repository.dart' as _i420;
import '../../features/chat/domain/usecases/get_chat_stream.dart' as _i583;
import '../../features/chat/domain/usecases/send_message.dart' as _i76;
import '../../features/gym/data/datasources/gym_remote_datasource.dart'
    as _i602;
import '../../features/gym/data/repositories/gym_repository_impl.dart' as _i689;
import '../../features/gym/domain/repositories/gym_repository.dart' as _i225;
import '../../features/gym/domain/usecases/get_approved_gyms.dart' as _i338;
import '../../features/gym/domain/usecases/submit_gym.dart' as _i82;
import '../../features/rating/data/datasources/rating_remote_datasource.dart'
    as _i193;
import '../../features/rating/data/repositories/rating_repository_impl.dart'
    as _i874;
import '../../features/rating/domain/repositories/rating_repository.dart'
    as _i1027;
import '../../features/rating/domain/usecases/create_rating.dart' as _i694;
import '../../features/rating/domain/usecases/get_pending_ratings.dart'
    as _i396;
import '../../features/rating/domain/usecases/get_ratings_for_user.dart'
    as _i809;
import '../../features/report/data/datasources/report_remote_datasource.dart'
    as _i548;
import '../../features/report/data/repositories/report_repository_impl.dart'
    as _i420;
import '../../features/report/domain/repositories/report_repository.dart'
    as _i23;
import '../../features/report/domain/usecases/create_report.dart' as _i775;
import '../../features/session/data/datasources/session_remote_datasource.dart'
    as _i478;
import '../../features/session/data/datasources/session_remote_datasource_impl.dart'
    as _i446;
import '../../features/session/data/repositories/session_repository_impl.dart'
    as _i1021;
import '../../features/session/domain/repositories/session_repository.dart'
    as _i738;
import '../../features/session/domain/usecases/create_session.dart' as _i831;
import '../../features/session/domain/usecases/get_active_sessions.dart'
    as _i51;
import '../../features/session/domain/usecases/join_session.dart' as _i170;
import '../../features/session/domain/usecases/mark_attendance.dart' as _i690;
import '../../features/tag/data/datasources/tag_remote_datasource.dart'
    as _i501;
import '../../features/tag/data/repositories/tag_repository_impl.dart' as _i454;
import '../../features/tag/domain/repositories/tag_repository.dart' as _i701;
import '../../features/tag/domain/usecases/get_tags_by_type.dart' as _i521;
import '../../features/user/data/datasources/user_remote_datasource.dart'
    as _i708;
import '../../features/user/data/repositories/user_repository_impl.dart'
    as _i664;
import '../../features/user/domain/repositories/user_repository.dart' as _i237;
import '../../features/user/domain/usecases/block_user.dart' as _i696;
import '../../features/user/domain/usecases/get_my_profile.dart' as _i667;
import '../../features/user/domain/usecases/get_user_profile.dart' as _i497;
import '../../features/user/domain/usecases/update_fcm_token.dart' as _i652;
import '../../features/user/domain/usecases/update_profile_visibility.dart'
    as _i544;
import '../../features/verification/data/datasources/verification_remote_datasource.dart'
    as _i552;
import '../../features/verification/data/repositories/verification_repository_impl.dart'
    as _i306;
import '../../features/verification/domain/repositories/verification_repository.dart'
    as _i1070;
import '../../features/verification/domain/usecases/get_verification_status.dart'
    as _i482;
import '../../features/verification/domain/usecases/submit_verification_video.dart'
    as _i573;
import '../api/api_client.dart' as _i277;
import '../api/interceptors.dart' as _i367;
import '../services/secure_storage_service.dart' as _i535;
import 'firebase_module.dart' as _i616;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseModule = _$FirebaseModule();
  final storageModule = _$StorageModule();
  gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
  gh.lazySingleton<_i558.FlutterSecureStorage>(() => storageModule.storage);
  gh.lazySingleton<_i535.SecureStorageService>(
      () => _i535.SecureStorageService(gh<_i558.FlutterSecureStorage>()));
  gh.lazySingleton<_i367.AuthInterceptor>(
      () => _i367.AuthInterceptor(gh<_i535.SecureStorageService>()));
  gh.lazySingleton<_i277.ApiClient>(
      () => _i277.ApiClient(gh<_i367.AuthInterceptor>()));
  gh.factory<_i159.ChatRemoteDatasource>(
      () => _i159.ChatRemoteDatasourceImpl(gh<_i974.FirebaseFirestore>()));
  gh.factory<_i501.TagRemoteDatasource>(
      () => _i501.TagRemoteDatasourceImpl(gh<_i277.ApiClient>()));
  gh.factory<_i478.SessionRemoteDatasource>(
      () => _i446.SessionRemoteDatasourceImpl(gh<_i277.ApiClient>()));
  gh.factory<_i708.UserRemoteDatasource>(
      () => _i708.UserRemoteDatasourceImpl(gh<_i277.ApiClient>()));
  gh.factory<_i548.ReportRemoteDatasource>(
      () => _i548.ReportRemoteDatasourceImpl(gh<_i277.ApiClient>()));
  gh.factory<_i23.ReportRepository>(
      () => _i420.ReportRepositoryImpl(gh<_i548.ReportRemoteDatasource>()));
  gh.factory<_i775.CreateReport>(
      () => _i775.CreateReport(gh<_i23.ReportRepository>()));
  gh.factory<_i237.UserRepository>(
      () => _i664.UserRepositoryImpl(gh<_i708.UserRemoteDatasource>()));
  gh.factory<_i602.GymRemoteDatasource>(
      () => _i602.GymRemoteDatasourceImpl(gh<_i277.ApiClient>()));
  gh.factory<_i552.VerificationRemoteDatasource>(
      () => _i552.VerificationRemoteDatasourceImpl(gh<_i277.ApiClient>()));
  gh.factory<_i225.GymRepository>(
      () => _i689.GymRepositoryImpl(gh<_i602.GymRemoteDatasource>()));
  gh.factory<_i420.ChatRepository>(
      () => _i504.ChatRepositoryImpl(gh<_i159.ChatRemoteDatasource>()));
  gh.factory<_i701.TagRepository>(
      () => _i454.TagRepositoryImpl(gh<_i501.TagRemoteDatasource>()));
  gh.factory<_i521.GetTagsByType>(
      () => _i521.GetTagsByType(gh<_i701.TagRepository>()));
  gh.factory<_i696.BlockUser>(
      () => _i696.BlockUser(gh<_i237.UserRepository>()));
  gh.factory<_i667.GetMyProfile>(
      () => _i667.GetMyProfile(gh<_i237.UserRepository>()));
  gh.factory<_i497.GetUserProfile>(
      () => _i497.GetUserProfile(gh<_i237.UserRepository>()));
  gh.factory<_i652.UpdateFcmToken>(
      () => _i652.UpdateFcmToken(gh<_i237.UserRepository>()));
  gh.factory<_i544.UpdateProfileVisibility>(
      () => _i544.UpdateProfileVisibility(gh<_i237.UserRepository>()));
  gh.factory<_i193.RatingRemoteDatasource>(
      () => _i193.RatingRemoteDatasourceImpl(gh<_i277.ApiClient>()));
  gh.factory<_i738.SessionRepository>(
      () => _i1021.SessionRepositoryImpl(gh<_i478.SessionRemoteDatasource>()));
  gh.factory<_i161.AuthRemoteDatasource>(
      () => _i161.AuthRemoteDatasourceImpl(gh<_i277.ApiClient>()));
  gh.factory<_i338.GetApprovedGyms>(
      () => _i338.GetApprovedGyms(gh<_i225.GymRepository>()));
  gh.factory<_i82.SubmitGym>(() => _i82.SubmitGym(gh<_i225.GymRepository>()));
  gh.factory<_i583.GetChatStream>(
      () => _i583.GetChatStream(gh<_i420.ChatRepository>()));
  gh.factory<_i76.SendMessage>(
      () => _i76.SendMessage(gh<_i420.ChatRepository>()));
  gh.factory<_i1027.RatingRepository>(
      () => _i874.RatingRepositoryImpl(gh<_i193.RatingRemoteDatasource>()));
  gh.factory<_i831.CreateSession>(
      () => _i831.CreateSession(gh<_i738.SessionRepository>()));
  gh.factory<_i51.GetActiveSessions>(
      () => _i51.GetActiveSessions(gh<_i738.SessionRepository>()));
  gh.factory<_i170.JoinSession>(
      () => _i170.JoinSession(gh<_i738.SessionRepository>()));
  gh.factory<_i690.MarkAttendance>(
      () => _i690.MarkAttendance(gh<_i738.SessionRepository>()));
  gh.factory<_i1070.VerificationRepository>(() =>
      _i306.VerificationRepositoryImpl(
          gh<_i552.VerificationRemoteDatasource>()));
  gh.factory<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
        gh<_i161.AuthRemoteDatasource>(),
        gh<_i535.SecureStorageService>(),
      ));
  gh.factory<_i482.GetVerificationStatus>(
      () => _i482.GetVerificationStatus(gh<_i1070.VerificationRepository>()));
  gh.factory<_i573.SubmitVerificationVideo>(
      () => _i573.SubmitVerificationVideo(gh<_i1070.VerificationRepository>()));
  gh.factory<_i694.CreateRating>(
      () => _i694.CreateRating(gh<_i1027.RatingRepository>()));
  gh.factory<_i396.GetPendingRatings>(
      () => _i396.GetPendingRatings(gh<_i1027.RatingRepository>()));
  gh.factory<_i809.GetRatingsForUser>(
      () => _i809.GetRatingsForUser(gh<_i1027.RatingRepository>()));
  gh.factory<_i778.LoginUser>(
      () => _i778.LoginUser(gh<_i787.AuthRepository>()));
  gh.factory<_i198.RegisterUser>(
      () => _i198.RegisterUser(gh<_i787.AuthRepository>()));
  gh.factory<_i152.ResendOtp>(
      () => _i152.ResendOtp(gh<_i787.AuthRepository>()));
  gh.factory<_i699.VerifySms>(
      () => _i699.VerifySms(gh<_i787.AuthRepository>()));
  return getIt;
}

class _$FirebaseModule extends _i616.FirebaseModule {}

class _$StorageModule extends _i535.StorageModule {}
