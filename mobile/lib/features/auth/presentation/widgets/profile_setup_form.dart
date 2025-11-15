import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/utils/date_formatters.dart';
import 'package:sahbifit/core/utils/validators.dart';
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/presentation/cubit/gym_list_cubit.dart';
import 'package:sahbifit/features/tag/domain/entities/tag.dart';
import 'package:sahbifit/features/tag/presentation/cubit/tags_cubit.dart';
import 'package:sahbifit/shared/widgets/badges/custom_badges.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class ProfileSetupForm extends StatefulWidget {
  final Function({
    required String firstName,
    required String dateOfBirth,
    required String primaryGymId,
    required List<int> goalTagIds,
    required List<int> scheduleTagIds,
    String? profilePhotoUrl,
  }) onRegister;

  const ProfileSetupForm({super.key, required this.onRegister});

  @override
  State<ProfileSetupForm> createState() => _ProfileSetupFormState();
}

class _ProfileSetupFormState extends State<ProfileSetupForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _dobController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedGymId;
  final List<int> _selectedGoalIds = [];
  final List<int> _selectedScheduleIds = [];

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<GymListCubit>().fetchApprovedGyms();
    context.read<TagsCubit>().loadAllTags();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      helpText: 'Select Your Date of Birth',
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = formatToYyyyMmDd(picked); // Format for backend
      });
    }
  }

  void _onRegisterPressed() {
    if (_formKey.currentState!.validate()) {
      if (_selectedGymId == null) {
        _showError('Please select your primary gym.');
        return;
      }
      if (_selectedGoalIds.isEmpty) {
        _showError('Please select at least one goal.');
        return;
      }
      if (_selectedScheduleIds.isEmpty) {
        _showError('Please select your schedule.');
        return;
      }

      widget.onRegister(
        firstName: _firstNameController.text.trim(),
        dateOfBirth: _dobController.text,
        primaryGymId: _selectedGymId!,
        goalTagIds: _selectedGoalIds,
        scheduleTagIds: _selectedScheduleIds,
        // profilePhotoUrl: null, // TODO: Add profile photo upload logic
      );
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.primaryRed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tell us about you',
              style: context.textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.sectionSpacing),
            PrimaryTextField(
              label: 'First Name',
              hintText: 'e.g. Ahmed',
              controller: _firstNameController,
              validator: (value) => validateNotEmpty(value, 'First Name'),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            PrimaryTextField(
              label: 'Date of Birth',
              hintText: 'Select your birthday',
              controller: _dobController,
              readOnly: true,
              onTap: () => _pickDate(context),
              suffixIcon: const Icon(Icons.calendar_today),
              validator: (value) => validateNotEmpty(value, 'Date of Birth'),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildGymSelector(),
            const SizedBox(height: AppTheme.sectionSpacing),
            _buildTagSelector(),
            const SizedBox(height: AppTheme.sectionSpacing),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );
                return PrimaryButton(
                  text: 'Create Account',
                  onPressed: _onRegisterPressed,
                  isLoading: isLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGymSelector() {
    return BlocBuilder<GymListCubit, GymListState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingIndicator(),
          error: (message) => Text('Error: $message'), // <-- CORRECTED
          loaded: (gyms) { // <-- CORRECTED
            return DropdownButtonFormField<String>(
              value: _selectedGymId,
              hint: const Text('Select your primary gym'),
              decoration: const InputDecoration(
                labelText: 'Primary Gym',
              ),
              items: gyms.map((Gym gym) {
                return DropdownMenuItem<String>(
                  value: gym.gymId,
                  child: Text(gym.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGymId = newValue;
                });
              },
              validator: (value) =>
                  value == null ? 'Please select a gym.' : null,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildTagSelector() {
    return BlocBuilder<TagsCubit, TagsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingIndicator(),
          error: (message) => Text('Error: $message'), // <-- CORRECTED
          loaded: (goalTags, scheduleTags) { // <-- CORRECTED
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTagSection(
                  'Your Goals',
                  goalTags,
                  _selectedGoalIds,
                ),
                const SizedBox(height: AppTheme.defaultPadding),
                _buildTagSection(
                  'Your Schedule',
                  scheduleTags,
                  _selectedScheduleIds,
                ),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildTagSection(String title, List<Tag> tags, List<int> selectedIds) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: tags.map((tag) {
            final isSelected = selectedIds.contains(tag.tagId);
            return TagChip(
              label: tag.tagName,
              selected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedIds.remove(tag.tagId);
                  } else {
                    selectedIds.add(tag.tagId);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
