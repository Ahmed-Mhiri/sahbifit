import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/core/utils/validators.dart';
import 'package:sahbifit/features/gym/presentation/cubit/submit_gym_cubit.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:go_router/go_router.dart'; // ADD THIS IMPORT



class SubmitGymPage extends StatefulWidget {
  const SubmitGymPage({super.key});

  @override
  State<SubmitGymPage> createState() => _SubmitGymPageState();
}

class _SubmitGymPageState extends State<SubmitGymPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<SubmitGymCubit>().submitGym(
            _nameController.text,
            _addressController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubmitGymCubit>(),
      child: BlocConsumer<SubmitGymCubit, SubmitGymState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Gym submitted successfully for review!'),
                  backgroundColor: AppTheme.successGreen,
                ),
              );
              context.pop();
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppTheme.primaryRed,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Scaffold(
            appBar: const CustomAppBar(title: 'Submit a New Gym'),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppTheme.defaultPadding),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Don\'t see your gym? Add it to our list. It will be reviewed by our team.',
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppTheme.sectionSpacing),
                        PrimaryTextField(
                          label: 'Gym Name',
                          hintText: 'e.g., "California Gym"',
                          controller: _nameController,
                          validator: (val) => validateNotEmpty(val, 'Gym Name'),
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: AppTheme.defaultPadding),
                        PrimaryTextField(
                          label: 'Address',
                          hintText: 'e.g., "Lac 1, Tunis"',
                          controller: _addressController,
                          validator: (val) => validateNotEmpty(val, 'Address'),
                          enabled: !isLoading,
                        ),
                        const Spacer(),
                        PrimaryButton(
                          text: 'Submit for Review',
                          onPressed: () => _onSubmit(context),
                          isLoading: isLoading,
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: AppTheme.defaultPadding),
                      ],
                    ),
                  ),
                ),
                if (isLoading)
                  const Center(child: LoadingIndicator(message: 'Submitting...')),
              ],
            ),
          );
        },
      ),
    );
  }
}
