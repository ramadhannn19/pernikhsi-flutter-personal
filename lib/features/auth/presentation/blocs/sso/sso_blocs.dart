import 'package:flutter_bloc/flutter_bloc.dart';
import 'sso_event.dart';
import 'sso_state.dart';

class SsoBloc extends Bloc<SsoEvent, SsoState> {
  SsoBloc() : super(const SsoState()) {
    on<GoogleSignInPressed>(_onGoogleSignIn);
    on<AppleSignInPressed>(_onAppleSignIn);
    on<FacebookSignInPressed>(_onFacebookSignIn);
  }

  //GOOGLE
  Future<void> _onGoogleSignIn(
    GoogleSignInPressed event,
    Emitter<SsoState> emit,
  ) async {
    emit(state.copyWith(status: SsoStatus.loading));

    try {
      // Dummy delay → nanti ganti Firebase / API call
      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: SsoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SsoStatus.error, message: e.toString()));
    }
  }

  //APPLE
  Future<void> _onAppleSignIn(
    AppleSignInPressed event,
    Emitter<SsoState> emit,
  ) async {
    emit(state.copyWith(status: SsoStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: SsoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SsoStatus.error, message: e.toString()));
    }
  }

  //FACEBOOK
  Future<void> _onFacebookSignIn(
    FacebookSignInPressed event,
    Emitter<SsoState> emit,
  ) async {
    emit(state.copyWith(status: SsoStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: SsoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SsoStatus.error, message: e.toString()));
    }
  }
}
