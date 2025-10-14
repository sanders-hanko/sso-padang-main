import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/verifikator/verifikator_detail.dart';
import 'package:super_app/services/berkas_service.dart';
import 'package:super_app/Utils/sso_ui.dart';

class VerifikatorSelesai extends StatefulWidget {
  const VerifikatorSelesai({
    super.key,
    required this.kodeLayanan,
    required this.nip,
  });

  final String kodeLayanan;
  final String nip;

  @override
  State<VerifikatorSelesai> createState() => StateVerifikatorSelesai();
}

class StateVerifikatorSelesai extends State<VerifikatorSelesai> {
  final Utils utility = Utils();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final BerkasService service = BerkasService();

  late String nip;

  late String kodeLayanan;

  late List<Widget> dataLayanan = [];

  Future<List> getData() async {
    nip = widget.nip;

    kodeLayanan = widget.kodeLayanan;

    final data = await service.getListTransVerifikator(kodeLayanan, nip, '1');

    return data;
  }

  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Kembali',
        middle: Text('Sudah Diverifikasi'),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/json_image/animation_sibangkom_load.json',
                        width: 0.5 * MediaQuery.of(context).size.width,
                      ),
                    ],
                  )
                ],
              );
            }

            if (kDebugMode) {
              print(snapshot.connectionState);
              print(snapshot.data);
            }

            if (snapshot.data!.isNotEmpty) {
              dataLayanan.clear();

              snapshot.data?.forEach(
                (val) {
                  final String statusVerval =
                      val['status'] == 1 ? 'Diterima' : 'Ditolak';
                  final Color statusColor = val['status'] == 1
                      ? CupertinoColors.activeGreen
                      : CupertinoColors.destructiveRed;
                  final body = Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          val['perangkat_daerah'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('NIP'),
                          Text(val['nip']),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Nama'),
                          Text(val['nama']),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tanggal diajukan'),
                          Text(val['tanggal_pengajuan'].toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Status'),
                          Text(
                            statusVerval,
                            style: TextStyle(color: statusColor),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'lihat detail berkas',
                              style: TextStyle(
                                  // fontStyle: FontStyle.italic,
                                  color: CupertinoColors.systemGrey),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final bool status = await Navigator.of(context,
                                        rootNavigator: true)
                                    .push(
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return VerifikatorDetail(
                                        idProses: val['id'].toString(),
                                        status: val['status'].toString(),
                                        middle: 'Sudah Diverifikasi',
                                      );
                                    },
                                  ),
                                );
                                if (status == true) {
                                  setState(() {});
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: const Size(
                                  32.0,
                                  24.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                              ),
                              child: const Text(
                                'detail berkas',
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );

                  dataLayanan.add(
                    PdgCard(
                      header: Header(
                        title: val['jenis_layanan'],
                        trailing: const Text(''),
                      ),
                      body: [body],
                    ),
                  );
                },
              );

              return ListView(
                children: dataLayanan,
              );
            }

            return RefreshIndicator(
              onRefresh: () {
                return refresh();
              },
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/json_image/animation_layanan.json',
                            width: 0.5 * MediaQuery.of(context).size.width,
                            repeat: false,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Tidak ada permohonan baru.'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
