class NumberValidator {
  static String? validate(String number) {
    if (number.isEmpty) return 'Number is required';
    if (!RegExp(r'^\d+$').hasMatch(number)) return 'Only digits allowed';
    if (number.length < 10) return 'Number must be at least 10 digits';
    if (number.length > 15) return 'Number cannot exceed 15 digits';

    return null;
  }
}
