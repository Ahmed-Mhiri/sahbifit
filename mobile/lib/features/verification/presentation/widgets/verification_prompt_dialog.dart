import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';

/// A helper class to show a bottom sheet that prompts the
/// user to start the verification process.
class VerificationPromptDialog {
  /// Shows the modal bottom sheet.
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext sheetContext) {
        return InfoBottomSheet(
          title: 'Verification Required',
          message:
              'To join or create sessions, please complete a quick 5-second video verification. \n\nThis helps us keep the SahbiFit community safe and authentic.',
          buttonText: 'Start Verification',
          onButtonPressed: () {
            // Close the bottom sheet
            Navigator.of(sheetContext).pop();
            // Navigate to the verification page using GoRouter
            context.push('/submit-verification');
          },
        );
      },
    );
  }
}