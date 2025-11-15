/// A generic validator for non-empty text fields.
String? validateNotEmpty(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return '$fieldName cannot be empty.';
  }
  return null; // Valid
}

/// Validates the password based on your backend's `RegisterRequest`.
/// (`@Size(min = 8, message = "Password must be at least 8 characters long.")`)
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty.';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters long.';
  }
  return null; // Valid
}

/// Validates the OTP code based on your backend's `VerifySmsRequest`.
/// (`@Size(min = 6, max = 6, message = "OTP must be 6 digits long.")`)
String? validateOtp(String? value) {
  if (value == null || value.isEmpty) {
    return 'OTP cannot be empty.';
  }
  if (value.length != 6) {
    return 'OTP must be 6 digits long.';
  }
  // Optional: Check if all characters are digits
  if (int.tryParse(value) == null) {
    return 'OTP must only contain numbers.';
  }
  return null; // Valid
}