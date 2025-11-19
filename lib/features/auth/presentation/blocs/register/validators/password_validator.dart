class PasswordValidator {
  static String? validate(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 8) return 'Password must be at least 8 characters';
    if (password.length > 20) return 'Password cannot exceed 20 characters';

    // Harus mengandung minimal satu huruf dan satu angka
    final hasLetter = RegExp(r'[A-Za-z]').hasMatch(password);
    final hasNumber = RegExp(r'\d').hasMatch(password);

    if (!hasLetter || !hasNumber) {
      return 'Password must contain letters and numbers';
    }

    return null;
  }
}
