import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';

class RatingStars extends StatefulWidget {
  final int initialRating;
  final Function(int) onRatingChanged;

  const RatingStars({
    super.key,
    this.initialRating = 0,
    required this.onRatingChanged,
  });

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  Widget _buildStar(int index) {
    // isFilled is true if the star's index is less than the current rating
    final bool isFilled = _rating >= index + 1;

    IconData icon =
        isFilled ? Icons.star_rounded : Icons.star_border_rounded;
    Color color = isFilled ? AppTheme.warningYellow : AppTheme.disabledGray;

    return IconButton(
      onPressed: () {
        setState(() {
          _rating = index + 1;
        });
        widget.onRatingChanged(_rating);
      },
      icon: Icon(
        icon,
        color: color,
        size: 36, // Make stars a good size for tapping
      ),
      splashColor: AppTheme.warningYellow.withOpacity(0.1),
      highlightColor: AppTheme.warningYellow.withOpacity(0.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) => _buildStar(index)),
    );
  }
}
