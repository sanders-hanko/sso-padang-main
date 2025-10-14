import 'package:freezed_annotation/freezed_annotation.dart';

part 'organisasi_model.freezed.dart';
part 'organisasi_model.g.dart';

@freezed
abstract class OrganisasiModel with _$OrganisasiModel {
  factory OrganisasiModel({
    required String id,
    required String namaOrganisasi,
    required String type,
  }) = _OrganisasiModel;

  factory OrganisasiModel.fromJson(Map<String, dynamic> json) => _$OrganisasiModelFromJson(json);
}