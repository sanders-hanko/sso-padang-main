import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:super_app/Utils/utils.dart';

class AktivitasService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Utils utils = Utils();
  late String authority;
  late String unencodedPath;
  late String secretKey;
  late String? user;
  late String nip;
  late Uri url;
  late MultipartRequest request;
  late StreamedResponse response;
  late List listAktivitas = [];
  late String nilai = '-';

  Future<bool> storeAktivitas(
      String nipAtasan, String tanggal, XFile file, String aktivitas, String idKegiatan) async {
    user = await storage.read(key: 'user');
    nip = jsonDecode(user!)['nip'];
    authority = utils.tppDomain;
    unencodedPath = utils.storeAktivitasPegawai;
    secretKey = utils.secretKey;
    url = Uri.https(authority, unencodedPath);
    request = MultipartRequest('POST', url);
    request.files.add(await MultipartFile.fromPath('foto', file.path));
    request.headers.addAll({'Secret-Key': secretKey});
    request.fields.addAll({
      'nip': nip,
      'aktivitas': aktivitas,
      'nip_atasan': nipAtasan,
      'tanggal': tanggal,
      'id_kegiatan': idKegiatan,
    });

    response = await request.send().timeout(const Duration(seconds: 120),
        onTimeout: () {
      return timeOutResponse(
        httpMethod: 'MULTIPART POST',
        error: 'Request Time Out',
        url: url,
      );
    });

    // final responseBytes = await response.stream.toBytes();
    // final responseString = utf8.decode(responseBytes);

    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 408) {
      await storage.write(key: 'message', value: 'Waktu koneksi habis.');
      return false;
    } else {
      await storage.write(key: 'message', value: 'Terjadi kesalahan.');
      return false;
    }
  }

  Future<List> getAktivitasPegawai(
      String nip, String tanggal, bool akses) async {
    if (akses) {
      authority = utils.tppDomain;
      unencodedPath = utils.getAktivitasPegawai;
      url = Uri.https(authority, unencodedPath);
      secretKey = utils.secretKey;
      final response = await http.post(
        url,
        headers: {'Secret-Key': secretKey},
        body: {
          'nip': nip,
          'tanggal': tanggal,
        },
      ).timeout(
        const Duration(seconds: 120),
        onTimeout: () {
          return http.Response('Timeout', 408);
        },
      );

      if (response.statusCode == 200) {
        listAktivitas = jsonDecode(response.body)['data'].length > 0
            ? jsonDecode(response.body)['data']['aktivitas']
            : [];
      } else if (response.statusCode == 408) {
        listAktivitas = [
          {'timeout': true}
        ];
      }
    }

    await Future.delayed(const Duration(seconds: 1));

    return listAktivitas;
  }

  Future<String> getNilaiPegawai(String tanggal) async {
    final data = await storage.read(key: 'user');
    final nip = jsonDecode(data!)['nip'];
    authority = utils.tppDomain;
    unencodedPath = utils.nilaiAktivitasPegawai;
    secretKey = utils.secretKey;
    url = Uri.https(authority, unencodedPath);
    final response = await http.post(
      url,
      body: {
        'nip': nip,
        'tanggal': tanggal,
      },
      headers: {'Secret-Key': secretKey},
    );

    if (kDebugMode) {
      print('response.body');
      print(tanggal);
      print(response.statusCode);
      print(response.body);
    }

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['data'].length > 0 &&
          jsonDecode(response.body)['data'][0]['nilai'] != null) {
        return jsonDecode(response.body)['data'][0]['nilai'].toString();
      }
    }

    return nilai;
  }

  Future<List> getAktivitasBawahan(String tanggal, bool akses) async {
    if (akses) {
      final data = await storage.read(key: 'user');
      nip = jsonDecode(data!)['nip'];
      authority = utils.tppDomain;
      unencodedPath = utils.getAktivitasAtasan;
      secretKey = utils.secretKey;
      url = Uri.https(authority, unencodedPath);


      final response = await http.post(url, body: {
        'nip_atasan': nip,
        'tanggal': tanggal,
      }, headers: {
        'Secret-Key': secretKey
      });

      if (response.statusCode == 200) {
        listAktivitas = jsonDecode(response.body)['data'];
      } else if (response.statusCode == 408) {
        listAktivitas = [
          {'timeout': true}
        ];
      }
    }

    return listAktivitas;
  }

  Future<bool> simpanNilai(
      String nipBawahan, String tanggal, String nilai) async {
    final data = await storage.read(key: 'user');
    nip = jsonDecode(data!)['nip'];
    authority = utils.tppDomain;
    unencodedPath = utils.storeAktivitasAtasan;
    secretKey = utils.secretKey;
    url = Uri.https(authority, unencodedPath);
    final response = await http.post(url, body: {
      'nip_atasan': nip,
      'nip': nipBawahan,
      'tanggal': tanggal,
      'nilai': nilai,
    }, headers: {
      'Secret-Key': secretKey
    });

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }

  StreamedResponse timeOutResponse({
    required String httpMethod,
    required dynamic error,
    required Uri url,
  }) {
    Map<String, dynamic> body = {};

    int statusCode = 408;
    Uri destination = url;
    String json = jsonEncode(body);

    return StreamedResponse(
      Stream.value(json.codeUnits),
      statusCode,
      request: Request(httpMethod, destination),
    );
  }
}
