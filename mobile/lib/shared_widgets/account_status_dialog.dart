import 'package:flutter/material.dart';
import '../core/utils/icon_utils.dart';

class AccountStatusDialog extends StatelessWidget {
  final AccountStatus status;
  final String message;
  final DateTime? suspensionEndDate;
  final VoidCallback onClose;

  const AccountStatusDialog({
    super.key,
    required this.status,
    required this.message,
    this.suspensionEndDate,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          _getStatusIcon(),
          const SizedBox(width: 8),
          Text(_getStatusTitle()),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          if (suspensionEndDate != null) ...[
            const SizedBox(height: 16),
            Text(
              'Suspension ends: ${_formatDate(suspensionEndDate!)}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: onClose,
          child: const Text('Close'),
        ),
        if (status == AccountStatus.suspended)
          TextButton(
            onPressed: () {
              // Contact support
            },
            child: const Text('Contact Support'),
          ),
      ],
    );
  }

  Widget _getStatusIcon() {
    switch (status) {
      case AccountStatus.active:
        return Icon(IconUtils.successIcon, color: Colors.green);
      case AccountStatus.suspended:
        return Icon(IconUtils.errorIcon, color: Colors.red);
      case AccountStatus.probation:
        return Icon(IconUtils.warningIcon, color: Colors.orange);
    }
  }

  String _getStatusTitle() {
    switch (status) {
      case AccountStatus.active:
        return 'Account Active';
      case AccountStatus.suspended:
        return 'Account Suspended';
      case AccountStatus.probation:
        return 'Verification Pending';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

enum AccountStatus {
  active,
  suspended,
  probation,
}