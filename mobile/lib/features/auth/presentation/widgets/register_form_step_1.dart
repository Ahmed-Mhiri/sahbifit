import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../shared_widgets/primary_button.dart';
import '../../../../../shared_widgets/image_picker_widget.dart';

class RegisterFormStep1 extends StatefulWidget {
  final Function(Map<String, dynamic>) onStepCompleted;
  final Map<String, dynamic>? initialData;

  const RegisterFormStep1({
    super.key,
    required this.onStepCompleted,
    this.initialData,
  });

  @override
  State<RegisterFormStep1> createState() => _RegisterFormStep1State();
}

class _RegisterFormStep1State extends State<RegisterFormStep1> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  String? _selectedImagePath;
  DateTime? _selectedDateOfBirth;

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      _firstNameController.text = widget.initialData!['firstName'] ?? '';
      _phoneController.text = widget.initialData!['phoneNumber'] ?? '';
      _selectedImagePath = widget.initialData!['imagePath'];
      
      if (widget.initialData!['dateOfBirth'] != null) {
        _selectedDateOfBirth = DateTime.parse(widget.initialData!['dateOfBirth']);
        _dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(_selectedDateOfBirth!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ImagePickerWidget(
            onImageSelected: (image) {
              setState(() {
                _selectedImagePath = image?.path;
              });
            },
            initialImageUrl: _selectedImagePath,
            title: 'Profile Photo',
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _firstNameController,
            decoration: const InputDecoration(
              labelText: 'First Name',
              hintText: 'Enter your first name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              if (value.length < 2) {
                return 'Name must be at least 2 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _dateOfBirthController,
            decoration: const InputDecoration(
              labelText: 'Date of Birth',
              hintText: 'YYYY-MM-DD',
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: _selectDate,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select your date of birth';
              }
              if (_selectedDateOfBirth == null) {
                return 'Please select a valid date of birth';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              hintText: '+216 XX XXX XXX',
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (!value.startsWith('+216')) {
                return 'Please enter a valid Tunisian number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 8) { // CHANGED: 6 to 8
                return 'Password must be at least 8 characters'; // CHANGED: Updated text
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            text: 'Continue to Gym Selection',
            onPressed: _submitForm,
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateOfBirth ?? DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDateOfBirth) {
      setState(() {
        _selectedDateOfBirth = picked;
        _dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onStepCompleted({
        'firstName': _firstNameController.text,
        'dateOfBirth': _dateOfBirthController.text,
        'phoneNumber': _phoneController.text,
        'password': _passwordController.text,
        'imagePath': _selectedImagePath,
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }
}