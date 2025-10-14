import 'package:freezed_annotation/freezed_annotation.dart';

part 'disposisi_model.freezed.dart';
part 'disposisi_model.g.dart';

@freezed
abstract class DisposisiModel with _$DisposisiModel {
  factory DisposisiModel({
    required String suratMasukId,
    required String fromUserNip,
    required String telitiSaran,
    required String toUserNip,
  }) = _DisposisiModel;

  factory DisposisiModel.fromJson(Map<String, dynamic> json) => _$DisposisiModelFromJson(json);
}