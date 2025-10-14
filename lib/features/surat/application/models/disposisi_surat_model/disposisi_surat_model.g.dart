// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disposisi_surat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DisposisiSuratModel _$DisposisiSuratModelFromJson(Map<String, dynamic> json) =>
    _DisposisiSuratModel(
      id: json['id'] as String,
      nama: json['nama'] as String,
      jabatan: json['jabatan'] as String,
      telitiSaran: json['telitiSaran'] as String,
      toNama: json['toNama'] as String,
      toJabatan: json['toJabatan'] as String,
      toNip: json['toNip'] as String,
      tanggal: json['tanggal'] as String,
      jam: json['jam'] as String,
    );

Map<String, dynamic> _$DisposisiSuratModelToJson(
        _DisposisiSuratModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'jabatan': instance.jabatan,
      'telitiSaran': instance.telitiSaran,
      'toNama': instance.toNama,
      'toJabatan': instance.toJabatan,
      'toNip': instance.toNip,
      'tanggal': instance.tanggal,
      'jam': instance.jam,
    };
