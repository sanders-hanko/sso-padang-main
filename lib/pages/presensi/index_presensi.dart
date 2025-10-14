import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/pages/presensi/create_presensi.dart';
import 'package:super_app/pages/presensi/index_izin_presensi.dart';
import 'package:super_app/services/presensi_service.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

final List<String> _listNamaBulan = <String>[];

final List<int> _listBulan = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

final List<int> _listTahun = <int>[2024, 2025];

int _indexSelectedBulan = 0;
int _indexSelectedTahun = 0;

class IndexPresensi extends StatefulWidget {
  const IndexPresensi({super.key});

  @override
  State<IndexPresensi> createState() => StatePresensi();
}

class StatePresensi extends State<IndexPresensi> {
  final PresensiService _service = PresensiService();

  final Utils utils = Utils();

  late String izinPegawaiBadge = '';

  late bool izinPegawaiPermission = false;

  late String bulan = '1';

  late String namaTahun = '-';

  late String namaBulan = 'Januari';

  List<TableRow> listDataAbsen = [];

  Future<void> refresh() async {
    setState(() {});
  }

  void setBulan() {
    final int intBulan = DateTime.now().month;
    final int intTahun = DateTime.now().year;
    late int index = 0;
    bulan = intBulan.toString();
    namaBulan = utils.namaBulan(intBulan);
    for (var val in _listBulan) {
      _listNamaBulan.add(utils.namaBulan(val));
    }
    for (var val in _listTahun) {
      if (val == intTahun) {
        _indexSelectedTahun = index;
        namaTahun = intTahun.toString();
      }
      index++;
      if (kDebugMode) {
        print('val tahun');
        print(val);
      }
    }
    _indexSelectedBulan = intBulan - 1;
    setState(() {});
    if (kDebugMode) {
      print('Bulan $bulan');
      print('Nama Bulan $namaBulan');
    }
  }

  Future<void> gantiBulan(int index) async {
    await Future.delayed(const Duration(seconds: 3));
    namaBulan = _listNamaBulan[index];
    _indexSelectedBulan = index;
    refresh();
  }

