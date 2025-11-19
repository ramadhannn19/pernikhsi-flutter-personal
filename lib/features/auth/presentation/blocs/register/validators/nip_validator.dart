class NipValidator {
  static String? validate(String nip) {
    if (nip.isEmpty) {
      return 'NIP is required';
    }

    if (nip.length < 5) {
      return 'NIP must be at least 5 characters';
    }

    if (nip.contains(' ')) {
      return 'NIP cannot contain spaces';
    }

    return null;
  }
}
