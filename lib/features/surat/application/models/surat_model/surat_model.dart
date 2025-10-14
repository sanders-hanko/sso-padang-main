import 'package:freezed_annotation/freezed_annotation.dart';

part 'surat_model.freezed.dart';
part 'surat_model.g.dart';

@freezed
abstract class SuratModel with _$SuratModel {
  factory SuratModel({
    required String id,
    required String dari,
    required List<String> tujuan,
    required String asisten,
    required String jenis,
    required String perihal,
    required String berkas,
    required String status,
    required String tanggal,
    required String jam,
    required bool read,
  }) = _SuratModel;

  factory SuratModel.fromJson(Map<String, dynamic> json) => _$SuratModelFromJson(json);
}