import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/utils/icon_utils.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';

class SessionTypeToggle extends StatelessWidget {
  final SessionType selectedType;
  final ValueChanged<SessionType> onTypeChanged;

  const SessionTypeToggle({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ToggleButton(
            label: 'Group Session',
            icon: getSessionTypeIcon(SessionType.group),
            isSelected: selectedType == SessionType.group,
            onTap: () => onTypeChanged(SessionType.group),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ToggleButton(
            label: '1-on-1 Session',
            icon: getSessionTypeIcon(SessionType.oneOnOne),
            isSelected: selectedType == SessionType.oneOnOne,
            onTap: () => onTypeChanged(SessionType.oneOnOne),
          ),
        ),
      ],
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToggleButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppTheme.primaryRed : AppTheme.darkGray;
    final bgColor =
        isSelected ? AppTheme.primaryRed.withOpacity(0.1) : AppTheme.lightGray;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.primaryRed : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
