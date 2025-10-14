// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_aktivitas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListAktivitasModel _$ListAktivitasModelFromJson(Map<String, dynamic> json) =>
    _ListAktivitasModel(
      id: json['id'] as String,
      tanggal: json['tanggal'] as String,
      poin: json['poin'] as String,
      keterangan: json['keterangan'] as String,
      status: json['status'] as String,
      detail: json['detail'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ListAktivitasModelToJson(_ListAktivitasModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tanggal': instance.tanggal,
      'poin': instance.poin,
      'keterangan': instance.keterangan,
      'status': instance.status,
      'detail': instance.detail,
    };
