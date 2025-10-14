import 'package:dio/dio.dart';
import 'package:super_app/features/surat/application/models/organisasi_model/organisasi_model.dart';
import '../../Utils/utils.dart';

class OrganisasiRepository {
  final Dio dio;
  final Utils utils;

  OrganisasiRepository(this.dio, this.utils);

  Future<List<OrganisasiModel>> getAll() async {
    final String protokol = utils.protokolHttps;
    final String baseUrl = utils.simpegDomain;
    final String path = utils.getMasterOrganisasi;
    final String url = '$protokol$baseUrl$path';

    final response = await dio.get(
      url,
      options: Options(
        receiveTimeout: const Duration(seconds: 10),
      ),
      queryParameters: {
        'q': 1,
      },
    );

    final data = response.data['data'];
    late List<OrganisasiModel> listData = [];

    for (var value in data) {
      listData.add(
        OrganisasiModel(
          id: value['UNOR_INDUK_ID'],
          namaOrganisasi: value['UNOR_INDUK_NAMA'],
          type: value['UNOR_INDUK_TYPE'],
        ),
      );
    }

    return listData;
  }
}

class SlowNetworkInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await Future.delayed(const Duration(milliseconds: 200));
    super.onRequest(options, handler);
  }
}
