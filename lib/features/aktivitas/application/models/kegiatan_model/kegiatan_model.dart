import 'package:freezed_annotation/freezed_annotation.dart';

part 'kegiatan_model.freezed.dart';
part 'kegiatan_model.g.dart';

@freezed
abstract class KegiatanModel with _$KegiatanModel {
  factory KegiatanModel({
    required String id,
    required String nama,
    required String poin,
  }) = _KegiatanModel;

  factory KegiatanModel.fromJson(Map<String, dynamic> json) => _$KegiatanModelFromJson(json);
}