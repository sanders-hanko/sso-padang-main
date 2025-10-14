// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_nama_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListNamaModel _$ListNamaModelFromJson(Map<String, dynamic> json) =>
    _ListNamaModel(
      nip: json['nip'] as String,
      nama: json['nama'] as String,
      jabatan: json['jabatan'] as String,
      jumlahAktivitas: json['jumlahAktivitas'] as String,
      capaian: json['capaian'] as String,
      bulan: json['bulan'] as String,
      aktivitasHarian: (json['aktivitasHarian'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ListNamaModelToJson(_ListNamaModel instance) =>
    <String, dynamic>{
      'nip': instance.nip,
      'nama': instance.nama,
      'jabatan': instance.jabatan,
      'jumlahAktivitas': instance.jumlahAktivitas,
      'capaian': instance.capaian,
      'bulan': instance.bulan,
      'aktivitasHarian': instance.aktivitasHarian,
    };
