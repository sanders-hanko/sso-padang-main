import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/aktivitas/create_aktivitas.dart';
import 'package:super_app/pages/aktivitas/detail_aktivitas.dart';
import 'package:super_app/pages/aktivitas/index_aktivitas_bawahan.dart';
import 'package:super_app/services/aktivitas_service.dart';

final List<String> _listNamaBulan = <String>[];

final List<int> _listBulan = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

int _indexSelectedBulan = 0;

class IndexAktivitas extends StatefulWidget {
  const IndexAktivitas({super.key});

  @override
  State<IndexAktivitas> createState() => StateIndexAktivitas();
}

class StateIndexAktivitas extends State<IndexAktivitas> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final AktivitasService _service = AktivitasService();
  final Utils utils = Utils();
  late String nilaiString = '-';
  late bool setBulanComplete = false;
  late String nip = '';
  late String tanggal = '';
  late String namaBulan = 'Januari';
  late String bulan = '1';
  late bool aktivitasPermission = false;
  late List<Widget> listAktivitas = [];
  late List<Widget> listFloatingButton = [];
  late String url;

  Future<List> cekAktivitas() async {
    final data =
        await _service.getAktivitasPegawai(nip, tanggal, setBulanComplete);
    await getNilai();
    return data;
  }

  Future<void> refresh() async {
    setState(() {});
  }

  Future<void> setBulan() async {
    final String? user = await _storage.read(key: 'user');
    final permission = await _storage.read(key: 'aktivitasPermission');
    final DateTime date = DateTime.now();
    final int intTahun = date.year;
    final int intBulan = date.month;
    final String stringBulan =
        '$intBulan'.length == 1 ? '0$intBulan' : '$intBulan';

    nip = jsonDecode(user!)['nip'];
    bulan = stringBulan;
    namaBulan = utils.namaBulan(intBulan);
    tanggal = '$intTahun-$stringBulan';
    setBulanComplete = true;
    url = Uri.https(utils.tppDomain, utils.fotoAktivitasPegawai).toString();

    for (var val in _listBulan) {
      _listNamaBulan.add(utils.namaBulan(val));
    }

    _indexSelectedBulan = intBulan - 1;

    listFloatingButton.clear();

    if (permission == '1') {
      listFloatingButton.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: CupertinoColors.white, // <-- Button color
            foregroundColor: Colors.blueAccent, // <-- Splash color
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const IndexAktivitasBawahan();
                },
              ),
            ).then((value) {
              if (value != null) {
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {});
                });
              }
            });
          },
          child: Icon(
            CupertinoIcons.square_list,
            color: Colors.blue.shade700,
          ),
        ),
      );
      listFloatingButton.add(const SizedBox(width: 16.0));

      listFloatingButton.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: CupertinoColors.white,
            foregroundColor: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const CreateAktivitas();
                },
              ),
            ).then((value) {
              if (value != null) {
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {});
                });
              }
            });
          },
          child: Icon(
            CupertinoIcons.add,
            color: Colors.blue.shade700,
          ),
        ),
      );
      listFloatingButton.add(const SizedBox(width: 32.0));
    } else {
      listFloatingButton.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: CupertinoColors.white,
            foregroundColor: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const CreateAktivitas();
                },
              ),
            ).then((value) {
              if (value != null) {
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {});
                });
              }
            });
          },
          child: Icon(
            CupertinoIcons.add,
            color: Colors.blue.shade700,
          ),
        ),
      );
      listFloatingButton.add(const SizedBox(width: 32.0));
    }

    setState(() {});
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

  Future<void> getNilai() async {
    final nilai = await _service.getNilaiPegawai(tanggal);
    nilaiString = nilai != 'null' ? nilai : '-';
    // setState(() {});
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
        backgroundColor: CupertinoColors.white,
        border: Border(bottom: BorderSide.none),
        previousPageTitle: 'Beranda',
        middle: Text('Aktivitas Harian'),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: listFloatingButton,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: cekAktivitas(),
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
              listAktivitas.add(
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: const BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      )),
                  child: CupertinoListTile(
                    title: Text(
                      'Nilai bulan $namaBulan',
                    ),
                    subtitle: const Text(
                      'Nilai aktivitas harian maksimal adalah 15.',
                    ),
                    trailing: Text(
                      nilaiString,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );

              listAktivitas.add(
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: const Divider(
                    height: 0.0,
                    color: CupertinoColors.systemFill,
                  ),
                ),
              );

              if (snapshot.data?[0]['timeout'] == null) {
                late List<Widget> listData = [];

                late int index = 1;

                snapshot.data?.forEach(
                  (element) {
                    final tgl = utils.formatIndonesia(element['tanggal']);
                    listData.add(
                      CupertinoListTile(
                        title: Text(tgl),
                        subtitle: Text(
                          element['nama'],
                        ),
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return DetailAktivitas(
                                  id: 'fotoAktivitas$index',
                                  url: '$url${element['foto']}',
                                  aktivitas: '${element['nama']}',
                                  tanggal:
                                      utils.formatIndonesia(element['tanggal']),
                                );
                              },
                            ),
                          );
                        },
                        trailing: Hero(
                          tag: 'fotoAktivitas$index',
                          child: Image.network(
                            '$url${element['foto']}',
                            height: 30.0,
                          ),
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
                      children: [Text('Belum ada Aktivitas.')],
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
