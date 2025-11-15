import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/utils/validators.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';

class ReportForm extends StatefulWidget {
  final bool isLoading;
  final Function(String reason) onSubmit;

  const ReportForm({
    super.key,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Hide keyboard
    FocusScope.of(context).unfocus();

    // Validate the form
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSubmit(_reasonController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        children: [
          Text(
            'Please describe what happened',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppTheme.elementSpacing),
          Text(
            'Provide as much detail as possible so our team can review the situation. Your report is confidential.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppTheme.sectionSpacing),
          PrimaryTextField(
            controller: _reasonController,
            label: 'Reason for Report',
            hintText: 'Describe the issue...',
            maxLines: 8,
            maxLength: 500, // Limit the report length
            validator: (value) => validateNotEmpty(value, 'Reason'),
          ),
          const SizedBox(height: AppTheme.sectionSpacing),
          PrimaryButton(
            text: 'Submit Report',
            isLoading: widget.isLoading,
            onPressed: _submitForm,
          ),
        ],
      ),
    );
  }
}
