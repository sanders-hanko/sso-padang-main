import 'package:freezed_annotation/freezed_annotation.dart';

part 'tanggal_model.freezed.dart';
part 'tanggal_model.g.dart';

@freezed
abstract class TanggalModel with _$TanggalModel {
  factory TanggalModel({
    required String tahun,
    required String bulan,
    required String? tanggal,
    required String namaBulan,
    required List<int> listTanggal,
  }) = _TanggalModel;

  factory TanggalModel.fromJson(Map<String, dynamic> json) => _$TanggalModelFromJson(json);
}