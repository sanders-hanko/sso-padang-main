import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Utils utils = Utils();

  Future<bool> updatePassword(String oldP, String newP, String confirmP) async {
    final user = await storage.read(key: 'user');
    final uuid = await storage.read(key: 'uuid');
    final nip = jsonDecode(user!)['nip'];
    final String authority = utils.simpegDomain;
    final String unencodedPath = utils.updatePassword;
    final url = Uri.https(authority, unencodedPath);
    final response = await http.post(url, body: {
      'nip': nip.toString(),
      'password_lama': oldP,
      'password_baru': newP,
      'password_baru_confirmation': confirmP,
      'uuid': uuid.toString(),
    });

    if (response.statusCode == 200 && jsonDecode(response.body)['success']) {
      return true;
    } else if (response.statusCode == 400 &&
        !jsonDecode(response.body)['success']) {
      await storage.write(
          key: 'message', value: jsonDecode(response.body)['message']);
    }

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    return false;
  }
}
