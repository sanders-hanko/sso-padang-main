sealed class SuratState {}

class Initial extends SuratState {}

class Loading extends SuratState {}

class Loaded extends SuratState {
  final List<dynamic> listSurat;
  Loaded(this.listSurat);
}

class Error extends SuratState {
  final String message;
  Error(this.message);
}
