enum SignInStatus { initial, loading, success, error }

class SignInState {
  final String email;
  final String password;

  final String? emailError; // 🔥 TAMBAH
  final String? passwordError; // 🔥 TAMBAH

  final SignInStatus status;
  final String? errorMessage;

  const SignInState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.status = SignInStatus.initial,
    this.errorMessage,
  });

  SignInState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    SignInStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
