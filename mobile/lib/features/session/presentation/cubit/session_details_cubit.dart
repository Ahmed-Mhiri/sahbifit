import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/session/data/models/session_participant_model.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/usecases/get_active_sessions.dart';
import 'package:sahbifit/features/session/domain/usecases/join_session.dart';

part 'session_details_cubit.freezed.dart';
part 'session_details_state.dart';

@injectable
class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  final GetActiveSessions _getActiveSessions;
  final JoinSession _joinSession;
  final FirebaseFirestore _firestore;
  final AppBloc _appBloc;

  StreamSubscription? _participantsSubscription;

  SessionDetailsCubit(
    this._getActiveSessions,
    this._joinSession,
    this._firestore,
    this._appBloc,
  ) : super(const SessionDetailsState.initial());

  Future<void> fetchSessionDetails(String sessionId) async {
    emit(const SessionDetailsState.loading());
    try {
      // 1. Get current user ID from AppBloc
      final currentUserId = _appBloc.state.mapOrNull(
        authenticated: (s) => s.user.userId,
      );
      if (currentUserId == null) {
        emit(const SessionDetailsState.error('Not authenticated'));
        return;
      }

      // 2. Fetch base session data (Workaround: fetching all and filtering)
      // A dedicated GetSessionById use case would be better.
      final sessions = await _getActiveSessions(const GetActiveSessionsParams());
      final session = sessions.firstWhere((s) => s.sessionId == sessionId);

      // 3. Listen for participants from Firestore
      _participantsSubscription?.cancel();
      _participantsSubscription = _firestore
          .collection('sessions')
          .doc(sessionId)
          .collection('participants')
          .snapshots()
          .listen((snapshot) {
        final participants = snapshot.docs
            .map((doc) => SessionParticipantModel.fromJson(doc.data()).toEntity())
            .toList();

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
          // We'll reset loading state when the stream updates.
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
