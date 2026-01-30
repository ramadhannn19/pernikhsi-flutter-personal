//Event = apa yang TERJADI di UI (aksi user atau trigger sistem)

abstract class RegisterEvent {}

// FIELD EVENTS
class NameChanged extends RegisterEvent {
  NameChanged(this.name);
  final String name;
}

class GenderChanged extends RegisterEvent {
  GenderChanged(this.gender);
  final String gender;
}

class NIPChanged extends RegisterEvent {
  NIPChanged(this.nip);
  final String nip;
}

class EmailChanged extends RegisterEvent {
  EmailChanged(this.email);
  final String email;
}

class NumberChanged extends RegisterEvent {
  NumberChanged(this.number);
  final String number;
}

class PasswordChanged extends RegisterEvent {
  PasswordChanged(this.password);
  final String password;
}

// ACTION EVENT
class RegisterSubmitted extends RegisterEvent {
  RegisterSubmitted();
}
