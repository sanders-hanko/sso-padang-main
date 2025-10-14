import 'package:super_app/features/aktivitas/application/models/atasan_model/atasan_model.dart';

class AtasanState {}

class Initial extends AtasanState {}

class Loading extends AtasanState {}

class Loaded extends AtasanState {
  final List<AtasanModel> atasan;
  Loaded(this.atasan);
}

class Selected extends AtasanState {
  final AtasanModel atasan;
  final List<AtasanModel> listAtasan;
  Selected(this.atasan, this.listAtasan);
}

class Error extends AtasanState {
  final String message;
  Error(this.message);
}
