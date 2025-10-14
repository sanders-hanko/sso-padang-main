import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/models/profile_pegawai_model.dart';

class ProfilePegawaiService {

  Future<ProfilePegawai> getUsers() async {

    var storage = const FlutterSecureStorage();

    var token = await storage.read(key: 'token');

    var user = await storage.read(key: 'user');

    var pnsId = jsonDecode(user!)['id'];

    var apiUrl = Uri.https(Utils().simpegDomain,
        '${Utils().profilePegawaiPath}$pnsId');

    final response =
        await http.get(apiUrl, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return ProfilePegawai.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load data pegawai');
    }
  }
}
