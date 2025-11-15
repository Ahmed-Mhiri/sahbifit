import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/utils/phone_number_validator.dart';
import 'package:sahbifit/core/utils/validators.dart';
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthEvent.loginButtonPressed(
              phoneNumber: _phoneController.text.trim(),
              password: _passwordController.text.trim(),
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
            hintText: 'Enter your password',
            controller: _passwordController,
            obscureText: _obscureText,
            validator: validatePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppTheme.disabledGray,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          const SizedBox(height: AppTheme.sectionSpacing),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return PrimaryButton(
                text: 'Login',
                onPressed: _onLoginPressed,
                isLoading: isLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
