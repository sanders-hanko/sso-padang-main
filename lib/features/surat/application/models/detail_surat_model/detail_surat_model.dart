import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_surat_model.freezed.dart';
part 'detail_surat_model.g.dart';

@freezed
abstract class DetailSuratModel with _$DetailSuratModel {
  factory DetailSuratModel({
    required String id,
    required String pengirim,
    required String status,
    List<dynamic>? disposisi,
    required String perihal,
    List<dynamic>? tujuan,
    required String currentUser,
    required String tanggal,
    required String jam,
    required String jenis,
    required String path,
  }) = _DetailSuratModel;

  factory DetailSuratModel.fromJson(Map<String, dynamic> json) => _$DetailSuratModelFromJson(json);
}