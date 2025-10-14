import 'package:freezed_annotation/freezed_annotation.dart';

part 'aktivitas_model.freezed.dart';
part 'aktivitas_model.g.dart';

@freezed
abstract class AktivitasModel with _$AktivitasModel {
  factory AktivitasModel({
    required String nip,
    required String atasan,
    required String tanggal,
    required String coreValue,
    required String kegiatan,
    required String foto,
    required String filename,
    required String keterangan,
  }) = _AktivitasModel;

  factory AktivitasModel.fromJson(Map<String, dynamic> json) => _$AktivitasModelFromJson(json);
}