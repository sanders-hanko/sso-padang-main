// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_surat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListSuratModel _$ListSuratModelFromJson(Map<String, dynamic> json) =>
    _ListSuratModel(
      id: json['id'] as String,
      pengirim: json['pengirim'] as String,
      disposisi: json['disposisi'] as String,
      currentUser: json['currentUser'] as String,
      tanggal: json['tanggal'] as String,
      jam: json['jam'] as String,
      kodeSurat: json['kodeSurat'] as String,
      detail: DetailSuratModel.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListSuratModelToJson(_ListSuratModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pengirim': instance.pengirim,
      'disposisi': instance.disposisi,
      'currentUser': instance.currentUser,
      'tanggal': instance.tanggal,
      'jam': instance.jam,
      'kodeSurat': instance.kodeSurat,
      'detail': instance.detail,
    };
