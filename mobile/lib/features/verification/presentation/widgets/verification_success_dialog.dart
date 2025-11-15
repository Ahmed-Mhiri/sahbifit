// C:\Users\Ahmed\Desktop\sahbifit\mobile\lib\features\verification\presentation\widgets\verification_success_dialog.dart

import 'package:flutter/material.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';

/// A helper class to show a bottom sheet that confirms
/// the user's video was submitted successfully.
class VerificationSuccessDialog {
  /// Shows the modal bottom sheet.
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext sheetContext) {
        return InfoBottomSheet(
          title: 'Video Submitted!',
          message:
              'Thank you! Your video is now being reviewed by our team. This usually takes less than 12 hours. \n\nYou are now in "Probationary Mode" and can join "Ambassador Sessions" while you wait.',
          buttonText: 'Got It!',
          onButtonPressed: () {
            // Close the bottom sheet
            Navigator.of(sheetContext).pop();
          },
        );
      },
    );
  }
}
