import 'package:super_app/features/aktivitas/application/models/kegiatan_model/kegiatan_model.dart';

class KegiatanState {}

class Initial extends KegiatanState {}

class Loading extends KegiatanState {}

class Loaded extends KegiatanState {
  final String coreValue;
  final List<KegiatanModel> kegiatan;
  Loaded(this.coreValue, this.kegiatan);
}

class Selected extends KegiatanState {
  final String coreValue;
  final KegiatanModel kegiatan;
  final List<KegiatanModel> listKegiatan;
  Selected(this.coreValue, this.kegiatan, this.listKegiatan);
}

class Error extends KegiatanState {
  final String message;
  Error(this.message);
}
