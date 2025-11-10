import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_name/features/rating/presentation/bloc/pending_rating_bloc.dart';
import 'package:your_app_name/features/rating/presentation/widgets/create_rating_dialog.dart';
// You will need a widget to display each pending rating
// import 'package:your_app_name/features/rating/presentation/widgets/pending_rating_card.dart'; 
import 'package:your_app_name/injection_container.dart'; // For sl<>()

class PendingRatingsPage extends StatelessWidget {
  const PendingRatingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PendingRatingBloc>()..add(FetchPendingRatings()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pending Ratings'),
        ),
        body: BlocConsumer<PendingRatingBloc, PendingRatingState>(
          listener: (context, state) {
            if (state is RatingSubmissionError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to submit rating: ${state.message}'),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is RatingSubmissionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Rating submitted!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is PendingRatingLoading && state is! RatingSubmissionLoading) {
              return const Center(child: CircularProgressIndicator());
            } 
            if (state is PendingRatingLoaded) {
              if (state.pendingRatings.isEmpty) {
                return const Center(
                  child: Text('You have no pending ratings.'),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PendingRatingBloc>().add(FetchPendingRatings());
                },
                child: ListView.builder(
                  itemCount: state.pendingRatings.length,
                  itemBuilder: (context, index) {
                    final pending = state.pendingRatings[index];
                    
                    // You should create a custom widget for this
                    // This is just a placeholder example:
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text('Rate ${pending.userNameToRate}'),
                        subtitle: Text('For session: ${pending.sessionTitle}'),
                        trailing: ElevatedButton(
                          child: const Text('Rate'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => CreateRatingDialog(
                                userName: pending.userNameToRate,
                                sessionTitle: pending.sessionTitle,
                                // The dialog only returns (rating, comment)
                                // The BLoC event needs the IDs, which we have here
                                onSubmitRating: (rating, comment) {
                                  context.read<PendingRatingBloc>().add(
                                    SubmitRating(
                                      sessionId: pending.sessionId,
                                      ratedUserId: pending.userIdToRate,
                                      ratingValue: rating,
                                      comment: comment,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            } 
            if (state is PendingRatingError) {
              return Center(
                child: Text(
                  'Could not load ratings: ${state.message}',
                  textAlign: TextAlign.center,
                ),
              );
            }
            return const Center(child: Text('Your ratings will appear here.'));
          },
        ),
      ),
    );
  }
}