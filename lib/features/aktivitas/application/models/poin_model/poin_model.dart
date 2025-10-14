import 'package:freezed_annotation/freezed_annotation.dart';

part 'poin_model.freezed.dart';
part 'poin_model.g.dart';

@freezed
abstract class PoinModel with _$PoinModel {
  factory PoinModel({
    required String diajukan,
    required String diterima,
    required String ditolak,
  }) = _PoinModel;

  factory PoinModel.fromJson(Map<String, dynamic> json) => _$PoinModelFromJson(json);
}