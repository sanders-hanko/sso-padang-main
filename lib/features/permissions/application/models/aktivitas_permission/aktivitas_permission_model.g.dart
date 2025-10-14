// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aktivitas_permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AktivitasPermissionModel _$AktivitasPermissionModelFromJson(
        Map<String, dynamic> json) =>
    _AktivitasPermissionModel(
      createPermission: json['createPermission'] as bool,
      evaluationPermission: json['evaluationPermission'] as bool,
      bypassPermission: json['bypassPermission'] as bool,
    );

Map<String, dynamic> _$AktivitasPermissionModelToJson(
        _AktivitasPermissionModel instance) =>
    <String, dynamic>{
      'createPermission': instance.createPermission,
      'evaluationPermission': instance.evaluationPermission,
      'bypassPermission': instance.bypassPermission,
    };
