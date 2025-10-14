import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/core/interceptors/token_interceptor.dart';
import 'package:super_app/features/surat/application/models/form_surat_model/form_surat_model.dart';
import 'package:super_app/features/surat/application/models/list_surat_model/list_surat_model.dart';
import 'package:super_app/features/surat/application/models/detail_surat_model/detail_surat_model.dart';
import 'package:super_app/core/di/injector.dart';

class SuratRepository {
  final Utils utils;
  final Dio dio;
  late List<dynamic> listSurat = [];

  SuratRepository(this.utils, this.dio);

  Future<List> fetchSurat() async {
    await Future.delayed(const Duration(seconds: 1));
    final String protokol = utils.protokolHttps;
    final String domain = utils.simpegDomain;
    final String path = utils.getSurat;
    final url = protokol + domain + path;

    dio.interceptors.add(getIt<TokenInterceptor>());

    final Response<dynamic> response = await dio.get(url);

    final List<dynamic> data = response.data['data'];

    listSurat = data
        .map(
          (val) => ListSuratModel(
            id: val['id'],
            pengirim: val['pengirim'],
            disposisi: val['disposisi'],
            currentUser: val['currentUser'],
            tanggal: val['tanggal'],
            jam: val['jam'],
            detail: DetailSuratModel(
                id: val['detail']['id'],
                pengirim: val['detail']['pengirim'],
                status: val['detail']['status'],
                disposisi: val['detail']['disposisi'],
                perihal: val['detail']['perihal'],
                tujuan: val['detail']['tujuan'],
                currentUser: val['detail']['currentUser'],
                tanggal: val['detail']['tanggal'],
                jam: val['detail']['jam'],
                jenis: val['detail']['jenis'],
                path: val['detail']['path']),
            kodeSurat: val['kodeSurat'],
          ),
        )
        .toList();

    return listSurat;
  }

  Future<ListSuratModel> postSurat(FormSuratModel surat) async {
    final String protokol = utils.protokolHttps;
    final String domain = utils.simpegDomain;
    final String path = utils.postSurat;
    final String url = protokol + domain + path;
    String fileName =
        surat.filePath.isNotEmpty ? surat.filePath.split('/').last : '';
    final FormData data = FormData.fromMap({
      'pengirim_id': surat.pengirimId,
      'pengirim_nama': surat.pengirimNama,
      'asisten': surat.asisten,
      'jenis': surat.jenis,
      'perihal': surat.perihal,
      'file': fileName != ''
          ? await MultipartFile.fromFile(surat.filePath, filename: fileName)
          : '',
    });

    for (var val in surat.tujuanId) {
      data.fields.add(MapEntry('tujuan_id[]', val));
    }

    dio.interceptors.add(getIt<TokenInterceptor>());

    final response = await dio.post(url, data: data);

    final dataSurat = response.data['data'];

    return ListSuratModel.fromJson(dataSurat);
  }

  Future<Map<String, dynamic>> fetchDisposisiBerikutnya(
      String id) async {
    await Future.delayed(const Duration(seconds: 1));
    final String protokol = utils.protokolHttps;
    final String domain = utils.simpegDomain;
    final String path = utils.disposisiBerikutnya;
    final url = protokol + domain + path + id;

    dio.interceptors.add(getIt<TokenInterceptor>());

    final Response<dynamic> response = await dio.get(url);

    final Map<String, dynamic> data = response.data['data'] ?? {};
    final List<dynamic> opdPenerima = response.data['opd_penerima'] ?? [];

    return {'data': data, 'opd_penerima': opdPenerima};
  }
}
