import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/features/auth/domain/usecases/register_user.dart';
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/features/auth/presentation/widgets/profile_setup_form.dart';
import 'package:sahbifit/features/auth/presentation/widgets/register_form_step_1.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';

// Note: ServiceLocator and Cubit imports were removed as they are no longer 
// injected here, but handled by the AppRouter.

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

  // This method is triggered by the BLoC listener on 'registerStep1Success'
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

  void _onStep2Register({
    required String firstName,
    required String dateOfBirth,
    required String primaryGymId,
    required List<int> goalTagIds,
    required List<int> scheduleTagIds,
    File? profileImageFile,
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
      profilePhotoUrl: null, // The BLoC handles uploading and setting this
    );

    // Dispatch the event with BOTH the params and the file
    context.read<AuthBloc>().add(AuthEvent.registerButtonPressed(
          params: params,
          profileImageFile: profileImageFile,
        ));
  }

  @override
  Widget build(BuildContext context) {
    // Removed MultiBlocProvider wrapper from here (moved to AppRouter)
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          registerStep1Success: (phoneNumber, password, recaptchaToken) {
            // Store data locally and move to the next page
            _onStep1Next(phoneNumber, password, recaptchaToken);
          },
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
            if (_pageController.hasClients && _pageController.page == 1.0) {
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
            const RegisterFormStep1(),
            ProfileSetupForm(onRegister: _onStep2Register),
          ],
        ),
      ),
    );
  }
}