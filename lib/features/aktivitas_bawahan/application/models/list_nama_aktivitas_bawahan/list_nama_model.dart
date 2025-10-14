import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_nama_model.freezed.dart';
part 'list_nama_model.g.dart';

@freezed
abstract class ListNamaModel with _$ListNamaModel {
  factory ListNamaModel({
    required String nip,
    required String nama,
    required String jabatan,
    required String jumlahAktivitas,
    required String capaian,
    required String bulan,
    required List<Map<String, dynamic>> aktivitasHarian,
  }) = _ListNamaModel;

  factory ListNamaModel.fromJson(Map<String, dynamic> json) =>
      _$ListNamaModelFromJson(json);
}
