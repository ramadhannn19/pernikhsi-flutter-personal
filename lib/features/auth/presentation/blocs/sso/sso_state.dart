import 'package:equatable/equatable.dart';

enum SsoStatus { initial, loading, success, error }

class SsoState extends Equatable {
  final SsoStatus status;
  final String? message;

  const SsoState({this.status = SsoStatus.initial, this.message});

  SsoState copyWith({SsoStatus? status, String? message}) {
    return SsoState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
