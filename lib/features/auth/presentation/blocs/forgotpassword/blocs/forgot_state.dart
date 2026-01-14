enum ForgotPasswordStatus { initial, loading, success, error }

class ForgotPasswordState {
  final String email;
  final ForgotPasswordStatus status;
  final String? errorMessage;

  const ForgotPasswordState({
    required this.email,
    required this.status,
    this.errorMessage,
  });

  factory ForgotPasswordState.initial() {
    return const ForgotPasswordState(
      email: '',
      status: ForgotPasswordStatus.initial,
      errorMessage: null,
    );
  }

  ForgotPasswordState copyWith({
    String? email,
    ForgotPasswordStatus? status,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
