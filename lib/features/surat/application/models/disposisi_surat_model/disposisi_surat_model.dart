import 'package:freezed_annotation/freezed_annotation.dart';

part 'disposisi_surat_model.freezed.dart';
part 'disposisi_surat_model.g.dart';

@freezed
abstract class DisposisiSuratModel with _$DisposisiSuratModel {
  factory DisposisiSuratModel({
    required String id,
    required String nama,
    required String jabatan,
    required String telitiSaran,
    required String toNama,
    required String toJabatan,
    required String toNip,
    required String tanggal,
    required String jam,
  }) = _DisposisiSuratModel;

  factory DisposisiSuratModel.fromJson(Map<String, dynamic> json) => _$DisposisiSuratModelFromJson(json);
}