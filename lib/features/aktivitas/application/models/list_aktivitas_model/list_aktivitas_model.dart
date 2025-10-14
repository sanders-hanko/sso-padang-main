import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_aktivitas_model.freezed.dart';
part 'list_aktivitas_model.g.dart';

@freezed
abstract class ListAktivitasModel with _$ListAktivitasModel {
  factory ListAktivitasModel({
    required String id,
    required String tanggal,
    required String poin,
    required String keterangan,
    required String status,
    required Map<String, dynamic> detail,
  }) = _ListAktivitasModel;

  factory ListAktivitasModel.fromJson(Map<String, dynamic> json) => _$ListAktivitasModelFromJson(json);
}