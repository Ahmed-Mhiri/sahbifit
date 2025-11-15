import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/core/services/recaptcha_service.dart';
import 'package:sahbifit/core/utils/phone_number_validator.dart';
import 'package:sahbifit/core/utils/validators.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';

class RegisterFormStep1 extends StatefulWidget {
  final Function(String phoneNumber, String password, String recaptchaToken)
      onNext;
  const RegisterFormStep1({super.key, required this.onNext});

  @override
  State<RegisterFormStep1> createState() => _RegisterFormStep1State();
}

class _RegisterFormStep1State extends State<RegisterFormStep1> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onNextPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Get reCAPTCHA token
      final recaptchaToken =
          await getIt<ReCaptchaService>().getToken('register');

      // Pass data to parent page
      widget.onNext(
        _phoneController.text.trim(),
        _passwordController.text.trim(),
        recaptchaToken,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('reCAPTCHA failed: ${e.toString()}'),
          backgroundColor: AppTheme.primaryRed,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
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
              'Your Account',
              style: context.textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.sectionSpacing),
            PrimaryTextField(
              label: 'Phone Number',
              hintText: 'e.g. 50123456',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Text(
                  '+216',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppTheme.darkGray,
                  ),
                ),
              ),
              validator: validateTunisianPhoneNumber,
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            PrimaryTextField(
              label: 'Password',
              hintText: 'At least 8 characters',
              controller: _passwordController,
              obscureText: _obscurePassword,
              validator: validatePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: AppTheme.disabledGray,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            PrimaryTextField(
              label: 'Confirm Password',
              hintText: 'Re-enter your password',
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password.';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match.';
                }
                return null;
              },
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppTheme.disabledGray,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
            const SizedBox(height: AppTheme.sectionSpacing),
            PrimaryButton(
              text: 'Next',
              onPressed: _onNextPressed,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
