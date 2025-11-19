import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/email_validator.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/name_validator.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/nip_validator.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/number_validator.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/validators/password_validator.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    //NAME
    on<NameChanged>((event, emit) {
      final error = NameValidator.validate(event.name);

      emit(state.copyWith(name: event.name, nameError: error));
    });

    //GENDER
    on<GenderChanged>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });

    //NIP
    on<NIPChanged>((event, emit) {
      emit(
        state.copyWith(
          nip: event.nip,
          nipError: NipValidator.validate(event.nip),
        ),
      );
    });

    //EMAIL
    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: event.email,
          emailError: EmailValidator.validate(event.email),
        ),
      );
    });

    //PHONE
    on<NumberChanged>((event, emit) {
      emit(
        state.copyWith(
          number: event.number,
          numberError: NumberValidator.validate(event.number),
        ),
      );
    });

    //PASSWORD
    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          passwordError: PasswordValidator.validate(event.password),
        ),
      );
    });
  }
}
