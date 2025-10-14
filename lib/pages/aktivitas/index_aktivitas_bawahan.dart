import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/pages/aktivitas/list_aktivitas_bawahan.dart';
import 'package:super_app/services/aktivitas_service.dart';

import '../../Utils/utils.dart';

final List<String> _listNamaBulan = <String>[];

final List<int> _listBulan = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

int _indexSelectedBulan = 0;

class IndexAktivitasBawahan extends StatefulWidget {
  const IndexAktivitasBawahan({super.key});

  @override
  State<IndexAktivitasBawahan> createState() => StateIndexAktivitasBawahan();
}

class StateIndexAktivitasBawahan extends State<IndexAktivitasBawahan> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final AktivitasService _service = AktivitasService();
  final Utils utils = Utils();
  late List<Widget> listAktivitas = [];
  late String namaBulan = 'Januari';
  late String tanggal = '';
  late String nip = '';
  late String bulan = '1';
  late bool setBulanComplete = false;

  Future<void> setBulan() async {
    final String? user = await _storage.read(key: 'user');
    final DateTime date = DateTime.now();
    final int intTahun = date.year;
    final int intBulan = date.month - 1;
    final String stringBulan =
        '$intBulan'.length == 1 ? '0$intBulan' : '$intBulan';

    if (kDebugMode) {
      print('stringBulan');
      print(stringBulan);
    }

    nip = jsonDecode(user!)['nip'];
    bulan = stringBulan;
    namaBulan = utils.namaBulan(intBulan);
    tanggal = '$intTahun-$stringBulan';
    if (kDebugMode) {
      print(intBulan);
      print(tanggal);
    }
    setBulanComplete = true;

    for (var val in _listBulan) {
      _listNamaBulan.add(utils.namaBulan(val));
    }

    _indexSelectedBulan = intBulan - 1;

    setState(() {});
  }

  void pilihBulan() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 216.0,
        // padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 32.0,
            scrollController: FixedExtentScrollController(
              initialItem: _indexSelectedBulan,
            ),
            onSelectedItemChanged: (value) {
              gantiBulan(value);
              if (kDebugMode) {
                print(value);
              }
            },
            children: List<Widget>.generate(
              _listNamaBulan.length,
              (int index) {
                return Text(
                  _listNamaBulan[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> gantiBulan(int index) async {
    await Future.delayed(const Duration(seconds: 2));
    namaBulan = _listNamaBulan[index];
    _indexSelectedBulan = index;
    final int intTahun = DateTime.now().year;
    final String stringBulan = '${_listBulan[index]}'.length == 1
        ? '0${_listBulan[index]}'
        : '${_listBulan[index]}';
    tanggal = '$intTahun-$stringBulan';
    refresh();
  }

  Future<void> refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    setBulan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        previousPageTitle: 'Kembali',
        middle: Text('Aktivitas Bawahan'),
        backgroundColor: CupertinoColors.white,
        border: Border.fromBorderSide(BorderSide.none),
      ),
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: _service.getAktivitasBawahan(tanggal, setBulanComplete),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
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

            listAktivitas.clear();

            listAktivitas.add(
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                decoration: const BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border(
                    bottom: BorderSide(width: 0.1),
                  ),
                ),
                child: CupertinoListTile(
                  backgroundColor: CupertinoColors.white,
                  title: Text('Aktivitas bulan $namaBulan'),
                  subtitle: const Text('Tap pada tombol untuk mengganti bulan'),
                  trailing: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CupertinoColors.white),
                        onPressed: () {
                          pilihBulan();
                        },
                        child: Text(namaBulan),
                      ),
                    ],
                  ),
                ),
              ),
            );

            if (snapshot.data!.isNotEmpty) {
              if (snapshot.data?[0]['timeout'] == null) {
                late List<Widget> listData = [];

                late int index = 1;

                snapshot.data?.forEach(
                  (element) {
                    listData.add(
                      CupertinoListTile(
                        title: Text(element['nama']),
                        subtitle: Text(
                          element['nip'],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return ListAktivitasBawahan(
                                  nama: element['nama'],
                                  aktivitas: element['aktivitas_harian'],
                                  nilai: element['nilai'] == null
                                      ? '-'
                                      : element['nilai'].toString(),
                                  nipBawahan: element['nip'],
                                  tanggal: element['tanggal'],
                                );
                              },
                            ),
                          ).then((val) {
                            setState(() {});
                          });
                        },
                        trailing: Text.rich(
                          TextSpan(
                              text: '${element['jumlah_aktivitas']} aktivitas',
                              children: [
                                const TextSpan(text: '('),
                                TextSpan(
                                  text: element['nilai'] == null
                                      ? '-'
                                      : element['nilai'].toString(),
                                  style: TextStyle(
                                    color: element['nilai'] == null
                                        ? CupertinoColors.black
                                        : CupertinoColors.activeGreen,
                                  ),
                                ),
                                const TextSpan(text: ')'),
                              ]),
                        ),
                      ),
                    );

                    if (index != snapshot.data?.length) {
                      listData.add(
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: const Divider(
                            height: 0.0,
                            color: CupertinoColors.systemFill,
                          ),
                        ),
                      );
                    }

                    index++;
                  },
                );

                listAktivitas.add(
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: const BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      children: listData,
                    ),
                  ),
                );
              } else {
                listAktivitas.add(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                        children: [Text('Waktu koneksi habis. Coba lagi!')],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('')],
                      ),
                    ],
                  ),
                );
                return RefreshIndicator(
                  child: ListView(
                    children: listAktivitas,
                  ),
                  onRefresh: () {
                    return refresh();
                  },
                );
              }
            } else {
              if (kDebugMode) {
                print('data is empty');
              }
            }

            if (listAktivitas.length == 1) {
              listAktivitas.add(
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                      children: [Text('Belum ada aktivitas bawahan.')],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('')],
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              child: ListView(
                children: listAktivitas,
              ),
              onRefresh: () {
                return refresh();
              },
            );
          },
        ),
      ),
    );
  }
}
