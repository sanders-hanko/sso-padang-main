import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:http/http.dart' as http;

class IzinService {
  late List izinList = [];
  late List jenisIzinList = [];
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Utils utils = Utils();
  late List izinAbsensiBawahanList = [];
  late List izinLuarKantorBawahanList = [];

  Future<List> getJenisIzin() async {
    final utility = Utils();

    String authority = utility.presensiDomain;

    String unencodedPath = utility.getJenisIzin;

    final url = Uri.http(authority, unencodedPath);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == true) {
        jenisIzinList = jsonDecode(response.body)['data'];
      }
    }

    return jenisIzinList;
  }

  Future<List> getJenisIzinTlCp() async {
    final utility = Utils();

    String authority = utility.presensiDomain;

    String unencodedPath = utility.getJenisIzinTlCp;

    final url = Uri.http(authority, unencodedPath);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == true) {
        jenisIzinList = jsonDecode(response.body)['data'];
      }
    }

    return jenisIzinList;
  }

  Future<List> getIzin() async {
    const storage = FlutterSecureStorage();

    final data = await storage.read(key: 'user');

    final nip = jsonDecode(data!)['nip'];

    final utility = Utils();

    String authority = utility.presensiDomain;

    String unencodedPath = utility.getIzin;

    final url = Uri.https(authority, '$unencodedPath/$nip');

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (kDebugMode) {
        print(response.statusCode);
      }

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          izinList = jsonDecode(response.body)['data'];
        }
      }
    } on TimeoutException catch (e) {
      return [
        {'timeout': e}
      ];
    }

    await Future.delayed(const Duration(seconds: 2));

    return izinList;
  }

  Future<List> getIzinAbsensiBawahan(String status) async {
    izinAbsensiBawahanList.clear();

    final data = await storage.read(key: 'user');

    final nip = jsonDecode(data!)['nip'];

    String authority = utils.presensiDomain;

    String unencodedPath = utils.getIzinAbsensiBawahan;

    final url = Uri.https(authority, unencodedPath);

    if (kDebugMode) {
      print(nip);
      print(status);
    }

    try {
      final response = await http.post(url, body: {
        'nip': nip,
        'status': status,
      }).timeout(
        const Duration(
          seconds: 10,
        ),
      );

      if (kDebugMode) {
        print(response.statusCode);
      }

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['success'] == true) {
          izinAbsensiBawahanList = jsonDecode(response.body)['data'];
        }
      }
    } on TimeoutException catch (e) {
      return [
        {'timeout': e}
      ];
    }

    return izinAbsensiBawahanList;
  }

  Future<List> getIzinLuarKantorBawahan(String status) async {
    izinLuarKantorBawahanList.clear();

    final data = await storage.read(key: 'user');

    final nip = jsonDecode(data!)['nip'];

    String authority = utils.presensiDomain;

    String unencodedPath = utils.getAbsenLuarKantorBawahan;

    final url = Uri.https(authority, unencodedPath);

    if (kDebugMode) {
      print(nip);
      print(status);
    }

    try {
      final response = await http.post(url, body: {
        'nip': nip,
        'status': status,
      }).timeout(
        const Duration(
          seconds: 10,
        ),
      );

      if (kDebugMode) {
        print('body: ');
        print(response.body);
      }

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['success'] == true) {
          izinLuarKantorBawahanList = jsonDecode(response.body)['data'];
        }
      }
    } on TimeoutException catch (e) {
      return [
        {'timeout': e}
      ];
    }

    return izinLuarKantorBawahanList;
  }

  Future<bool> postIzin(int id, String tanggalMulai, String tanggalSelesai,
      String selectedAtasan) async {
    const storage = FlutterSecureStorage();

    final data = await storage.read(key: 'user');

    final nip = jsonDecode(data!)['nip'];

    final utility = Utils();

    String authority = utility.presensiDomain;

    String unencodedPath = utility.storeIzinPegawai;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(url, body: {
      'nip': nip,
      'jenis_izin': id.toString(),
      'tanggal_mulai': tanggalMulai,
      'tanggal_selesai': tanggalSelesai,
      'addressed_to': selectedAtasan,
    });

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == true) {
        return true;
      }
    }

    return false;
  }

  Future<bool> updateIzinTc(String id, String status) async {
    final data = await storage.read(key: 'user');

    final nip = jsonDecode(data!)['nip'];

    String authority = utils.presensiDomain;

    String unencodedPath = utils.updateIzinAbsensiBawahan;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(url, body: {
      'nip': nip,
      'id': id,
      'status': status,
    });

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success'] == true) {
        await Future.delayed(const Duration(seconds: 1));
        return true;
      }
    }

    await Future.delayed(const Duration(seconds: 1));

    return false;
  }

  Future<bool> updateAbsenLuarKantor(
    String id,
    String status,
    String jenis,
  ) async {
    String authority = utils.presensiDomain;

    String unencodedPath = utils.updateAbsenLuarKantor;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(url, body: {
      'id': id,
      'status': status,
      'jenis': jenis,
    });

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success'] == true) {
        await Future.delayed(const Duration(seconds: 1));
        return true;
      }
    }

    await Future.delayed(const Duration(seconds: 1));

    return false;
  }

  Future<bool> postIzinAbsensi(
    String id,
    String atasan,
    String alasan,
    String jenis,
    XFile file,
  ) async {
    final user = await storage.read(key: 'user');
    final nip = jsonDecode(user!)['nip'];
    String authority = utils.presensiDomain;

    String unencodedPath = utils.storeIzinAbsensi;

    final url = Uri.https(authority, unencodedPath);

    http.MultipartRequest request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    request.fields.addAll({
      'id': id,
      'nip': nip,
      'id_izin': jenis,
      'atasan': atasan,
      'alasan': alasan,
    });

    http.StreamedResponse response = await request.send();
    var responseBytes = await response.stream.toBytes();
    var responseString = utf8.decode(responseBytes);

    if (kDebugMode) {
      print(response.statusCode);
      print(responseString);
    }

    if (response.statusCode == 200) {
      if (jsonDecode(responseString)['success'] == true) {
        return true;
      }
    }else if(response.statusCode == 400 && jsonDecode(responseString)['success'] == false){
      await storage.write(key: 'message', value: jsonDecode(responseString)['message']);
    }

    return false;
  }

  Future<bool> updateIzin(int id, int status) async {
    final user = await storage.read(key: 'user');
    final url = Uri.https(utils.presensiDomain, utils.updateIzinPegawai);
    final response = await http.post(url, body: {
      'id': '$id',
      'nip': "${jsonDecode(user!)['nip']}",
      'status': '$status',
    });

    if (kDebugMode) {
      print('update status code : ${response.statusCode}');
    }

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success']) {
        return true;
      }
    }
    return false;
  }
}
