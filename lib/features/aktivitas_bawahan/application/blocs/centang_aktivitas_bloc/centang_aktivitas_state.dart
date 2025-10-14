class CentangAktivitasState {}

class Initial extends CentangAktivitasState {}

class Selecting extends CentangAktivitasState {}

class Sending extends CentangAktivitasState {}

class Sent extends CentangAktivitasState {}

class Done extends CentangAktivitasState {}

class Selected extends CentangAktivitasState {
  final String nip;
  final List<String?> id;
  Selected(this.nip, this.id);
}

class Error extends CentangAktivitasState {
  final String message;
  Error(this.message);
}
