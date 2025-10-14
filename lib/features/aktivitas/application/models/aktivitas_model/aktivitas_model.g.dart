// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aktivitas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AktivitasModel _$AktivitasModelFromJson(Map<String, dynamic> json) =>
    _AktivitasModel(
      nip: json['nip'] as String,
      atasan: json['atasan'] as String,
      tanggal: json['tanggal'] as String,
      coreValue: json['coreValue'] as String,
      kegiatan: json['kegiatan'] as String,
      foto: json['foto'] as String,
      filename: json['filename'] as String,
      keterangan: json['keterangan'] as String,
    );

Map<String, dynamic> _$AktivitasModelToJson(_AktivitasModel instance) =>
    <String, dynamic>{
      'nip': instance.nip,
      'atasan': instance.atasan,
      'tanggal': instance.tanggal,
      'coreValue': instance.coreValue,
      'kegiatan': instance.kegiatan,
      'foto': instance.foto,
      'filename': instance.filename,
      'keterangan': instance.keterangan,
    };
