import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/email_validator.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/password_validator.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_event.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: event.email,
          emailError: EmailValidator.validate(event.email),
        ),
      );
    });

    on<SignInPasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          passwordError: PasswordValidator.validate(event.password),
        ),
      );
    });

    on<SignInSubmitted>((event, emit) async {
      emit(state.copyWith(status: SignInStatus.loading));

      try {
        await Future.delayed(Duration(seconds: 1));

        emit(state.copyWith(status: SignInStatus.success));
      } catch (e) {
        emit(
          state.copyWith(
            status: SignInStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
