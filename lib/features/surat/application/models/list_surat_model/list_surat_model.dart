import 'package:freezed_annotation/freezed_annotation.dart';
import '../detail_surat_model/detail_surat_model.dart';

part 'list_surat_model.freezed.dart';
part 'list_surat_model.g.dart';

@freezed
abstract class ListSuratModel with _$ListSuratModel {
  factory ListSuratModel({
    required String id,
    required String pengirim,
    required String disposisi,
    required String currentUser,
    required String tanggal,
    required String jam,
    required String kodeSurat,
    required DetailSuratModel detail,
  }) = _ListSuratModel;

  factory ListSuratModel.fromJson(Map<String, dynamic> json) => _$ListSuratModelFromJson(json);
}