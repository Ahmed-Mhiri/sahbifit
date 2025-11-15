import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/shared/widgets/banners/probationary_banner.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';

/// This widget wraps the shared [ProbationaryBanner] and provides
/// the specific logic for the verification "pending review" state.
class ProbationModeBanner extends StatelessWidget {
  const ProbationModeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ProbationaryBanner(
        onLearnMore: () {
          // Show a dialog explaining what "Probationary Mode" is
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => InfoBottomSheet(
              title: 'Verification in Progress',
              message:
                  'Your video is under review by our team (usually < 12 hours). \n\nWhile you wait, you can browse all sessions and join any "Ambassador Session". Other sessions will be unlocked once you are verified.',
              buttonText: 'See My Status',
              onButtonPressed: () {
                Navigator.of(context).pop();
                // Navigate to profile page using GoRouter
                context.push('/profile');
              },
            ),
          );
        },
      ),
    );
  }
}