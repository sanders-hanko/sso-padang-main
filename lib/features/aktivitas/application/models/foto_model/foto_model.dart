import 'package:freezed_annotation/freezed_annotation.dart';

part 'foto_model.freezed.dart';
part 'foto_model.g.dart';

@freezed
abstract class FotoModel with _$FotoModel {
  factory FotoModel({
    required String path,
    required String filename,
  }) = _FotoModel;

  factory FotoModel.fromJson(Map<String, dynamic> json) => _$FotoModelFromJson(json);
}