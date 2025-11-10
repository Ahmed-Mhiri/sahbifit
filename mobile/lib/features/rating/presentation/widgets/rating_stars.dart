import 'package:flutter/material.dart';
import '../../../../../core/utils/icon_utils.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final Function(int) onRatingChanged;
  final double size;
  final bool interactive;

  const RatingStars({
    super.key,
    required this.rating,
    required this.onRatingChanged,
    this.size = 24,
    this.interactive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starRating = index + 1;
        return GestureDetector(
          onTap: interactive ? () => onRatingChanged(starRating) : null,
          child: Icon(
            starRating <= rating
                ? IconUtils.starIcon
                : IconUtils.starOutlineIcon,
            color: Colors.amber,
            size: size,
          ),
        );
      }),
    );
  }
}

class StaticRatingStars extends StatelessWidget {
  final double rating;
  final double size;

  const StaticRatingStars({
    super.key,
    required this.rating,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(IconUtils.starIcon, color: Colors.amber, size: size);
        } else if (index == rating.floor() && rating % 1 != 0) {
          return Icon(IconUtils.starHalfIcon, color: Colors.amber, size: size);
        } else {
          return Icon(IconUtils.starOutlineIcon, color: Colors.amber, size: size);
        }
      }),
    );
  }
}