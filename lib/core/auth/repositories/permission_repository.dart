import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/core/auth/models/permission_model.dart';
import 'package:super_app/core/global_variables.dart';
import 'package:super_app/core/interceptors/token_interceptor.dart';
import '../../di/injector.dart';

class PermissionRepository {
  final Utils utils;
  final Dio dio;
  PermissionRepository(this.dio, this.utils);

  Future<List<PermissionModel>?> fetch() async {

    final String protokol = utils.protokolHttps;
    final String domain = utils.simpegDomain;
    final String path = utils.getPermission;
    final String url = protokol + domain + path;
    late List<PermissionModel>? returnData = [];

    dio.interceptors.add(getIt<TokenInterceptor>());

    final response = await dio.get(url);

    await storage.write(key: 'permissions', value: jsonEncode(response.data['data']));

    final List<dynamic> data = response.data['data'];

    for (var val in data) {
      returnData.add(PermissionModel.fromJson(val));
    }

    return returnData;
  }
}
