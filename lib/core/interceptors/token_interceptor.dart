import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../Utils/utils.dart';

class TokenInterceptor extends Interceptor {
  final Utils utils;
  final FlutterSecureStorage storage;
  final Dio dio;

  TokenInterceptor(this.utils, this.storage, this.dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final List<String> path = utils.authPath;
    final String? token = await storage.read(key: 'token');

    options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    options.connectTimeout = const Duration(seconds: 60);
    options.receiveTimeout = const Duration(seconds: 60);
    options.sendTimeout = const Duration(seconds: 60);

    if (!path.contains(options.path)) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    RequestOptions requestOptions = err.requestOptions;
    final List<String> path = utils.authPath;

    if (kDebugMode) {
      print('error');
    }

    if (err.response?.statusCode == HttpStatus.unauthorized) {
      if (kDebugMode) {
        print('unauthorized');
      }

      if (kDebugMode) {
        print(path);
        print(err.requestOptions.path);
      }

      if (!path.contains(err.requestOptions.path)) {
        if (kDebugMode) {
          print('refreshing token');
        }
        final bool refreshSuccess = await refreshToken();
        if (refreshSuccess) {
          if (kDebugMode) {
            print('refreshing token succeed');
          }
          final response = await dio.fetch(requestOptions);
          return handler.resolve(response);
        }
      }
    }

    if (err.response?.statusCode == HttpStatus.badRequest) {
      final DioException error = DioException(
        requestOptions: requestOptions,
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: requestOptions,
          data: {'message': err.response?.data['message']},
        ),
      );
      return handler.next(error);
    }

    return handler.next(err);
  }

  Future<bool> refreshToken() async {

    final String protokol = utils.protokolHttps;
    final String domain = utils.simpegDomain;
    final String path = utils.refreshToken;
    final String clientId = utils.clientId;
    final String clientSecret = utils.clientSecret;
    final String? refreshToken = await storage.read(key: 'refreshToken');
    final user = await storage.read(key: 'user');
    final String url = protokol + domain + path + jsonDecode(user!)['nip'];

    final Map<String, dynamic> data = {
      'refresh_token': refreshToken,
      'client_id': clientId,
      'client_secret': clientSecret,
    };

    if (kDebugMode) {
      print(url);
    }

    final response = await dio.post(url, data: data);

    if (kDebugMode) {
      print(response.statusCode);
      print(response.data);
    }

    if (response.statusCode == HttpStatus.ok) {
      await storage.write(
          key: 'refreshToken', value: response.data['refresh_token']);
      await storage.write(key: 'token', value: response.data['access_token']);
      final String expiredIn =
          "Token expires in ${DateTime.now().add(Duration(seconds: response.data['expires_in']))}";
      if (kDebugMode) {
        print("Token updated");
        print(expiredIn);
      }
      return true;
    }

    return false;
  }
}
