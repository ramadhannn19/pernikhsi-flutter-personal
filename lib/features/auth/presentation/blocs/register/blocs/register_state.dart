//variable Enum status
enum RegisterStatus { initial, loading, success, error }

//variable deklarasi di ui register
class RegisterState {
  final RegisterStatus status;
  final String? errorMessage;

  final String? name;
  final String? nameError;

  final String? gender;

  final String? nip;
  final String? nipError;

  final String? email;
  final String? emailError;

  final String? number;
  final String? numberError;

  final String? password;
  final String? passwordError;

  //contructor
  RegisterState({
    this.status = RegisterStatus.initial,
    this.errorMessage,

    this.name,
    this.nameError,

    this.gender,

    this.nip,
    this.nipError,

    this.email,
    this.emailError,

    this.number,
    this.numberError,

    this.password,
    this.passwordError,
  });

  //copyWith = alat buat bikin state BARU tanpa ngerusak state lama
  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,

    String? name,
    String? nameError,

    String? gender,

    String? nip,
    String? nipError,

    String? email,
    String? emailError,

    String? number,
    String? numberError,

    String? password,
    String? passwordError,
  }) {
    //return itu ngembaliin state BARU ke pemanggil (emit)
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage,

      name: name ?? this.name,
      nameError: nameError,

      gender: gender ?? this.gender,

      nip: nip ?? this.nip,
      nipError: nipError,

      email: email ?? this.email,
      emailError: emailError,

      number: number ?? this.number,
      numberError: numberError,

      password: password ?? this.password,
      passwordError: passwordError,
    );
  }
}
