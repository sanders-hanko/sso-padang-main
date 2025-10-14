import 'package:freezed_annotation/freezed_annotation.dart';

part 'asisten_model.freezed.dart';
part 'asisten_model.g.dart';

@freezed
abstract class AsistenModel with _$AsistenModel {
  factory AsistenModel({
    required String nip,
    required String nama,
    required String jabatan,
  }) = _AsistenModel;

  factory AsistenModel.fromJson(Map<String, dynamic> json) => _$AsistenModelFromJson(json);
}