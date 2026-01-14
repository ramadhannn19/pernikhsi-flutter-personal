import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/forgotpassword/blocs/forgot_event.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/forgotpassword/blocs/forgot_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState.initial()) {
    on<ForgotPasswordSubmitted>(_onSubmit);
  }

  Future<void> _onSubmit(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    // 1. set loading
    emit(
      state.copyWith(status: ForgotPasswordStatus.loading, errorMessage: ''),
    );

    try {
      // 2. Fake request
      await Future.delayed(const Duration(seconds: 2));

      //3. Berhasil
      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } catch (e) {
      //4. Error
      emit(
        state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
