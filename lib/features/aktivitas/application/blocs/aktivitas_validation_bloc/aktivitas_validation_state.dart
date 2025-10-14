import 'package:super_app/features/aktivitas/application/models/aktivitas_model/aktivitas_model.dart';

class AktivitasValidationState {}

class Initial extends AktivitasValidationState {}

class Validation extends AktivitasValidationState {
  final bool success;
  final AktivitasModel aktivitas;
  Validation(this.success, this.aktivitas);
}

class Sending extends AktivitasValidationState {}

class Sent extends AktivitasValidationState {}

class SentError extends AktivitasValidationState {
  final String message;
  final AktivitasModel aktivitas;
  SentError(this.message, this.aktivitas);
}

class Error extends AktivitasValidationState {
  final String message;
  Error(this.message);
}
