import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/di/injector.dart';
import 'package:super_app/core/interceptors/token_interceptor.dart';
import 'package:super_app/features/etpp/application/blocs/etpp_bloc/etpp_bloc.dart';
import 'package:super_app/features/etpp/application/models/etpp_model.dart';
import 'package:super_app/core/global_variables.dart';
import 'package:super_app/features/etpp/application/variables.dart';

void initEtpp(BuildContext context, String tahun, String bulan) {
  context.read<EtppBloc>().add(EtppEvent.fetch(tahun, bulan));
}

Future<EtppModel> fetchData(String tahun, String bulan) async {
  dio.interceptors.add(getIt<TokenInterceptor>());
  final response = await dio.post(path, data: {
    'tahun': tahun,
    'bulan': bulan,
  });

  if (kDebugMode) {
    print(tahun);
    print(bulan);
    print(response.data);
  }

  return EtppModel.fromJson(response.data['data']);
}
