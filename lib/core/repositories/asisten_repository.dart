import 'package:dio/dio.dart';
import 'package:super_app/core/repositories/organisasi_repository.dart';
import 'package:super_app/features/surat/application/models/asisten_model/asisten_model.dart';
import '../../Utils/utils.dart';

class AsistenRepository {
  AsistenRepository(this.dio, this.utils);

  final Dio dio;
  final Utils utils;

  Future<List<AsistenModel>> getAll() async {
    late List<AsistenModel> listData = [];
    final String protokol = utils.protokolHttps;
    final String baseUrl = utils.simpegDomain;
    final String path = utils.getDataAsisten;
    final String url = '$protokol$baseUrl$path';
    dio.interceptors.add(SlowNetworkInterceptor());
    final response = await dio.get(
      url,
      options: Options(
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    final data = response.data['data'];

    for (var value in data) {
      listData.add(
        AsistenModel(
          nip: value['nip'],
          nama: value['nama'],
          jabatan: value['jabatan'],
        ),
      );
    }

    return listData;
  }
}
