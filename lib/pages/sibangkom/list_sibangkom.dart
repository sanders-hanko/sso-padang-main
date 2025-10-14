import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/sso_ui.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/sibangkom/detail_sibangkom.dart';
import 'package:super_app/services/berkas_service.dart';

class ListSibangkom extends StatefulWidget {
  const ListSibangkom({super.key});

  @override
  State<ListSibangkom> createState() => StateListSibangkom();
}

class StateListSibangkom extends State<ListSibangkom> {
  final Utils utility = Utils();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final BerkasService service = BerkasService();

  late String nip;

  late String kodeLayanan;

  late List<Widget> dataLayanan = [];

  Future<List> getData() async {
    final user = await storage.read(key: 'user');

    nip = jsonDecode(user!)['nip'];

    kodeLayanan = utility.kodeLayananSibangkom;

    final data = await service.getListTrans(kodeLayanan, nip, '');

    return data;
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
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Kembali',
        middle: Text('List Tubel/Bimtek'),
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
              print(snapshot.data?.length);
            }

            if (snapshot.data!.isEmpty) {
              return RefreshIndicator(
                onRefresh: () {
                  return refresh();
                },
                child: ListView(
                  children: [
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
                          children: [Text('Belum ada data.')],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('')],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            dataLayanan.clear();

            if (kDebugMode) {
              print(snapshot.data);
            }

            snapshot.data?.forEach(
              (val) {
                final trailing = val['is_inprogress']
                    ? Container(
                        decoration: BoxDecoration(
                            color: CupertinoColors.activeOrange,
                            borderRadius: BorderRadius.circular(32.0),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                spreadRadius: 2.0,
                                color: CupertinoColors.activeOrange,
                              )
                            ]),
                        child: const Text(
                          '    ',
                          style: TextStyle(
                            color: CupertinoColors.activeOrange,
                            fontSize: 4.0,
                          ),
                        ),
                      )
                    : (val['is_acc']
                        ? Container(
                            decoration: BoxDecoration(
                                color: CupertinoColors.activeGreen,
                                borderRadius: BorderRadius.circular(32.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                    color: CupertinoColors.activeGreen,
                                  )
                                ]),
                            child: const Text(
                              '    ',
                              style: TextStyle(
                                color: CupertinoColors.activeGreen,
                                fontSize: 4.0,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: CupertinoColors.destructiveRed,
                                borderRadius: BorderRadius.circular(32.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                    color: CupertinoColors.destructiveRed,
                                  )
                                ]),
                            child: const Text(
                              '    ',
                              style: TextStyle(
                                color: CupertinoColors.activeGreen,
                                fontSize: 4.0,
                              ),
                            ),
                          ));

                final status = val['is_inprogress'] ? 'diproses' : 'selesai';

                final body = Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Status'),
                        Text(
                          status,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Jumlah permintaan berkas'),
                        Text(val['jumlah_berkas'].toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Jumlah berkas dikirim'),
                        Text(val['jumlah_terpenuhi'].toString()),
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
                        const Text('Jam diajukan'),
                        Text(val['jam_pengajuan'].toString()),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'lihat detail permohonan tubel/bimtek',
                            style: TextStyle(
                                // fontStyle: FontStyle.italic,
                                color: CupertinoColors.systemGrey),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return DetailSibangkom(
                                      idTransLayanan: val['id'].toString(),
                                      status: val['status'].toString(),
                                      middle: val['jenis_layanan'],
                                    );
                                  },
                                ),
                              );
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
                              'detail',
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
                      trailing: trailing,
                    ),
                    body: [body],
                  ),
                );
              },
            );

            return ListView(
              children: dataLayanan,
            );
          },
        ),
      ),
    );
  }
}
