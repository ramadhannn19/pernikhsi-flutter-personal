//Bloc : otak yang ngatur event → state:

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_event.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
