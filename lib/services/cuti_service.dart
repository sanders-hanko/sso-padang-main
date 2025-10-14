import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../Utils/utils.dart';
import '../core/global_variables.dart';

class CutiService {
  late List jenisCutiList = [];
  late List dataStruktural = [];
  late List cutiList = [];
  final Utils utils = Utils();

  Future<List> getJenisCuti() async {
    final utility = Utils();

    String authority = utility.presensiDomain;

    String unencodedPath = utility.getJenisCuti;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success'] == true) {
        jenisCutiList = jsonDecode(response.body)['data'];
      }
    }

    return jenisCutiList;
  }

  Future<List> getDataStruktural() async {
    final utility = Utils();

    const storage = FlutterSecureStorage();

    final data = await storage.read(key: 'user');

    final nip = jsonDecode(data!)['nip'];

    String authority = utility.simpegIP;

    String unencodedPath = 'api/v1${utility.getStruktural}$nip';

    final url = Uri.http(authority, unencodedPath);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success'] == true) {
        dataStruktural = jsonDecode(response.body)['data'];
      }
    }

    return dataStruktural;
  }

  Future<List> getCuti() async {
    const storage = FlutterSecureStorage();

    final data = await storage.read(key: 'user');

    final nip = jsonDecode(data!)['nip'];

    final utility = Utils();

    String authority = utility.presensiDomain;

    String unencodedPath = utility.getCuti;

    final url = Uri.https(authority, '$unencodedPath/$nip');

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('status code cuti : ${response.statusCode}');
          print('data cuti : ${response.body}');
        }

        if (jsonDecode(response.body)['status'] == true) {
          cutiList = jsonDecode(response.body)['data'];
        }
      }
    } on TimeoutException catch (e) {
      return [
        {'timeout': e}
      ];
    }

    await Future.delayed(const Duration(seconds: 1));

    return cutiList;
  }

  Future<bool> postCuti(int id, String atasan, String perihal, int jenis,
      String tanggalMulai, String tanggalSelesai) async {
    const storage = FlutterSecureStorage();

    final user = await storage.read(key: 'user');

    final nip = jsonDecode(user!)['nip'];

    final token = await storage.read(key: 'token');

    final utility = Utils();

    String authority = utility.presensiDomain;

    String unencodedPath = utility.storeCutiPegawai;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      'nip': nip,
      'atasan': atasan,
      'id_jenis_cuti': id.toString(),
      'perihal': perihal,
      'tanggal_mulai': tanggalMulai,
      'tanggal_selesai': tanggalSelesai,
    });

    if (kDebugMode) {
      print('status code : ${response.statusCode}');
      print('status code : ${response.body}');
    }

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == true) {
        return true;
      }
    }

    return false;
  }

  Future<bool> updateCuti(int id, int status) async {
    final user = await storage.read(key: 'user');
    if (kDebugMode) {
      print(user);
    }
    final url = Uri.https(utils.presensiDomain, utils.updateCutiPegawai);
    final response = await http.post(url, body: {
      'id': '$id',
      'nip': "${jsonDecode(user!)['nip']}",
      'status': '$status',
    });

    if (kDebugMode) {
      print('status code update : ${response.statusCode}');
      print('response body : ${response.body}');
    }

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success']) {
        return true;
      }
    }
    return false;
  }
}
