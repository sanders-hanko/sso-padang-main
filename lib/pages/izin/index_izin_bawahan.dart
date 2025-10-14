import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:super_app/services/izin_service.dart';
import 'package:super_app/Utils/sso_ui.dart';

class IndexIzinBawahan extends StatefulWidget {
  const IndexIzinBawahan({super.key});

  @override
  State<IndexIzinBawahan> createState() => StateIndexIzinBawahan();
}

class StateIndexIzinBawahan extends State<IndexIzinBawahan> {
  late List<Widget> listViewData = [];

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final IzinService _izinService = IzinService();

  late bool isUpdating = false;

  void confirm(BuildContext context, int id, String nama, int status) {
    late Widget pesan;
    if (status == 1) {
      pesan = RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
          ),
          children: [
            TextSpan(text: 'Izin $nama akan '),
            const TextSpan(
                text: 'diterima',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                )),
            const TextSpan(text: ', lanjutkan?'),
          ],
        ),
      );
    } else {
      pesan = RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
          ),
          children: [
            TextSpan(text: 'Izin $nama akan '),
            const TextSpan(
                text: 'ditolak',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )),
            const TextSpan(text: ', lanjutkan?'),
          ],
        ),
      );
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            final List<Widget> actionButton = [
              CupertinoButton(
                child: const Text(
                  'Batal',
                  style: TextStyle(color: CupertinoColors.systemRed),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoButton(
                child: const Text('Lanjutkan'),
                onPressed: () async {
                  setState(() {
                    isUpdating = true;
                  });
                  final success = await _izinService.updateIzin(id, status);
                  if (success) {
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        isUpdating = false;
                        Navigator.pop(context);
                      });
                    });
                  } else {
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        isUpdating = false;
                      });
                    });
                  }
                },
              ),
            ];

            return AlertDialog(
              title: const Text('Verifikasi'),
              content: pesan,
              actions: isUpdating
                  ? [
                      const Column(
                        children: [
                          Text(
                            'Memproses',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          LinearProgressIndicator(),
                        ],
                      ),
                    ]
                  : actionButton,
            );
          });
        }).then((value) => setState(() {}));
  }

  Future<List> getListIzin() async {
    if (kDebugMode) {
      print('list izin');
    }

    const storage = FlutterSecureStorage();
    final user = await storage.read(key: 'user');
    final nip = jsonDecode(user!)['nip'];
    final url =
        Uri.http(Utils().presensiDomain, '${Utils().getListIzinPegawai}/$nip');
    late List listIzinPegawai = [];

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('status code izin : ${response.statusCode}');
          print('body izin : ${response.body}');
          print('success : ${jsonDecode(response.body)['status'] == true}');
        }
        if (jsonDecode(response.body)['status'] == true) {
          listIzinPegawai = jsonDecode(response.body)['data'];
          if (kDebugMode) {
            print('list : $listIzinPegawai');
          }
        }
      }
    } on TimeoutException catch (e) {
      return [
        {'timeout': e}
      ];
    }

    await Future.delayed(const Duration(seconds: 2));

    return listIzinPegawai;
  }

  Future<void> refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: Border(bottom: BorderSide.none),
        previousPageTitle: 'Kembali',
        middle: Text('Izin Bawahan'),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: getListIzin(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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

            if (kDebugMode) {
              print(snapshot.data);
            }

            if (snapshot.data!.isEmpty) {
              if (kDebugMode) {
                print(snapshot.data.toString());
              }
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
                            'assets/json_image/animation_layanan.json',
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
                            "Tidak ada data.",
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

            listViewData.clear();

            snapshot.data!.forEach((element) {
              final tanggal = element['tanggal_mulai'] ==
                      element['tanggal_selesai']
                  ? element['tanggal_mulai']
                  : '${Utils().formatIndonesia(element['tanggal_mulai'])} sampai dengan ${Utils().formatIndonesia(element['tanggal_selesai'])}';
              final String status = element['status'] == 0
                  ? 'Izin menunggu persetujuan.'
                  : (element['status'] == 1
                      ? 'Izin diterima.'
                      : 'Izin ditolak.');
              final List<Widget> actionButton = element['status'] == 0
                  ? [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            surfaceTintColor: Colors.redAccent),
                        onPressed: () {
                          confirm(context, element['id'],
                              element['nama_pegawai'], 2);
                        },
                        child: const Text(
                          'Tolak',
                          style:
                              TextStyle(color: CupertinoColors.destructiveRed),
                        ),
                      ),
                      SizedBox(
                        width: 0.01 * screenWidth,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          confirm(context, element['id'],
                              element['nama_pegawai'], 1);
                        },
                        child: const Text(
                          'Terima',
                        ),
                      ),
                    ]
                  : [];
              final MaterialColor warnaKeterangan = element['status'] == 0
                  ? Colors.orange
                  : (element['status'] == 1 ? Colors.green : Colors.red);
              final Widget widgetCard = PdgCard(
                header: Header(
                  title: '${element['nama_pegawai']}',
                  trailing: const Text(''),
                ),
                body: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${element['nama_pegawai']}/${element['nip']} melaksanakan ${element['jenis']} pada tanggal $tanggal.',
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Keterangan:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                          color: warnaKeterangan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actionButton,
                  ),
                ],
              );
              listViewData.add(widgetCard);
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
                child: ListView(children: listViewData),
              ),
            );
          },
        ),
      ),
    );
  }
}
