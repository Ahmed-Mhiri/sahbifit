// BEGIN: /mobile/lib/features/auth/presentation/widgets/profile_setup_form.dart

import 'dart:io'; // ADDED
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart'; // ADDED
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/core/utils/date_formatters.dart';
import 'package:sahbifit/core/utils/validators.dart';
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/features/file/domain/usecases/upload_profile_photo.dart'; // ADDED
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/presentation/cubit/gym_list_cubit.dart';
import 'package:sahbifit/features/tag/domain/entities/tag.dart';
import 'package:sahbifit/features/tag/presentation/cubit/tags_cubit.dart';
import 'package:sahbifit/shared/widgets/badges/custom_badges.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

// NOTE: The new _onRegisterPressed method uses `getIt`,
// but the import for it (e.g., 'package:sahbifit/locator.dart')
// was not in the instructions. You may need to add it manually.

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

  // --- ADD THESE ---
  File? _pickedImage;
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();
  // --- END ADD ---

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

  // --- ADD THIS METHOD ---
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }
  // --- END ADD ---

  // --- REPLACE THIS METHOD ---
  void _onRegisterPressed() async { // <-- Add async
    if (!_formKey.currentState!.validate()) {
      return;
    }
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

    setState(() => _isLoading = true);
    String? profilePhotoUrl;

    try {
      // 1. Upload image if one was picked
      if (_pickedImage != null) {
        profilePhotoUrl = await getIt<UploadProfilePhoto>().call(
          UploadProfilePhotoParams(file: _pickedImage!),
        );
      }

      // 2. Call the onRegister callback with the URL
      widget.onRegister(
        firstName: _firstNameController.text.trim(),
        dateOfBirth: _dobController.text,
        primaryGymId: _selectedGymId!,
        goalTagIds: _selectedGoalIds,
        scheduleTagIds: _selectedScheduleIds,
        profilePhotoUrl: profilePhotoUrl, // <-- Pass the URL
      );

    } catch (e) {
      _showError('Failed to upload photo: $e');
    } finally {
      // We only set isLoading to false on error.
      // On success, the parent page will navigate away.
      if (mounted) {
         setState(() => _isLoading = false);
      }
    }
  }
  // --- END REPLACE ---

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
            // --- ADD THIS WIDGET ---
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppTheme.lightGray,
                  backgroundImage: _pickedImage != null
                      ? FileImage(_pickedImage!)
                      : null,
                  child: _pickedImage == null
                      ? const Icon(Icons.add_a_photo,
                          color: AppTheme.disabledGray, size: 40)
                      : null,
                ),
              ),
            ),
            // --- END ADD ---
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
                // Check both AuthBloc loading and local upload loading
                final isAuthLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );
                return PrimaryButton(
                  text: 'Create Account',
                  onPressed: _onRegisterPressed,
                  isLoading: isAuthLoading || _isLoading, // <-- Update this
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
              initialValue: _selectedGymId,
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
