// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tanggal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TanggalModel _$TanggalModelFromJson(Map<String, dynamic> json) =>
    _TanggalModel(
      tahun: json['tahun'] as String,
      bulan: json['bulan'] as String,
      tanggal: json['tanggal'] as String?,
      namaBulan: json['namaBulan'] as String,
      listTanggal: (json['listTanggal'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$TanggalModelToJson(_TanggalModel instance) =>
    <String, dynamic>{
      'tahun': instance.tahun,
      'bulan': instance.bulan,
      'tanggal': instance.tanggal,
      'namaBulan': instance.namaBulan,
      'listTanggal': instance.listTanggal,
    };
