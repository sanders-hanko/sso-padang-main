import 'package:freezed_annotation/freezed_annotation.dart';

part 'aktivitas_permission_model.freezed.dart';
part 'aktivitas_permission_model.g.dart';

@freezed
abstract class AktivitasPermissionModel with _$AktivitasPermissionModel {
  factory AktivitasPermissionModel({
    required bool createPermission,
    required bool evaluationPermission,
    required bool bypassPermission,
  }) = _AktivitasPermissionModel;

  factory AktivitasPermissionModel.fromJson(Map<String, dynamic> json) => _$AktivitasPermissionModelFromJson(json);
}