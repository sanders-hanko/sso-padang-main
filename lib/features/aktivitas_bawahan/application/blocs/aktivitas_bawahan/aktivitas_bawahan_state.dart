import 'package:super_app/features/aktivitas_bawahan/application/models/list_nama_aktivitas_bawahan/list_nama_model.dart';

class AktivitasBawahanState {}

class Initial extends AktivitasBawahanState {}

class Loading extends AktivitasBawahanState {}

class Empty extends AktivitasBawahanState {}

class Loaded extends AktivitasBawahanState {
  final List<ListNamaModel?> listNama;
  Loaded(this.listNama);
}

class Error extends AktivitasBawahanState {
  final String message;
  Error(this.message);
}
