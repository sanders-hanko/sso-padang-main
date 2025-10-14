import 'package:super_app/features/surat/application/models/asisten_model/asisten_model.dart';
import 'package:super_app/features/surat/application/models/list_surat_model/list_surat_model.dart';
import 'package:super_app/features/surat/application/models/organisasi_model/organisasi_model.dart';

sealed class FormInputState {}

class Initial extends FormInputState {}

class Loading extends FormInputState {
  final String label;
  Loading(this.label);
}

class NotFound extends FormInputState {}

class Loaded extends FormInputState {
  final List<OrganisasiModel?> organisasi;
  final List<AsistenModel?> asisten;
  final String label;
  final OrganisasiModel? previousSelectedDari;
  final List<OrganisasiModel?> previousSelectedTujuan;
  final AsistenModel? previousSelectedAsisten;
  Loaded(
    this.organisasi,
    this.asisten,
    this.previousSelectedDari,
    this.previousSelectedTujuan,
    this.previousSelectedAsisten,
    this.label,
  );
}

class Selected extends FormInputState {
  final List<OrganisasiModel?> organisasi;
  final List<AsistenModel?> asisten;
  final OrganisasiModel? selectedDari;
  final List<OrganisasiModel?> selectedTujuan;
  final AsistenModel? selectedAsisten;
  final String label;
  Selected(
    this.organisasi,
    this.asisten,
    this.selectedDari,
    this.selectedTujuan,
    this.selectedAsisten,
    this.label,
  );
}

class Error extends FormInputState {
  final String message;
  Error(this.message);
}

class Sending extends FormInputState {}

class Sent extends FormInputState {
  final ListSuratModel surat;
  Sent(this.surat);
}
