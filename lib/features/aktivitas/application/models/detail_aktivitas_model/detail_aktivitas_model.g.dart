// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_aktivitas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailAktivitasModel _$DetailAktivitasModelFromJson(
        Map<String, dynamic> json) =>
    _DetailAktivitasModel(
      id: json['id'] as String,
      nip: json['nip'] as String,
      nama: json['nama'] as String,
      jabatan: json['jabatan'] as String,
      atasanNip: json['atasanNip'] as String,
      atasanNama: json['atasanNama'] as String,
      tanggal: json['tanggal'] as String,
      coreValue: json['coreValue'] as String,
      kegiatan: json['kegiatan'] as String,
      fotoUrl: json['fotoUrl'] as String,
      keterangan: json['keterangan'] as String,
      statusAktivitas: json['statusAktivitas'] as String,
    );

Map<String, dynamic> _$DetailAktivitasModelToJson(
        _DetailAktivitasModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nip': instance.nip,
      'nama': instance.nama,
      'jabatan': instance.jabatan,
      'atasanNip': instance.atasanNip,
      'atasanNama': instance.atasanNama,
      'tanggal': instance.tanggal,
      'coreValue': instance.coreValue,
      'kegiatan': instance.kegiatan,
      'fotoUrl': instance.fotoUrl,
      'keterangan': instance.keterangan,
      'statusAktivitas': instance.statusAktivitas,
    };
