// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_surat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormSuratModel _$FormSuratModelFromJson(Map<String, dynamic> json) =>
    _FormSuratModel(
      pengirimId: json['pengirimId'] as String,
      pengirimNama: json['pengirimNama'] as String,
      tujuanId:
          (json['tujuanId'] as List<dynamic>).map((e) => e as String).toList(),
      asisten: json['asisten'] as String,
      jenis: json['jenis'] as String,
      perihal: json['perihal'] as String,
      filePath: json['filePath'] as String,
    );

Map<String, dynamic> _$FormSuratModelToJson(_FormSuratModel instance) =>
    <String, dynamic>{
      'pengirimId': instance.pengirimId,
      'pengirimNama': instance.pengirimNama,
      'tujuanId': instance.tujuanId,
      'asisten': instance.asisten,
      'jenis': instance.jenis,
      'perihal': instance.perihal,
      'filePath': instance.filePath,
    };
