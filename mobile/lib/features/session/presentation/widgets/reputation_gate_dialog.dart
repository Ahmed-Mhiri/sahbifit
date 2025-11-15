import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_router.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';
import 'package:go_router/go_router.dart';
/// Shows an info bottom sheet explaining the "Reputation Gate"
/// for 1-on-1 sessions (Feature 3).
void showReputationGateDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => InfoBottomSheet(
      title: 'Unlock 1-on-1 Sessions',
      message:
          'To ensure community safety and reliability, you must attend at least one successful Group Session before you can post or join 1-on-1 sessions.',
      buttonText: 'Find a Group Session',
      onButtonPressed: () {
        Navigator.of(ctx).pop();
        // Navigate back to the feed, which defaults to Group sessions
        context.go('/session-feed');
      },
    ),
  );
}
