// Event = apa yang user lakukan atau aksi yang terjadi di UI

abstract class RegisterEvent {}

class NameChanged extends RegisterEvent {
  final String name;
  NameChanged(this.name);
}

class GenderChanged extends RegisterEvent {
  final String gender;
  GenderChanged(this.gender);
}

class NIPChanged extends RegisterEvent {
  final String nip;
  NIPChanged(this.nip);
}

class EmailChanged extends RegisterEvent {
  final String email;
  EmailChanged(this.email);
}

class NumberChanged extends RegisterEvent {
  final String number;
  NumberChanged(this.number);
}

class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged(this.password);
}

class FormSubmitted extends RegisterEvent {}
