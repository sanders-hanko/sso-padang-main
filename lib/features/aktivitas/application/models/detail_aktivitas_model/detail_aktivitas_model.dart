import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_aktivitas_model.freezed.dart';
part 'detail_aktivitas_model.g.dart';

@freezed
abstract class DetailAktivitasModel with _$DetailAktivitasModel {
  factory DetailAktivitasModel({
    required String id,
    required String nip,
    required String nama,
    required String jabatan,
    required String atasanNip,
    required String atasanNama,
    required String tanggal,
    required String coreValue,
    required String kegiatan,
    required String fotoUrl,
    required String keterangan,
    required String statusAktivitas,
  }) = _DetailAktivitasModel;

  factory DetailAktivitasModel.fromJson(Map<String, dynamic> json) => _$DetailAktivitasModelFromJson(json);
}