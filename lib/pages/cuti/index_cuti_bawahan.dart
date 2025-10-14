import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:super_app/services/cuti_service.dart';
import 'package:super_app/Utils/sso_ui.dart';

class IndexCutiBawahan extends StatefulWidget {
  const IndexCutiBawahan({super.key});

  @override
  State<IndexCutiBawahan> createState() => StateIndexCutiBawahan();
}

class StateIndexCutiBawahan extends State<IndexCutiBawahan> {
  late List<Widget> listViewData = [];
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final CutiService _cutiService = CutiService();

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
            TextSpan(text: 'Cuti $nama akan '),
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
            TextSpan(text: 'Cuti $nama akan '),
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
                  final success = await _cutiService.updateCuti(id, status);
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

  Future<List> getListCutiPegawai() async {
    if (kDebugMode) {
      print('list cuti pegawai');
    }

    const storage = FlutterSecureStorage();
    final user = await storage.read(key: 'user');
    final nip = jsonDecode(user!)['nip'];
    final url =
        Uri.https(Utils().presensiDomain, '${Utils().getListCutiPegawai}/$nip');
    late List listCutiPegawai = [];

    if (kDebugMode) {
      print(url);
    }

    try {
      final response = await http.get(url).timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (kDebugMode) {
        print('status code cuti : ${response.statusCode}');
        print('data cuti : ${response.body}');
      }

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          listCutiPegawai = jsonDecode(response.body)['data'];
        }
      }
    } on TimeoutException catch (e) {
      return [
        {'timeout': e}
      ];
    }

    return listCutiPegawai;
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
    // const double textSize = 12;

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: Border(bottom: BorderSide.none),
        previousPageTitle: 'Kembali',
        middle: Text('Cuti Pegawai'),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: getListCutiPegawai(),
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

            snapshot.data?.forEach((element) {
              final String tanggalMulai =
                  Utils().formatIndonesia(element['tanggal_mulai']);
              final String tanggalSelesai =
                  Utils().formatIndonesia(element['tanggal_selesai']);
              final tanggal = (tanggalMulai == tanggalSelesai)
                  ? tanggalMulai
                  : '$tanggalMulai - $tanggalSelesai';

              final String statusCuti = element['status'] == 0
                  ? 'Menunggu persetujuan.'
                  : (element['status'] == 1
                      ? 'Cuti diterima.'
                      : 'Cuti ditolak.');

              final MaterialColor warnaStatus = element['status'] == 0
                  ? Colors.orange
                  : (element['status'] == 1 ? Colors.green : Colors.red);

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

              final list = PdgCard(
                header: Header(
                  title: element['nama_pegawai'],
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
                          // textSize: textSize + 8,
                        ),
                        const SizedBox(height: 8.0),
                        Info(
                          title: 'Jenis Cuti',
                          value: element['jenis'],
                          // textSize: textSize + 8,
                        ),
                        const SizedBox(height: 8.0),
                        Info(
                          title: 'Tanggal',
                          value: tanggal,
                          // textSize: textSize + 8,
                        ),
                        const SizedBox(height: 8.0),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              statusCuti,
                              style: TextStyle(
                                color: warnaStatus,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: actionButton,
                        ),
                      ],
                    ),
                  ),
                ],
              );
              listViewData.add(list);
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
