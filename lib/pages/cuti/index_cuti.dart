import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/sso_ui.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/cuti/create_cuti.dart';
import 'package:super_app/pages/cuti/index_cuti_bawahan.dart';
import 'package:super_app/services/cuti_service.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

class IndexCuti extends StatefulWidget {
  const IndexCuti({super.key});

  @override
  State<IndexCuti> createState() => StateIndexCuti();
}

class StateIndexCuti extends State<IndexCuti> {
  final CutiService _service = CutiService();

  late List<Widget> cuti = [];

  late String cutiPegawaiBadge = '';

  late bool cutiPegawaiPermission = false;

  Future<void> refresh() async {
    setState(() {});
  }

  Future<void> getJumlahCutiPegawai() async {
    if (kDebugMode) {
      print('getCuti');
    }
    const storage = FlutterSecureStorage();

    final user = await storage.read(key: 'user');

    var url = Uri.https(Utils().presensiDomain,
        '${Utils().getJumlahCutiPegawai}/${jsonDecode(user!)["nip"]}/0');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success'] &&
          jsonDecode(response.body)['data']['jumlah'] > 0) {
        setState(() {
          cutiPegawaiBadge =
              jsonDecode(response.body)['data']['jumlah'].toString();
        });
      }
    } else {
      setState(() {
        cutiPegawaiBadge = '';
      });
    }
  }

  void checkPermission() async {
    const storage = FlutterSecureStorage();
    final cutiPermission = await storage.read(key: 'cutiPegawaiPermission');

    if (cutiPermission == '1') {
      setState(() {
        cutiPegawaiPermission = true;
        getJumlahCutiPegawai();
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
    const double navbarTextSize = 14;
    // final navbarTextSize = (4.76 / 100) * screenWidth;
    const double textSize = 12;
    // final textSize = screenWidth * 0.024;
    const double iconSize = 30;
    // final iconSize = screenWidth * 0.08;
    // final extendSize = screenWidth * 0.22;
    // final headerHeight = iconSize + 20;

    final Widget listCutiPegawaiButton = Container(
      margin: EdgeInsets.all(0.01 * screenWidth),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute(
              builder: (context) {
                return const IndexCutiBawahan();
              },
            ),
          ).then((value) {
            Future.delayed(const Duration(seconds: 1), () {
              getJumlahCutiPegawai();
            });
          });
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20.0),
          backgroundColor: CupertinoColors.white,
          foregroundColor: Colors.blueAccent,
        ),
        child: badges.Badge(
          showBadge: cutiPegawaiBadge != '' ? true : false,
          position: badges.BadgePosition.topEnd(
            top: -(0.25 * iconSize),
            end: -(0.25 * iconSize),
          ),
          badgeContent: Text(
            cutiPegawaiBadge,
            style: const TextStyle(
              fontSize: textSize,
              color: CupertinoColors.white,
            ),
          ),
          child: const Icon(
            CupertinoIcons.square_list,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: Border(bottom: BorderSide.none),
        previousPageTitle: 'Beranda',
        middle: Text(
          'Cuti ASN',
          style: TextStyle(
            fontSize: navbarTextSize,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          cutiPegawaiPermission ? listCutiPegawaiButton : const Text(''),
          const SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(
                  builder: (context) {
                    return const CreateCuti();
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
              padding: const EdgeInsets.all(20),
              backgroundColor: CupertinoColors.white,
              foregroundColor: Colors.blueAccent,
            ),
            child: const Icon(
              Icons.add,
            ),
          ),
          const SizedBox(
            width: 32.0,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
            future: _service.getCuti(),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.extraLightBackgroundGray,
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
                              repeat: false,
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
                        const SizedBox(
                          height: 16.0,
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
                    color: CupertinoColors.extraLightBackgroundGray,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return refresh();
                    },
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('')],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/json_image/animation_layanan.json',
                                  repeat: false,
                                  width: 200.0,
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Belum ada cuti.')],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('')],
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
                              style: TextStyle(
                                fontSize: textSize,
                                // fontSize: textSize + 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }

              cuti.clear();

              snapshot.data?.forEach((element) {
                final tanggalMulai =
                    Utils().formatIndonesia(element['tanggal_mulai']);
                final tanggalSelesai =
                    Utils().formatIndonesia(element['tanggal_selesai']);
                final title = tanggalMulai == tanggalSelesai
                    ? tanggalMulai
                    : '$tanggalMulai - $tanggalSelesai';

                final String statusCuti = element['status'] == 1
                    ? 'Pengajuan cuti diterima.'
                    : (element['status'] == 2
                        ? 'Pengajuan cuti ditolak.'
                        : 'Status cuti saat ini menunggu verifikasi atasan.');

                final MaterialColor warnaStatus = element['status'] == 1
                    ? Colors.green
                    : (element['status'] == 2 ? Colors.red : Colors.orange);

                // final status =
                //     element['status'] == '1' ? 'Disetujui' : 'Menunggu';
                //
                // final color = element['status'] == '1'
                //     ? Colors.greenAccent.shade100
                //     : Colors.orangeAccent.shade100;

                final list = PdgCard(
                  header: Header(
                    title: title,
                    trailing: const Text(''),
                  ),
                  body: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Info(
                            title: 'Perihal',
                            value: element['perihal'],
                            // textSize: textSize,
                            // textSize: textSize + 8,
                          ),
                          const SizedBox(height: 8.0),
                          Info(
                            title: 'Jenis Cuti',
                            value: element['jenis'],
                            // textSize: textSize,
                            // textSize: textSize + 8,
                          ),
                          const SizedBox(height: 8.0),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(
                              bottom: 2.0,
                            ),
                            child: Text(
                              statusCuti,
                              style: TextStyle(
                                color: warnaStatus,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
                cuti.add(list);
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
                    child: ListView(children: cuti)),
              );
            }),
      ),
    );
  }
}
