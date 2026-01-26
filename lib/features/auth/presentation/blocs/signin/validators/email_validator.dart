class EmailValidator {
  static String? validate(String email) {
    if (email.isEmpty) return null;

    final regex = RegExp(r'^[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+$');
    if (!regex.hasMatch(email)) {
      return 'Invalid email format';
    }

    return null;
  }
}
