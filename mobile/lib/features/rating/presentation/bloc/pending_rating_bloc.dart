import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/rating/domain/entities/pending_rating.dart';
import 'package:sahbifit/features/rating/domain/usecases/create_rating.dart';
import 'package:sahbifit/features/rating/domain/usecases/get_pending_ratings.dart';

part 'pending_rating_bloc.freezed.dart';
part 'pending_rating_event.dart';
part 'pending_rating_state.dart';

@injectable
class PendingRatingBloc extends Bloc<PendingRatingEvent, PendingRatingState> {
  final GetPendingRatings _getPendingRatings;
  final CreateRating _createRating;

  PendingRatingBloc(
    this._getPendingRatings,
    this._createRating,
  ) : super(const PendingRatingState.initial()) {
    on<_FetchList>(_onFetchList);
    on<_SubmitRating>(_onSubmitRating);
  }

  Future<void> _onFetchList(
    _FetchList event,
    Emitter<PendingRatingState> emit,
  ) async {
    emit(const PendingRatingState.loading());
    try {
      final ratings = await _getPendingRatings(NoParams());
      emit(PendingRatingState.loaded(pendingRatings: ratings));
    } on ServerFailure catch (e) {
      emit(PendingRatingState.error(e.message));
    } catch (e) {
      emit(PendingRatingState.error(e.toString()));
    }
  }

  Future<void> _onSubmitRating(
    _SubmitRating event,
    Emitter<PendingRatingState> emit,
  ) async {
    // Keep the old state's list while loading
    // Or just emit a generic loading state
    emit(const PendingRatingState.loading());

    try {
      final params = CreateRatingParams(
        sessionId: event.sessionId,
        ratedUserId: event.ratedUserId,
        ratingValue: event.ratingValue,
        comment: event.comment,
      );
      await _createRating(params);

      // Emit success and then immediately refresh the list
      emit(const PendingRatingState.submissionSuccess());
      add(const PendingRatingEvent.fetchList());
    } on ServerFailure catch (e) {
      emit(PendingRatingState.error(e.message));
    } catch (e) {
      emit(PendingRatingState.error(e.toString()));
    }
  }
}
