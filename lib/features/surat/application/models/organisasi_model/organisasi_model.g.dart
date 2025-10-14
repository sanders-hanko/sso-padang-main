// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisasi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganisasiModel _$OrganisasiModelFromJson(Map<String, dynamic> json) =>
    _OrganisasiModel(
      id: json['id'] as String,
      namaOrganisasi: json['namaOrganisasi'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$OrganisasiModelToJson(_OrganisasiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaOrganisasi': instance.namaOrganisasi,
      'type': instance.type,
    };
