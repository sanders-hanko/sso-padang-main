import 'package:freezed_annotation/freezed_annotation.dart';

part 'tujuan_surat_model.freezed.dart';
part 'tujuan_surat_model.g.dart';

@freezed
abstract class TujuanSuratModel with _$TujuanSuratModel {
  factory TujuanSuratModel({
    required String id,
    required String penerimaId,
    required String penerimaNama,
  }) = _TujuanSuratModel;

  factory TujuanSuratModel.fromJson(Map<String, dynamic> json) => _$TujuanSuratModelFromJson(json);
}