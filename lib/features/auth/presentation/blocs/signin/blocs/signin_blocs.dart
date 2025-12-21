import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/email_validator.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/password_validator.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_event.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    // Email/NIP
    on<EmailChanged>((event, emit) {
      final emailError = EmailValidator.validate(event.email);
      emit(state.copyWith(email: event.email, emailError: emailError));
    });

    // Password
    on<PasswordChanged>((event, emit) {
      final error = PasswordValidator.validate(event.password);

      emit(state.copyWith(password: event.password, passwordError: error));
    });

    on<SignInSubmitted>((event, emit) {
      final emailError = EmailValidator.validate(state.email);
      final passwordError = PasswordValidator.validate(state.password);

      emit(
        state.copyWith(emailError: emailError, passwordError: passwordError),
      );
    });
  }
}
