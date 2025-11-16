import 'dart:async';
import 'package:bloc/bloc.dart';
// --- REMOVED ---
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
// REMOVED: import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/errors/failure.dart';
// --- REMOVED ---
// import 'package:sahbifit/features/session/data/models/session_participant_model.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
// --- ADDED ---
import 'package:sahbifit/features/session/domain/usecases/get_participants_stream.dart';
import 'package:sahbifit/features/session/domain/usecases/get_session_by_id.dart';
import 'package:sahbifit/features/session/domain/usecases/join_session.dart';
// --- ADDED PROFILE BLOC IMPORTS ---
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
// ---------------------------------

part 'session_details_cubit.freezed.dart';
part 'session_details_state.dart';

@injectable
class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  final GetSessionById _getSessionById;
  final JoinSession _joinSession;
  // --- REMOVED ---
  // final FirebaseFirestore _firestore;
  // --- ADDED ---
  final GetParticipantsStream _getParticipantsStream;
  // MODIFIED: final AppBloc _appBloc;
  final ProfileBloc _profileBloc; // <-- CHANGED

  StreamSubscription? _participantsSubscription;

  SessionDetailsCubit(
    this._getSessionById,
    this._joinSession,
    // --- REMOVED ---
    // this._firestore,
    // --- ADDED ---
    this._getParticipantsStream,
    this._profileBloc, // <-- CHANGED
  ) : super(const SessionDetailsState.initial());

  Future<void> fetchSessionDetails(String sessionId) async {
    emit(const SessionDetailsState.loading());
    try {
      // 1. Get current user ID from ProfileBloc
      // --- MODIFIED LOGIC ---
      final profileState = _profileBloc.state;
      final currentUserId = profileState.maybeMap(
        loaded: (s) => s.user.userId,
        orElse: () => null,
      );
      // ----------------------

      if (currentUserId == null) {
        // Updated error message to be more accurate
        emit(const SessionDetailsState.error('Profile not loaded'));
        return;
      }

      // 2. Fetch base session data
      final session =
          await _getSessionById(GetSessionByIdParams(sessionId: sessionId));
          
      // --- MODIFIED: Use GetParticipantsStream use case ---
      // 3. Listen for participants
      _participantsSubscription?.cancel();
      _participantsSubscription = _getParticipantsStream(
        GetParticipantsStreamParams(sessionId: sessionId),
      ).listen((participants) {
        final isJoined = participants.any((p) => p.userId == currentUserId);

        emit(SessionDetailsState.loaded(
          session: session,
          participants: participants,
          isJoined: isJoined,
        ));
      }, onError: (e) {
        emit(SessionDetailsState.error(
            'Failed to load participants: ${e.toString()}'));
      });
    } on ServerFailure catch (e) {
      emit(SessionDetailsState.error(e.message));
    } catch (e) {
      emit(SessionDetailsState.error(e.toString()));
    }
  }

  Future<void> joinSession(String sessionId) async {
    state.maybeMap(
      loaded: (s) async {
        emit(s.copyWith(isJoinLoading: true));
        try {
          await _joinSession(JoinSessionParams(sessionId: sessionId));
          // The stream listener will automatically update the state,
          // so we just need to wait for it.
          // We'll reset
          // loading state when the stream updates.
        } on ServerFailure catch (e) {
          // Emit an error but keep the loaded state
          emit(s.copyWith(
            isJoinLoading: false,
            errorMessage: e.message,
          ));
          // Remove the error message after a delay

          await Future.delayed(const Duration(seconds: 3));
          emit(s.copyWith(errorMessage: null));
        }
      },
      orElse: () {
        // Not in a loaded state, do nothing
      },
    );
  }

  @override
  Future<void> close() {
    _participantsSubscription?.cancel();
    return super.close();
  }
}