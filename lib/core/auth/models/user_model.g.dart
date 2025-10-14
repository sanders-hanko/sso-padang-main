// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      nip: json['nip'] as String,
      nama: json['nama'] as String,
      jabatanId: json['jabatanId'] as String,
      jabatanNama: json['jabatanNama'] as String,
      unorIndukId: json['unorIndukId'] as String,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'nip': instance.nip,
      'nama': instance.nama,
      'jabatanId': instance.jabatanId,
      'jabatanNama': instance.jabatanNama,
      'unorIndukId': instance.unorIndukId,
    };
