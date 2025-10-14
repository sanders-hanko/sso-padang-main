import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:http/http.dart' as http;

class PresensiService {
  Future<List> getDataRiwayat(int bulan, int tahun) async {
    const storage = FlutterSecureStorage();
    final user = await storage.read(key: 'user');
    final nip = jsonDecode(user!)['nip'];
    final tanggalAwal = DateTime(tahun, DateTime.now().month, 1);
    final String tglAwal = '${tanggalAwal.year}-$bulan-${tanggalAwal.day}';
    final String authority = Utils().presensiDomain;
    final String unencodedPath = "${Utils().dataRiwayat}/$nip/$tglAwal/0";
    final url = Uri.https(authority, unencodedPath);
    final response = await http.get(url);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['kalender'] != null) {
      return jsonDecode(response.body)[0]['kalender'];
    }
    return [];
  }
}
