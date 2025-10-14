import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/sso_ui.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/izin/create_izin.dart';
// import 'package:super_app/pages/izin/index_izin_bawahan.dart';
import 'package:super_app/services/izin_service.dart';
// import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

class IndexIzin extends StatefulWidget {
  const IndexIzin({super.key});

  @override
  State<IndexIzin> createState() => StateIndexIzin();
}

class StateIndexIzin extends State<IndexIzin> {
  final IzinService _service = IzinService();

  late List<Widget> izin = [];

  late String izinPegawaiBadge = '';

  late bool izinPegawaiPermission = false;

  Future<void> refresh() async {
    setState(() {});
  }

  Future<void> getJumlahIzin() async {
    const storage = FlutterSecureStorage();
    final user = await storage.read(key: 'user');
    var url = Uri.http(Utils().presensiDomain,
        '${Utils().getJumlahIzinPegawai}/${jsonDecode(user!)["nip"]}/0');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success'] &&
          jsonDecode(response.body)['data']['jumlah'] > 0) {
        setState(() {
          izinPegawaiBadge =
              jsonDecode(response.body)['data']['jumlah'].toString();
        });
      }
    } else {
      setState(() {
        izinPegawaiBadge = '';
      });
    }
  }

  Future<void> checkPermission() async {
    const storage = FlutterSecureStorage();
    final tugasPermission = await storage.read(key: 'izinPegawaiPermission');

    if (tugasPermission == '1') {
      setState(() {
        izinPegawaiPermission = true;
        getJumlahIzin();
      });
    }
  }

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final textSize = screenWidth * 0.024 + 2;
    final iconSize = screenWidth * 0.08;

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: Border(bottom: BorderSide.none),
        previousPageTitle: 'Presensi',
        middle: Text('Izin Pegawai'),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute(
              builder: (context) {
                return const CreateIzin();
              },
            ),
          ).then((value) {
            Future.delayed(const Duration(seconds: 1), () {
              setState(() {});
            });
          });
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(12.0),
        ),
        child: Icon(
          Icons.add,
          size: iconSize,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
            future: _service.getIzin(),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.white,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return refresh();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/json_image/animation_sibangkom_load.json',
                              width: 200,
                              height: 200,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Memeriksa data...",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (snapshot.data!.isEmpty) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.white,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return refresh();
                    },
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/json_image/animation_not_found.json',
                              width: 200,
                              height: 200,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Izin belum ada.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (snapshot.data?[0]['timeout'] != null) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.white,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return refresh();
                    },
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/json_image/animation_not_found.json',
                              width: 200,
                              height: 200,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Ops.\nWaktu koneksi habis.\nTarik kebawah untuk memuat ulang.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }

              izin.clear();

              snapshot.data?.forEach((element) {
                final tanggalMulai =
                    Utils().formatIndonesia(element['tanggal_mulai']);
                final tanggalSelesai =
                    Utils().formatIndonesia(element['tanggal_selesai']);
                final title = tanggalMulai == tanggalSelesai
                    ? tanggalMulai
                    : '$tanggalMulai - $tanggalSelesai';
                final list = PdgCard(
                  header: Header(
                    title: title,
                    trailing: const Text(''),
                  ),
                  body: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Jenis Izin ',
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'Atasan ',
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'Status ',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                ' ${element['jenis']}',
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                ' ${element['nama_atasan']}',
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                ' ${element['keterangan']}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: element['status'] == 1
                                      ? Colors.green
                                      : (element['status'] == 2
                                          ? Colors.red
                                          : Colors.orange),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ],
                );
                izin.add(list);
              });

              return Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: CupertinoColors.white,
                ),
                child: RefreshIndicator(
                    onRefresh: () {
                      return refresh();
                    },
                    child: ListView(children: izin)),
              );
            }),
      ),
    );
  }
}
