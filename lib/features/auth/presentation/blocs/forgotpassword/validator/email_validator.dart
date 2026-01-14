class ForgotPasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    // Email
    if (value.contains('@')) {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      if (!emailRegex.hasMatch(value)) {
        return 'Invalid format email';
      }
    }

    // NIP (misal numeric min 5)
    if (!value.contains('@') && value.length < 5) {
      return 'NIP minimum 5 characters';
    }

    return null;
  }
}
