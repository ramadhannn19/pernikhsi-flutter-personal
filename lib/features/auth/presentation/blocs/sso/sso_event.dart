import 'package:equatable/equatable.dart';

abstract class SsoEvent extends Equatable {
  const SsoEvent();

  @override
  List<Object?> get props => [];
}

class GoogleSignInPressed extends SsoEvent {}

class AppleSignInPressed extends SsoEvent {}

class FacebookSignInPressed extends SsoEvent {}
