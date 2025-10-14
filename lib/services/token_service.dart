import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/Utils/utils.dart';

class TokenService {
  late String token;
  late String refreshToken;

  final Utils utils = Utils();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  void checkToken() async {

    final String authority = utils.simpegDomain;
    final String unencodedPath = utils.verifyToken;
    final String? token = await storage.read(key: 'token');

    if (kDebugMode) {
      print(authority);
      print(unencodedPath);
      print(token);
    }

  }

  void getToken(){

  }
}