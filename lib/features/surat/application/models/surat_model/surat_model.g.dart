// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuratModel _$SuratModelFromJson(Map<String, dynamic> json) => _SuratModel(
      id: json['id'] as String,
      dari: json['dari'] as String,
      tujuan:
          (json['tujuan'] as List<dynamic>).map((e) => e as String).toList(),
      asisten: json['asisten'] as String,
      jenis: json['jenis'] as String,
      perihal: json['perihal'] as String,
      berkas: json['berkas'] as String,
      status: json['status'] as String,
      tanggal: json['tanggal'] as String,
      jam: json['jam'] as String,
      read: json['read'] as bool,
    );

Map<String, dynamic> _$SuratModelToJson(_SuratModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dari': instance.dari,
      'tujuan': instance.tujuan,
      'asisten': instance.asisten,
      'jenis': instance.jenis,
      'perihal': instance.perihal,
      'berkas': instance.berkas,
      'status': instance.status,
      'tanggal': instance.tanggal,
      'jam': instance.jam,
      'read': instance.read,
    };
