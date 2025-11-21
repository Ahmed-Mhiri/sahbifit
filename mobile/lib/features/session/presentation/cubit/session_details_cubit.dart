// FILE: lib/features/session/presentation/cubit/session_details_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/usecases/get_participants_stream.dart';
import 'package:sahbifit/features/session/domain/usecases/get_session_by_id.dart';
import 'package:sahbifit/features/session/domain/usecases/join_session.dart';
import 'package:sahbifit/features/session/domain/usecases/leave_session.dart'; // <--- ADDED IMPORT

part 'session_details_cubit.freezed.dart';
part 'session_details_state.dart';

@injectable
class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  final GetSessionById _getSessionById;
  final JoinSession _joinSession;
  final GetSessionParticipants _getSessionParticipants;
  final LeaveSession _leaveSession; // <--- ADDED

  String? _currentUserId;

  SessionDetailsCubit(
    this._getSessionById,
    this._joinSession,
    this._getSessionParticipants,
    this._leaveSession, // <--- ADDED
  ) : super(const SessionDetailsState.initial());

  Future<void> fetchSessionDetails(String sessionId, String currentUserId) async {
    _currentUserId = currentUserId;
    emit(const SessionDetailsState.loading());

    try {
      final session = await _getSessionById(GetSessionByIdParams(sessionId: sessionId));

      final participants = await _getSessionParticipants(
        GetSessionParticipantsParams(sessionId: sessionId),
      );

      // Logic check: Am I in the list AND active (not left/no_show)?
      // Backend 'leaveSession' might soft-delete (set status to left) or hard-delete.
      // We check if user is in the list. 
      final isJoined = participants.any((p) => p.userId == currentUserId);

      emit(SessionDetailsState.loaded(
        session: session,
        participants: participants,
        isJoined: isJoined,
      ));
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

          final updatedParticipants = await _getSessionParticipants(
              GetSessionParticipantsParams(sessionId: sessionId)
          );

          emit(s.copyWith(
            isJoinLoading: false,
            isJoined: true,
            participants: updatedParticipants,
          ));
        } on ServerFailure catch (e) {
          emit(s.copyWith(
            isJoinLoading: false,
            errorMessage: e.message,
          ));
          await Future.delayed(const Duration(seconds: 3));
          state.mapOrNull(loaded: (currentState) {
            emit(currentState.copyWith(errorMessage: null));
          });
        }
      },
      orElse: () {},
    );
  }

  // --- ADDED METHOD ---
  Future<void> leaveSession(String sessionId) async {
    state.maybeMap(
      loaded: (s) async {
        emit(s.copyWith(isLeaveLoading: true)); // Set loading flag
        try {
          await _leaveSession(LeaveSessionParams(sessionId: sessionId));

          // Refresh list to reflect removal
          final updatedParticipants = await _getSessionParticipants(
              GetSessionParticipantsParams(sessionId: sessionId)
          );

          // Check if we are still effectively joined (depends on backend hard vs soft delete)
          // If backend hard deletes: user won't be in list.
          // If backend soft deletes (status=left): user is in list, logic in UI handles "left".
          // For 'isJoined' boolean, we usually mean "Is active participant".
          // Let's re-evaluate isJoined based on the new list.
          // NOTE: Backend logic said: hard delete if > 1hr, soft delete (status=no_show/left) if < 1hr.
          
          // If the user is GONE from the list, isJoined = false.
          // If the user is PRESENT but status != joined/attended, isJoined = false.
          final isStillInList = updatedParticipants.any((p) => p.userId == _currentUserId);
          
          emit(s.copyWith(
            isLeaveLoading: false,
            isJoined: isStillInList, // Simple check, UI handles status display
            participants: updatedParticipants,
          ));
        } on ServerFailure catch (e) {
          emit(s.copyWith(
            isLeaveLoading: false,
            errorMessage: e.message,
          ));
          await Future.delayed(const Duration(seconds: 3));
          state.mapOrNull(loaded: (currentState) {
            emit(currentState.copyWith(errorMessage: null));
          });
        }
      },
      orElse: () {},
    );
  }
  // -------------------
}