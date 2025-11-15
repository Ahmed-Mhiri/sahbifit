/// Validates a phone number based on the backend's Tunisian number regex.
///
/// Regex: `^(2|3|4|5|7|9)\d{7}$`
/// (Must start with 2, 3, 4, 5, 7, or 9, followed by 7 digits).
String? validateTunisianPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number cannot be empty.';
  }
  
  // This regex matches your Java backend's logic
  final RegExp tunisianPhoneRegex = RegExp(r'^(2|3|4|5|7|9)\d{7}$');
  
  if (!tunisianPhoneRegex.hasMatch(value)) {
    return 'Invalid Tunisian phone number (8 digits, no +216).';
  }
  
  return null; // Valid
}