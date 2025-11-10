import 'package:flutter/material.dart';
import '../../../../../shared_widgets/theme_components.dart';
import '../../../../../core/utils/icon_utils.dart';

class ProbationModeBanner extends StatelessWidget {
  final VoidCallback onVerifyNow;
  final VoidCallback onViewAmbassadorSessions;

  const ProbationModeBanner({
    super.key,
    required this.onVerifyNow,
    required this.onViewAmbassadorSessions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(IconUtils.warningIcon, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                'Verification in Progress',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.orange[800],
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Your profile verification is being processed. This usually takes less than 12 hours. '
            'While you wait, you can join sessions posted by verified Ambassadors.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.orange[800],
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onViewAmbassadorSessions,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    side: const BorderSide(color: Colors.orange),
                  ),
                  child: const Text('View Ambassador Sessions'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: onVerifyNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Check Status'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}