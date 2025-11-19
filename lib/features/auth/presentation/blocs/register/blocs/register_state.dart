//State : apa yang sedang terjadi di UI.

class RegisterState {
  final String? name;
  final String? nameError;

  final String? gender;

  final String? nip;
  final String? nipError;

  final String? email;
  final String? emailError;

  final String? number;
  final String? numberError;

  final String? password;
  final String? passwordError;

  final bool isSubmitting; // loading
  final bool isSuccess;
  final String? errorMessage;

  RegisterState({
    this.name,
    this.nameError,

    this.gender,

    this.nip,
    this.nipError,

    this.email,
    this.emailError,

    this.number,
    this.numberError,

    this.password,
    this.passwordError,

    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  RegisterState copyWith({
    String? name,
    String? nameError,

    String? gender,

    String? nip,
    String? nipError,

    String? email,
    String? emailError,

    String? number,
    String? numberError,

    String? password,
    String? passwordError,

    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return RegisterState(
      name: name ?? this.name,
      nameError: nameError,

      gender: gender ?? this.gender,

      nip: nip ?? this.nip,
      nipError: nipError,

      email: email ?? this.email,
      emailError: emailError,

      number: number ?? this.number,
      numberError: numberError,

      password: password ?? this.password,
      passwordError: passwordError,

      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
