class NameValidator {
  static String? validate(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    }

    if (name.length < 3) {
      return 'Name must be at least 3 characters';
    }

    if (name.length > 50) {
      return 'Name cannot exceed 50 characters';
    }

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      return 'Name can only contain letters and spaces';
    }

    return null;
  }
}
