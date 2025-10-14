import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:super_app/Utils/sso_ui.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/presensi/verval_detail.dart';
import 'package:super_app/services/izin_service.dart';

class VervalLuar extends StatefulWidget {
  const VervalLuar({super.key});

  @override
  State<VervalLuar> createState() => StateVervalLuar();
}

class StateVervalLuar extends State<VervalLuar> {
  final IzinService _service = IzinService();
  final Utils utils = Utils();
  late List<Widget> listViewData = [];
  late bool isUpdating = false;
  late String status = '0';

  void setStatus(String statusString) {
    status = statusString;
    setState(() {});
  }

  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        previousPageTitle: 'Kembali',
        middle: Text('Absen Luar Kantor'),
        border: Border.fromBorderSide(BorderSide.none),
        backgroundColor: CupertinoColors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setStatus('3');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: status == '3'
                            ? Colors.grey.shade300
                            : CupertinoColors.white,
                      ),
                      child: const Text('Semua'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setStatus('0');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: status == '0'
                            ? Colors.grey.shade300
                            : CupertinoColors.white,
                      ),
                      child: const Text('Menunggu'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setStatus('1');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: status == '1'
                            ? Colors.grey.shade300
                            : CupertinoColors.white,
                      ),
                      child: const Text('Disetujui'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 8.0,
                      right: 16.0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setStatus('2');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: status == '2'
                            ? Colors.grey.shade300
                            : CupertinoColors.white,
                      ),
                      child: const Text('Ditolak'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: _service.getIzinLuarKantorBawahan(status),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/json_image/animation_sibangkom_load.json',
                            width: 200.0,
                            repeat: false,
                          ),
                          const Text('Memeriksa data.')
                        ],
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

                    for (var element in snapshot.data!) {
                      if (kDebugMode) {
                        print(element);
                      }

                      final String tanggal = utils.formatIndonesia(
                        element['date'],
                      );

                      final String authority = utils.presensiDomain;
                      final String unencodedPath =
                          '${utils.fotoAbsenLuarKantor}${element['pns_id']}/${element['image']}';
                      final url = Uri.https(authority, unencodedPath);

                      if (kDebugMode) {
                        print(url);
                      }

                      late Widget statusIzin = const Text('');

                      if (element['is_valid'] == 0) {
                        statusIzin = const Text(
                          ' (Menunggu)',
                          style: TextStyle(
                            color: CupertinoColors.activeOrange,
                          ),
                        );
                      }
                      if (element['is_valid'] == 1) {
                        statusIzin = const Text(
                          ' (Disetujui)',
                          style: TextStyle(
                            color: CupertinoColors.activeGreen,
                          ),
                        );
                      }
                      if (element['is_valid'] == 2) {
                        statusIzin = const Text(
                          ' (Ditolak)',
                          style: TextStyle(
                            color: CupertinoColors.destructiveRed,
                          ),
                        );
                      }

                      listViewData.add(
                        SizedBox(
                          // margin: const EdgeInsets.symmetric(vertical: 4.0),
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: GestureDetector(
                            onTap: () async {
                              var status = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => VervalDetail(
                                    url: url.toString(),
                                    heroTag: 'hero${element['image']}',
                                    nama: '${element['nama']}',
                                    nip: '${element['nip']}',
                                    jenisIzin: '${element['keterangan']}',
                                    alasan: '${element['reason']}',
                                    tanggal: tanggal,
                                    id: '${element['id']}',
                                    status: '${element['is_valid']}',
                                    kategori: 2,
                                    jenis: element['jenis'],
                                  ),
                                ),
                              );

                              if (status == true) {
                                setState(() {});
                              }
                            },
                            child: Card(
                              elevation: 1.0,
                              // margin: EdgeInsets.zero,
                              shape: const BeveledRectangleBorder(),
                              color: element['is_valid'] == 0
                                  ? Colors.orange.shade50
                                  : (element['is_valid'] == 1
                                      ? Colors.green.shade50
                                      : Colors.red.shade50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 16.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  element['nama'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  tanggal,
                                                  style: const TextStyle(
                                                      color: Colors.black54),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              element['keterangan'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                                color: element['is_valid'] == 0
                                                    ? Colors.orange
                                                    : (element['is_valid'] == 1
                                                        ? Colors.green
                                                        : Colors.red),
                                              ),
                                            ),
                                            statusIzin
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.black12,
                                          //       blurRadius: 16.0,
                                          //       spreadRadius: 4.0,
                                          //       offset: Offset(0, 8)),
                                          // ],
                                          ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Hero(
                                          tag: 'hero${element['image']}',
                                          child: Image.network(url.toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView(children: listViewData);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: CupertinoColors.white,
    );
  }
}
