import 'package:super_app/features/etpp/application/models/etpp_model.dart';

class EtppState {}

class Initial extends EtppState {}

class Loading extends EtppState {}

class Loaded extends EtppState {
  final EtppModel etpp;
  Loaded(this.etpp);
}

class Error extends EtppState {
  final String message;
  Error(this.message);
}
