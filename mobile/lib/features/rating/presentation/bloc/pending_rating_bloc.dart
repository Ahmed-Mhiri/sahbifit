import 'package:bloc/bloc.dart';
import 'package:your_app_name/core/usecase/usecase.dart';
import 'package:your_app_name/features/rating/domain/usecases/create_rating.dart';
import 'package:your_app_name/features/rating/domain/usecases/get_pending_ratings.dart';
import 'package:your_app_name/features/rating/presentation/bloc/pending_rating_event.dart';
import 'package:your_app_name/features/rating/presentation/bloc/pending_rating_state.dart';

class PendingRatingBloc extends Bloc<PendingRatingEvent, PendingRatingState> {
  final GetPendingRatings getPendingRatings;
  final CreateRating createRating;

  PendingRatingBloc({
    required this.getPendingRatings,
    required this.createRating,
  }) : super(PendingRatingInitial()) {
    on<FetchPendingRatings>(_onFetchPendingRatings);
    on<SubmitRating>(_onSubmitRating);
  }

  Future<void> _onFetchPendingRatings(
    FetchPendingRatings event,
    Emitter<PendingRatingState> emit,
  ) async {
    emit(PendingRatingLoading());
    final failureOrRatings = await getPendingRatings(NoParams());
    emit(
      failureOrRatings.fold(
        (failure) => PendingRatingError(failure.message),
        (ratings) => PendingRatingLoaded(ratings),
      ),
    );
  }

  Future<void> _onSubmitRating(
    SubmitRating event,
    Emitter<PendingRatingState> emit,
  ) async {
    // Get the current list of ratings to update it after success
    final currentState = state;
    List<PendingRating> currentRatings = [];
    if (currentState is PendingRatingLoaded) {
      currentRatings = currentState.pendingRatings;
    }

    emit(RatingSubmissionLoading());

    final params = CreateRatingParams(
      sessionId: event.sessionId,
      ratedUserId: event.ratedUserId,
      ratingValue: event.ratingValue,
      comment: event.comment,
    );

    final failureOrSuccess = await createRating(params);

    emit(
      failureOrSuccess.fold(
        (failure) {
          // On failure, return to the loaded state with the original list
          emit(RatingSubmissionError(failure.message));
          emit(PendingRatingLoaded(currentRatings));
        },
        (newRating) {
          // On success, remove the just-rated item from the list and emit success
          final updatedRatings = currentRatings
              .where((pr) =>
                  !(pr.sessionId == event.sessionId &&
                      pr.userIdToRate == event.ratedUserId))
              .toList();
          emit(RatingSubmissionSuccess());
          emit(PendingRatingLoaded(updatedRatings));
        },
      ),
    );
  }
}