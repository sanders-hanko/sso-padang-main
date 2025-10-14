import 'package:super_app/features/aktivitas/application/models/list_aktivitas_model/list_aktivitas_model.dart';
import 'package:super_app/features/aktivitas/application/models/poin_model/poin_model.dart';

class AktivitasState {}

class Initial extends AktivitasState {}

class Loading extends AktivitasState {}

class Loaded extends AktivitasState {
  final PoinModel poin;
  final List<ListAktivitasModel> listAktivitas;
  Loaded(this.poin, this.listAktivitas);
}

class Error extends AktivitasState {
  final String message;
  Error(this.message);
}
