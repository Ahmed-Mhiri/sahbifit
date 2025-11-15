import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/features/rating/domain/entities/pending_rating.dart';
import 'package:sahbifit/features/rating/presentation/bloc/pending_rating_bloc.dart';
import 'package:sahbifit/features/rating/presentation/widgets/rating_stars.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';

class CreateRatingDialog extends StatefulWidget {
  final PendingRating pendingRating;
  final Function(int rating, String? comment) onSubmit;

  const CreateRatingDialog({
    super.key,
    required this.pendingRating,
    required this.onSubmit,
  });

  @override
  State<CreateRatingDialog> createState() => _CreateRatingDialogState();
}

class _CreateRatingDialogState extends State<CreateRatingDialog> {
  int _rating = 0;
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a rating (1-5 stars).'),
          backgroundColor: AppTheme.primaryRed,
        ),
      );
      return;
    }

    widget.onSubmit(_rating, _commentController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    // Listen to the BLoC to know if we are in a loading state
    final bool isLoading = context
        .watch<PendingRatingBloc>()
        .state // <-- Fix applied here
        .maybeWhen(loading: () => true, orElse: () => false);

    return SingleChildScrollView(
      // Padding to avoid the keyboard
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        decoration: const BoxDecoration(
          color: AppTheme.cleanWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rate ${widget.pendingRating.userNameToRate}',
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'For session: ${widget.pendingRating.sessionTitle}',
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppTheme.disabledGray,
              ),
            ),
            const SizedBox(height: 16),
            RatingStars(
              onRatingChanged: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 24),
            PrimaryTextField(
              label: 'Add a comment (Optional)',
              controller: _commentController,
              maxLines: 3,
              hintText: 'How was your session with this user?',
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Submit Rating',
              onPressed: _submit,
              isLoading: isLoading,
              // Disable button if no rating is selected or if loading
              enabled: _rating > 0 && !isLoading,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
