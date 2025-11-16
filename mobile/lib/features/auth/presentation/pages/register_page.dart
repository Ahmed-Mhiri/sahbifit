// lib/features/auth/presentation/pages/register_page.dart
import 'dart:io'; // ADD THIS IMPORT
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/auth/domain/usecases/register_user.dart';
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/features/auth/presentation/widgets/profile_setup_form.dart';
import 'package:sahbifit/features/auth/presentation/widgets/register_form_step_1.dart';
import 'package:sahbifit/features/gym/presentation/cubit/gym_list_cubit.dart';
import 'package:sahbifit/features/tag/presentation/cubit/tags_cubit.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();
  // Data from Step 1
  String? _phoneNumber;
  String? _password;
  String? _recaptchaToken;

  // This method is now triggered by the BLoC listener
  void _onStep1Next(
    String phoneNumber,
    String password,
    String recaptchaToken,
  ) {
    setState(() {
      _phoneNumber = phoneNumber;
      _password = password;
      _recaptchaToken = recaptchaToken;
    });
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // --- UPDATE THIS METHOD SIGNATURE AND LOGIC ---
  void _onStep2Register({
    required String firstName,
    required String dateOfBirth,
    required String primaryGymId,
    required List<int> goalTagIds,
    required List<int> scheduleTagIds,
    File? profileImageFile, // <-- CHANGE THIS
  }) {
    if (_phoneNumber == null || _password == null || _recaptchaToken == null) {
      // Should not happen, but as a safeguard
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error going from step 1 to 2')),
      );
      _pageController.jumpToPage(0);
      return;
    }

    final params = RegisterParams(
      phoneNumber: _phoneNumber!,
      password: _password!,
      recaptchaToken: _recaptchaToken!,
      firstName: firstName,
      dateOfBirth: dateOfBirth,
      primaryGymId: primaryGymId,
      goalTagIds: goalTagIds,
      scheduleTagIds: scheduleTagIds,
      profilePhotoUrl: null, // <-- CHANGE THIS (BLoC will set it)
    );

    // Dispatch the event with BOTH the params and the file
    context.read<AuthBloc>().add(AuthEvent.registerButtonPressed(
          params: params,
          profileImageFile: profileImageFile, // <-- PASS THE FILE
        ));
  }
  // --- END UPDATE ---

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<GymListCubit>()),
        BlocProvider(create: (context) => getIt<TagsCubit>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            // --- ADDED ---
            registerStep1Success: (phoneNumber, password, recaptchaToken) {
              // Call the local method to store data and move to the next page
              _onStep1Next(phoneNumber, password, recaptchaToken);
            },
            // --- END ADD ---
            registrationSuccess: (phoneNumber) {
              // Navigate to VerifySmsPage on success
              context.push('/verify-sms', extra: phoneNumber);
            },
            failure: (message) {
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
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Create Account',
            onBackPressed: () {
              if (_pageController.page == 1.0) {
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                context.pop();
              }
            },
          ),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // --- UPDATED ---
              RegisterFormStep1(),
              // --- END UPDATE ---
              ProfileSetupForm(onRegister: _onStep2Register),
            ],
          ),
        ),
      ),
    );
  }
}