import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/rating/domain/entities/pending_rating.dart';
import 'package:sahbifit/features/rating/presentation/bloc/pending_rating_bloc.dart';
import 'package:sahbifit/features/rating/presentation/widgets/create_rating_dialog.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';


class PendingRatingsPage extends StatelessWidget {
  const PendingRatingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PendingRatingBloc>()..add(const PendingRatingEvent.fetchList()),
      child: const PendingRatingsView(),
    );
  }
}

class PendingRatingsView extends StatelessWidget {
  const PendingRatingsView({super.key});

  void _showRatingDialog(BuildContext context, PendingRating rating) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to resize for the keyboard
      backgroundColor: Colors.transparent,
      builder: (dialogContext) {
        // Provide the BLoC from the page's context to the dialog
        return BlocProvider.value(
          value: context.read<PendingRatingBloc>(),
          child: CreateRatingDialog(
            pendingRating: rating,
            onSubmit: (ratingValue, comment) {
              // The dialog calls this, and we add the event to the BLoC
              context.read<PendingRatingBloc>().add(
                    PendingRatingEvent.submitRating(
                      sessionId: rating.sessionId,
                      ratedUserId: rating.userIdToRate,
                      ratingValue: ratingValue,
                      comment: comment,
                    ),
                  );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Pending Ratings'),
      body: BlocConsumer<PendingRatingBloc, PendingRatingState>(
        listener: (context, state) {
          state.maybeWhen(
            submissionSuccess: () {
              // On success, close the bottom sheet
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Rating submitted successfully!'),
                  backgroundColor: AppTheme.successGreen,
                ),
              );
            },
            error: (message) {
              // Show error messages in a snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppTheme.primaryRed,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingIndicator(),
            // Show loading for both list fetching and rating submission
            loading: () => const LoadingIndicator(),
            submissionSuccess: () =>
                const LoadingIndicator(), // Transient state
            error: (message) => ErrorStateWidget(
              message: message,
              buttonText: 'Retry',
              onRetry: () {
                context
                    .read<PendingRatingBloc>()
                    .add(const PendingRatingEvent.fetchList());
              },
            ),
            loaded: (pendingRatings) {
              if (pendingRatings.isEmpty) {
                return const Center(
                  child: EmptyStateWidget(
                    icon: Icons.rate_review_outlined,
                    title: 'All Caught Up!',
                    message: 'You have no pending ratings to submit.',
                  ),
                );
              }

              return ListView.separated(
                itemCount: pendingRatings.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1, indent: 16, endIndent: 16),
                itemBuilder: (context, index) {
                  final rating = pendingRatings[index];
                  return _PendingRatingCard(
                    rating: rating,
                    onTap: () => _showRatingDialog(context, rating),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

/// A local widget to display a single pending rating item in the list.
class _PendingRatingCard extends StatelessWidget {
  final PendingRating rating;
  final VoidCallback onTap;

  const _PendingRatingCard({
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person_outline, color: AppTheme.primaryRed),
      title: Text(
        'Rate ${rating.userNameToRate}',
        style: context.textTheme.titleMedium,
      ),
      subtitle: Text(
        'For session: ${rating.sessionTitle}',
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppTheme.disabledGray,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: onTap,
    );
  }
}
