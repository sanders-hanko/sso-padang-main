import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_value_model.freezed.dart';
part 'core_value_model.g.dart';

@freezed
abstract class CoreValueModel with _$CoreValueModel {
  factory CoreValueModel({
    required String id,
    required String nama,
  }) = _CoreValueModel;

  factory CoreValueModel.fromJson(Map<String, dynamic> json) => _$CoreValueModelFromJson(json);
}