import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:super_app/Utils/sso_ui.dart';
import 'package:super_app/Utils/utils.dart';

List<Widget> listDataRiwayat = [];
bool isRequestingData = true;

class RiwayatJabatan extends StatefulWidget {
  const RiwayatJabatan({super.key});

  @override
  State<RiwayatJabatan> createState() => RiwayatJabatanState();
}

class RiwayatJabatanState extends State<RiwayatJabatan> {
  @override
  void initState() {
    dataRiwayat();
    super.initState();
  }

  @override
  void dispose() {
    isRequestingData = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        // toolbarHeight: 0.1,
        backgroundColor: Colors.white,
        border: Border(bottom: BorderSide.none),
        previousPageTitle: 'Pegawai',
        middle: Text('Riwayat Jabatan'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    children: listDataRiwayat,
                  ),
                ),
              ],
            ),
            isRequestingData
                ? LinearProgressIndicator(
                    color: Colors.blueAccent.shade200,
                  )
                : const Stack(),
          ],
        ),
      ),
    );
  }

  void dataRiwayat() async {
    const storage = FlutterSecureStorage();
    if (kDebugMode) {
      print('reading user data from storage...');
    }
    await storage.read(key: 'user').then((value) async {
      if (kDebugMode) {
        print('done.');
      }
      final Map<String, dynamic> json = jsonDecode(value!);
      var url = Uri.https(
        Utils().simpegDomain,
        '/api/v1/riwayat-jabatan/${json['nip']}',
      );
      if (kDebugMode) {
        print('reading token data from storage...');
      }
      await storage.read(key: 'token').then((value) async {
        if (kDebugMode) {
          print('done.');
          print('requesting data riwayat jabatan...');
        }
        await http.get(url, headers: {'Authorization': 'Bearer $value'}).then(
            (value) {
          if (kDebugMode) {
            print('done');
          }
          if (value.statusCode == 200 && jsonDecode(value.body)['success']) {
            if (kDebugMode) {
              print('statusCode 200');
              print('success true');
            }
            listDataRiwayat.clear();
            // listDataRiwayat.add(TextFormField());
            jsonDecode(value.body)['data'].forEach((value) {
              var hariTanggal = DateTime.parse(value['JABATAN_TMT']).day;
              var bulanTanggal = value['JABATAN_TMT_MONTH_NAME'];
              var tahunTanggal = DateTime.parse(value['JABATAN_TMT']).year;
              var perangkatDaerah = value['UNOR_INDUK_NAMA'] == ''
                  ? value['UNOR_NAMA']
                  : value['UNOR_INDUK_NAMA'];
              var unitOrganisasi = value['UNOR_NAMA'] ?? '-';
              setState(() {
                listDataRiwayat.add(
                  PdgCard(
                    header: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: CupertinoListTile(
                        leading: Text(
                          '$tahunTanggal',
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        title: Text(
                          '${value['JABATAN_NAMA']}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        subtitle: Text(
                          unitOrganisasi,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ),
                    body: [
                      InlineInfo(
                        title: 'Eselon',
                        value: '${value['ESELON'] ?? '-'}',
                      ),
                      InlineInfo(
                        title: 'Tmt jabatan',
                        value: '$hariTanggal $bulanTanggal $tahunTanggal',
                      ),
                      const InlineInfo(
                        title: 'Jenis Jabatan',
                        value: '-',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            perangkatDaerah,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
            });
            setState(() {
              isRequestingData = false;
            });
          } else {
            if (kDebugMode) {
              print('statusCode ${value.statusCode}');
              print('success false');
            }
          }
        });
      });
    });
  }
}
