import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulan_model.freezed.dart';
part 'bulan_model.g.dart';

@freezed
abstract class BulanModel with _$BulanModel {
  factory BulanModel({
    required String bulan,
    required String namaBulan,
    required String tahun,
    required String tanggal,
  }) = _BulanModel;

  factory BulanModel.fromJson(Map<String, dynamic> json) =>
      _$BulanModelFromJson(json);
}
