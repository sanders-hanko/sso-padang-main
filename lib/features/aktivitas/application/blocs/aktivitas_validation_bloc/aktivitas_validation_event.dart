part of 'aktivitas_validation_bloc.dart';

@freezed
class AktivitasValidationEvent with _$AktivitasValidationEvent {
  const factory AktivitasValidationEvent.validate(
      TextEditingController nipController,
      TextEditingController atasanController,
      TextEditingController tanggalController,
      TextEditingController coreValueController,
      TextEditingController kegiatanController,
      TextEditingController fotoController,
      TextEditingController fileNameController,
      TextEditingController keteranganController,
  ) = _Validate;
  const factory AktivitasValidationEvent.send(AktivitasModel aktivitas) = _Send;
}
