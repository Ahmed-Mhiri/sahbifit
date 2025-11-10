// lib/shared_widgets/empty_state.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/app_assets.dart';

class EmptyStateWidget extends StatelessWidget {
  final EmptyStateConfig config;
  final VoidCallback? onAction;
  final double illustrationSize;

  const EmptyStateWidget({
    super.key,
    required this.config,
    this.onAction,
    this.illustrationSize = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              config.illustration,
              width: illustrationSize,
              height: illustrationSize,
            ),
            const SizedBox(height: 24),
            Text(
              config.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              config.description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (onAction != null)
              ElevatedButton(
                onPressed: onAction,
                child: Text(config.actionText),
              ),
          ],
        ),
      ),
    );
  }
}