import 'package:flutter/material.dart';
import '../../../../../shared_widgets/primary_button.dart';
import 'rating_stars.dart';

class CreateRatingDialog extends StatefulWidget {
  final String userName;
  final String sessionTitle;
  final Function(int, String) onSubmitRating;

  const CreateRatingDialog({
    super.key,
    required this.userName,
    required this.sessionTitle,
    required this.onSubmitRating,
  });

  @override
  State<CreateRatingDialog> createState() => _CreateRatingDialogState();
}

class _CreateRatingDialogState extends State<CreateRatingDialog> {
  int _selectedRating = 0;
  final TextEditingController _commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate ${widget.userName}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                widget.sessionTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Center(
                child: RatingStars(
                  rating: _selectedRating,
                  onRatingChanged: (rating) {
                    setState(() {
                      _selectedRating = rating;
                    });
                  },
                  size: 40,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _commentController,
                decoration: const InputDecoration(
                  labelText: 'Optional Comment',
                  hintText: 'Share your experience...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (_selectedRating == 0) {
                    return 'Please select a rating';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      text: 'Submit Rating',
                      onPressed: _submitRating,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitRating() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmitRating(_selectedRating, _commentController.text.trim());
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}