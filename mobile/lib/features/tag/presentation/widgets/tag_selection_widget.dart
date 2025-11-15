import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/features/tag/domain/entities/tag.dart';
import 'package:sahbifit/shared/widgets/badges/custom_badges.dart';

/// A reusable widget to display a list of tags as selectable chips.
///
/// This widget is used in the profile setup (for goals/schedule) and
/// when creating a session.
class TagSelectionWidget extends StatelessWidget {
  /// The title displayed above the chips (e.g., "Fitness Goals").
  final String title;

  /// The complete list of tags to display for this section.
  final List<Tag> allTags;

  /// The set of tags that are currently selected.
  final Set<Tag> selectedTags;

  /// Callback function triggered when any tag chip is tapped.
  /// The parent widget is responsible for updating the `selectedTags` set.
  final Function(Tag tag) onTagSelected;

  const TagSelectionWidget({
    super.key,
    required this.title,
    required this.allTags,
    required this.selectedTags,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title for the section
        Text(
          title,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: AppTheme.elementSpacing * 1.5),

        // Wrap for the chips
        Wrap(
          spacing: AppTheme.elementSpacing, // Horizontal space between chips
          runSpacing: AppTheme.elementSpacing, // Vertical space between lines
          children: allTags.map((tag) {
            final bool isSelected = selectedTags.contains(tag);
            return TagChip(
              label: tag.tagName,
              selected: isSelected,
              onTap: () => onTagSelected(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}
