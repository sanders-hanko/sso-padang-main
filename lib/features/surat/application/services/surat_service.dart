import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:super_app/core/interceptors/token_interceptor.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/global_variables.dart';

Future<void> kirimDisposisi(
  String suratId,
  String fromNip,
  String telitiSaran,
  String toNip,
) async {
  final path = utils.protokolHttps + utils.simpegDomain + utils.disposisiStore;

  final FormData formData = FormData.fromMap({
    'surat_masuk_id': suratId,
    'from_user': fromNip,
    'teliti_saran': telitiSaran,
    'to_user': toNip
  });

  dio.interceptors.add(getIt<TokenInterceptor>());
  final response = await dio.post(path, data: formData);
  debugPrint(response.statusCode.toString());
  debugPrint(response.data.toString());
}
