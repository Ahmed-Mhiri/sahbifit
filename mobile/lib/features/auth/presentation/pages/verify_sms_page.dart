import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart'; // ADD THIS IMPORT
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/features/auth/presentation/widgets/sms_otp_input.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';


class VerifySmsPage extends StatelessWidget {
  final String phoneNumber;
  const VerifySmsPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Verify Account'),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              verificationSuccess: () {
                // On success, show a message and pop all auth routes
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Account verified successfully! Please log in.'),
                    backgroundColor: AppTheme.successGreen,
                  ),
                );
                context.go('/login');
              },
              otpResent: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('A new OTP has been sent.'),
                    backgroundColor: AppTheme.trustBlue,
                  ),
                );
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppTheme.sectionSpacing),
                Text(
                  'Enter Verification Code',
                  style: context.textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: context.textTheme.bodyLarge,
                    children: [
                      const TextSpan(text: 'We sent a 6-digit code to '),
                      TextSpan(
                        text: '+216 $phoneNumber',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppTheme.sectionSpacing * 2),
                SmsOtpInput(phoneNumber: phoneNumber),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
