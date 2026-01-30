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
    on<NameChanged>(_onNameChanged);
    on<GenderChanged>(_onGenderChanged);
    on<NIPChanged>(_onNipChanged);
    on<EmailChanged>(_onEmailChanged);
    on<NumberChanged>(_onNumberChanged);
    on<PasswordChanged>(_onPasswordChanged);

    // submit
    on<RegisterSubmitted>(_onFormSubmitted);
  }

  void _onNameChanged(NameChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        name: event.name,
        nameError: NameValidator.validate(event.name),
      ),
    );
  }

  void _onGenderChanged(GenderChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  void _onNipChanged(NIPChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        nip: event.nip,
        nipError: NipValidator.validate(event.nip),
      ),
    );
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        emailError: EmailValidator.validate(event.email),
      ),
    );
  }

  void _onNumberChanged(NumberChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        number: event.number,
        numberError: NumberValidator.validate(event.number),
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        password: event.password,
        passwordError: PasswordValidator.validate(event.password),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    //  cegah double submit
    if (state.status == RegisterStatus.loading) return;

    //  validasi final sebelum API
    if (state.nameError != null ||
        state.nipError != null ||
        state.emailError != null ||
        state.numberError != null ||
        state.passwordError != null ||
        state.gender == null) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: 'Form belum valid',
        ),
      );
      return;
    }

    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      //  SIMULASI HIT API
      await Future.delayed(const Duration(seconds: 2));

      //  panggil repository.register(...)
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
