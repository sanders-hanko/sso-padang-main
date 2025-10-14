import 'package:freezed_annotation/freezed_annotation.dart';

part 'kamera_model.freezed.dart';
part 'kamera_model.g.dart';

@freezed
abstract class KameraModel with _$KameraModel {
  factory KameraModel({
    required String path,
  }) = _KameraModel;

  factory KameraModel.fromJson(Map<String, dynamic> json) =>
      _$KameraModelFromJson(json);
}