  Future<void> gantiTahun(int index) async {
    await Future.delayed(const Duration(seconds: 3));
    namaTahun = _listTahun[index].toString();
    _indexSelectedTahun = index;
    refresh();
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
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 32.0,
                  scrollController: FixedExtentScrollController(
                    initialItem: _indexSelectedTahun,
                  ),
                  onSelectedItemChanged: (value) {
                    gantiTahun(value);
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                  children: List<Widget>.generate(
                    _listTahun.length,
                        (int index) {
                      return Text(
                        _listTahun[index].toString(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getJumlahIzinPegawai() async {
    if (kDebugMode) {
      print('getIzin');
    }
    const storage = FlutterSecureStorage();

    final user = await storage.read(key: 'user');

    var url = Uri.https(Utils().presensiDomain,
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

  void checkPermission() async {
    const storage = FlutterSecureStorage();
    final izinPermission = await storage.read(key: 'izinPegawaiPermission');

    if (izinPermission == '1') {
      setState(() {
        izinPegawaiPermission = true;
        getJumlahIzinPegawai();
      });
    }
  }

  @override
  void initState() {
    setBulan();
    checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget iconIzin = badges.Badge(
      showBadge: izinPegawaiBadge != '' ? true : false,
      position: badges.BadgePosition.topEnd(
        top: -(0.25 * 24.0),
        end: -(0.25 * 24.0),
      ),
      badgeContent: Text(
        izinPegawaiBadge,
        style: const TextStyle(
          fontSize: 12.0,
          color: CupertinoColors.white,
        ),
      ),
      child: const Icon(
        Icons.calendar_month,
        size: 24.0,
        color: Colors.blueGrey,
      ),
    );

    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: const Border(bottom: BorderSide.none),
        previousPageTitle: 'Beranda',
        middle: const Text('Riwayat Presensi'),
        trailing: Material(
          child: InkWell(
            child: iconIzin,
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(
                  builder: (context) {
                    return const IndexIzinPresensi();
                  },
                ),
              ).then((value) {
                Future.delayed(const Duration(seconds: 1), () {
                  getJumlahIzinPegawai();
                });
              });
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
            future: _service.getDataRiwayat(_listBulan[_indexSelectedBulan],_listTahun[_indexSelectedTahun]),
            builder: (context, snapshot) {
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

              if (snapshot.hasData) {
                listDataAbsen.clear();

                if (kDebugMode) {
                  print('list');
                  // print(snapshot.data);
                }

                snapshot.data?.forEach(
                  (value) {
                    String tanggal = value['tanggal'].split('-')[2];
                    String tahun = value['tanggal'].split('-')[0];
                    String jamMasuk = value['data_absen'] != null
                        ? (value['data_absen']['tap_in'] != null
                            ? value['data_absen']['tap_in'].toString()
                            : '')
                        : '';
                    String jamPulang = value['data_absen'] != null
                        ? (value['data_absen']['tap_out'] != null
                            ? value['data_absen']['tap_out'].toString()
                            : '')
                        : '';

                    bool isLibur = value['is_libur'];
                    String keterangan = value['keterangan'];
                    late List<Widget> status = [];
                    if (value['data_absen'] != null) {
                      final Widget telatBtn = InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return CreatePresensi(
                                  id: value['data_absen']['id'].toString(),
                                  inOut: 0,
                                  tanggal: tanggal,
                                  namaBulan: namaBulan,
                                  tahun: tahun,
                                );
                              },
                            ),
                          ).then((val) {
                            if (kDebugMode) {
                              print('Hasil: ');
                              print(val);
                            }
                            if (val != null && val) {
                              refresh();
                            }
                          });
                        },
                        child: const Text(
                          'TL',
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      );

                      final Widget cepatBtn = InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return CreatePresensi(
                                  id: value['data_absen']['id'].toString(),
                                  inOut: 1,
                                  tanggal: tanggal,
                                  namaBulan: namaBulan,
                                  tahun: tahun,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'CP',
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      );

                      status = value['data_absen']['is_terlambat'] &&
                              value['data_absen']['is_cepat_pulang']
                          ? [telatBtn, const Text(' / '), cepatBtn]
                          : (value['data_absen']['is_terlambat']
                              ? [telatBtn]
                              : (value['data_absen']['is_cepat_pulang']
                                  ? [cepatBtn]
                                  : []));
                    }

                    listDataAbsen.add(
                      TableRow(
                        decoration: BoxDecoration(
                            color: isLibur
                                ? CupertinoColors.lightBackgroundGray
                                : CupertinoColors.white),
                        children: isLibur
                            ? [
                                TableCell(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 16.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Text(
                                      tanggal,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Text(
                                    keterangan,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const TableCell(
                                  child: Text(''),
                                ),
                              ]
                            : [
                                TableCell(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 16.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Text(
                                      tanggal,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // jamMasuk.isEmpty
                                      //     ? const Text('')
                                      //     : const Text(''),
                                      Text(
                                        '$jamMasuk - $jamPulang',
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ),
                                TableCell(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: status,
                                  ),
                                ),
                              ],
                      ),
                    );
                  },
                );
                return RefreshIndicator(
                  child: ListView(
                    children: [
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
                          title: Text('Presensi bulan $namaBulan $namaTahun'),
                          subtitle: const Text(
                              'Tap pada tombol untuk mengganti bulan'),
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
                      Container(
                        margin: const EdgeInsets.only(
                          left: 16.0,
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Table(
                          defaultColumnWidth: const FlexColumnWidth(1),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(2),
                          },
                          children: const [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Text(
                                    'Tanggal',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TableCell(
                                  child: Text(
                                    'Waktu',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TableCell(
                                  child: Text(
                                    'Keterangan',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Table(
                        defaultColumnWidth: const FlexColumnWidth(1),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(2),
                        },
                        children: listDataAbsen,
                      ),
                    ],
                  ),
                  onRefresh: () {
                    return refresh();
                  },
                );
              }

              return RefreshIndicator(
                child: ListView(
                  children: [
                    Table(
                      children: const [
                        TableRow(children: [
                          TableCell(
                            child: Text(''),
                          ),
                          TableCell(
                            child: Text(''),
                          ),
                          TableCell(
                            child: Text(''),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
                onRefresh: () {
                  return refresh();
                },
              );
            }),
      ),
    );
  }
}
