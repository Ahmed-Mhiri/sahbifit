import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/services/secure_storage_service.dart';
import 'package:sahbifit/features/user/domain/usecases/get_my_profile.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final SecureStorageService _storageService;
  final GetMyProfile _getMyProfile; // <-- ADDED

  AppBloc(this._storageService, this._getMyProfile) // <-- UPDATED CONSTRUCTOR
      : super(const AppState.initial()) {
    on<_CheckAuthStatus>(_onCheckAuthStatus);
    on<_LogoutRequested>(_onLogoutRequested);
  }

  /// Handles the [CheckAuthStatus] event.
  /// Reads the token from secure storage and emits [Authenticated] or
  /// [Unauthenticated] accordingly.
  Future<void> _onCheckAuthStatus(
    _CheckAuthStatus event,
    Emitter<AppState> emit,
  ) async {
    // You could emit a loading state here if needed
    // emit(const AppState.loading());
    try {
      final token = await _storageService.readToken();
      if (token != null) {
        // --- THIS IS THE NEW LOGIC ---
        final user = await _getMyProfile(NoParams());
        emit(AppState.authenticated(user));
        // -----------------------------
      } else {
        emit(const AppState.unauthenticated());
      }
    } catch (e) {
      // If getting profile fails, log them out
      emit(const AppState.unauthenticated());
    }
  }

  /// Handles the [LogoutRequested] event.
  /// Deletes the token from storage and emits [Unauthenticated].
  Future<void> _onLogoutRequested(
    _LogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    try {
      await _storageService.deleteToken();
    } catch (e) {
      // Handle potential storage error, though we still want to log out
      print('Error deleting token: $e');
    }
    emit(const AppState.unauthenticated());
  }
}