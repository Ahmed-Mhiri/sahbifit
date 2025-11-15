import 'package:flutter/material.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';

/// Shows an info bottom sheet explaining why a feature is locked
/// due to "Probationary Mode" (Feature 2).
void showProbationLockedDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => InfoBottomSheet(
      title: 'Verification Pending',
      message:
          'Your profile is under review by our team. This usually takes less than 12 hours.\n\nWhile you wait, you can join sessions hosted by our verified Ambassadors.',
      buttonText: 'See Ambassador Sessions',
      onButtonPressed: () {
        Navigator.of(ctx).pop();
        // Here you would typically filter the feed.
        // For now, we just close the dialog.
        // Or navigate to a specific "ambassador" tab if it existed.
      },
    ),
  );
}