import 'package:freezed_annotation/freezed_annotation.dart';

part 'atasan_model.freezed.dart';
part 'atasan_model.g.dart';

@freezed
abstract class AtasanModel with _$AtasanModel {
  factory AtasanModel({
    required String nip,
    required String nama,
    required String jabatan,
  }) = _AtasanModel;

  factory AtasanModel.fromJson(Map<String, dynamic> json) => _$AtasanModelFromJson(json);
}