import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_surat_model.freezed.dart';
part 'form_surat_model.g.dart';

@freezed
abstract class FormSuratModel with _$FormSuratModel {
  factory FormSuratModel({
    required String pengirimId,
    required String pengirimNama,
    required List<String> tujuanId,
    required String asisten,
    required String jenis,
    required String perihal,
    required String filePath,
  }) = _FormSuratModel;

  factory FormSuratModel.fromJson(Map<String, dynamic> json) => _$FormSuratModelFromJson(json);
}