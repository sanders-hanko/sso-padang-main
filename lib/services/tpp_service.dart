import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:http/http.dart' as http;

class TppService {
  final Utils _utility = Utils();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  late Map<String, dynamic> _user = {};

  late Map<String, dynamic> _dataTpp = {};

  late List dataCoreValue = [];

  late List dataKegiatan = [];

  DateTime now = DateTime.now();

  Future<Map<String, dynamic>> getProfile(int bulan, int tahun) async {
    final user = await _storage.read(key: 'user');

    final nip = jsonDecode(user!)['nip'];

    final String authority = _utility.simpegDomain;

    final String unencodedPath = '${_utility.profilePegawaiPath}$nip';

    final url = Uri.https(authority, unencodedPath);

    final response = await http.get(url);

    if (response.statusCode == 200 && jsonDecode(response.body)['success']) {
      final data = jsonDecode(response.body)['data'];
      _user = {
        'nip': data['NIP_BARU'],
        'unor_induk_id': data['UNOR_INDUK_ID'],
        'unor_induk_nama': data['UNOR_INDUK_NAMA'],
        'jabatan_nama': data['JABATAN_NAMA'],
        'jenis_jabatan_id': data['JENIS_JABATAN_ID'],
        'tahun': tahun.toString(),
        'bulan': bulan.toString(),
      };
    }

    return _user;
  }

  Future<Map<String, dynamic>> getTpp(int bulan, int tahun) async {
    final Map<String, dynamic> user = await getProfile(bulan, tahun);

    final String? token = await _storage.read(key: 'token');

    final String authority = _utility.simpegDomain;

    final String unencodedPath = _utility.getTpp;

    final url = Uri.https(authority, unencodedPath);

    final response = await http.post(url, body: user, headers: {
      'Secret-Key':
          'hmaoFUgrn/x+RqFsoyNnD7hgFpxzKamu9A6534nlrUU4rfrvqKGvigHShj5nYEGfeUGRjOv/OQIuuiPO7qXwJA==',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200 && jsonDecode(response.body)['success']) {
      _dataTpp = jsonDecode(response.body);
    }

    return _dataTpp;
  }

  Future<List> getDataCoreValue() async {
    final utility = Utils();

    String authority = utility.tppDomain;

    String unencodedPath = 'api/aktivitas-harian/pegawai/core-value';

    final url = Uri.http(authority, unencodedPath);

    final response =
        await http.get(url, headers: {'accept': 'application/json'});

    if (response.statusCode == HttpStatus.ok) {
      dataCoreValue = jsonDecode(response.body)['data'];
    }

    return dataCoreValue;
  }

  Future<List> getDataKegiatan(String id) async {
    final utility = Utils();

    String authority = utility.tppDomain;

    String unencodedPath = 'api/aktivitas-harian/pegawai/kegiatan/$id';

    final url = Uri.http(authority, unencodedPath);

    final response =
    await http.get(url, headers: {'accept': 'application/json'});

    if (response.statusCode == HttpStatus.ok) {
      dataCoreValue = jsonDecode(response.body)['data'];
    }

    return dataCoreValue;
  }
}
