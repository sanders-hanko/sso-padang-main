import 'package:freezed_annotation/freezed_annotation.dart';

part 'etpp_model.freezed.dart';
part 'etpp_model.g.dart';

@freezed
abstract class EtppModel with _$EtppModel {
  factory EtppModel({
    required String tppAkhir,
    required String tppBasic,
    required String tppAktivitas,
    required String tppKinerja,
    required String tppKehadiran,
    required String tppRealisasi,
    required String capaianAktivitas,
    required String capaianKinerja,
    required String capaianKehadiran,
    required String capaianRealisasi,
    required String persentase,
    required String persentaseAktivitas,
    required String persentaseKinerja,
    required String persentaseKehadiran,
    required String persentaseRealisasi,
    required String capaianPersentaseAktivitas,
    required String capaianPersentaseKinerja,
    required String capaianPersentaseKehadiran,
    required String capaianPersentaseRealisasi,
    required String capaianPersentasePotongan,
  }) = _EtppModel;

  factory EtppModel.fromJson(Map<String, dynamic> json) =>
      _$EtppModelFromJson(json);
}
