import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/core/services/recaptcha_service.dart';
import 'package:sahbifit/core/utils/validators.dart';
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';

class SmsOtpInput extends StatefulWidget {
  final String phoneNumber;
  const SmsOtpInput({super.key, required this.phoneNumber});

  @override
  State<SmsOtpInput> createState() => _SmsOtpInputState();
}

class _SmsOtpInputState extends State<SmsOtpInput> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  Timer? _resendTimer;
  int _countdown = 60;
  bool _isResending = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void _startResendTimer() {
    setState(() => _countdown = 60);
    _resendTimer?.cancel(); // Cancel any existing timer
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() => _countdown--);
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _onResendPressed() async {
    if (_countdown > 0) return;

    setState(() => _isResending = true);
    try {
      final recaptchaToken =
          await getIt<ReCaptchaService>().getToken('resend-otp');
      if (mounted) {
        context.read<AuthBloc>().add(
              AuthEvent.resendOtpButtonPressed(
                phoneNumber: widget.phoneNumber,
                recaptchaToken: recaptchaToken,
              ),
            );
      }
      _startResendTimer();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('reCAPTCHA failed: ${e.toString()}'),
            backgroundColor: AppTheme.primaryRed,
          ),
        );
      }
    } finally {
      setState(() => _isResending = false);
    }
  }

  void _onVerifyPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthEvent.verifySmsButtonPressed(
              phoneNumber: widget.phoneNumber,
              otp: _otpController.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PrimaryTextField(
            label: '6-Digit OTP',
            hintText: '------',
            controller: _otpController,
            keyboardType: TextInputType.number,
            validator: validateOtp,
            maxLength: 6,
          ),
          const SizedBox(height: AppTheme.sectionSpacing),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return PrimaryButton(
                text: 'Verify',
                onPressed: _onVerifyPressed,
                isLoading: isLoading,
              );
            },
          ),
          const SizedBox(height: AppTheme.defaultPadding),
          TextButton(
            onPressed: _countdown == 0 ? _onResendPressed : null,
            child: _isResending
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    _countdown == 0
                        ? 'Resend OTP'
                        : 'Resend OTP in $_countdown s',
                  ),
          ),
        ],
      ),
    );
  }
}
