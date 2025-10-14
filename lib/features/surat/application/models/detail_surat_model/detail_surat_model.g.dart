// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_surat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailSuratModel _$DetailSuratModelFromJson(Map<String, dynamic> json) =>
    _DetailSuratModel(
      id: json['id'] as String,
      pengirim: json['pengirim'] as String,
      status: json['status'] as String,
      disposisi: json['disposisi'] as List<dynamic>?,
      perihal: json['perihal'] as String,
      tujuan: json['tujuan'] as List<dynamic>?,
      currentUser: json['currentUser'] as String,
      tanggal: json['tanggal'] as String,
      jam: json['jam'] as String,
      jenis: json['jenis'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$DetailSuratModelToJson(_DetailSuratModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pengirim': instance.pengirim,
      'status': instance.status,
      'disposisi': instance.disposisi,
      'perihal': instance.perihal,
      'tujuan': instance.tujuan,
      'currentUser': instance.currentUser,
      'tanggal': instance.tanggal,
      'jam': instance.jam,
      'jenis': instance.jenis,
      'path': instance.path,
    };
