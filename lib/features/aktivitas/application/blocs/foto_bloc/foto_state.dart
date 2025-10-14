import 'package:super_app/features/aktivitas/application/models/foto_model/foto_model.dart';

class FotoState {}

class Initial extends FotoState {}

class Loading extends FotoState {}

class Selected extends FotoState {
  final FotoModel foto;
  Selected(this.foto);
}

class Error extends FotoState {
  final String message;
  Error(this.message);
}
