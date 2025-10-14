import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/pangkat/list_pangkat.dart';
import 'package:super_app/services/berkas_service.dart';
import 'package:super_app/pages/pangkat/pilih_jenis_pangkat.dart';

import '../verifikator/verifikator_index.dart';

class IndexPangkat extends StatefulWidget {
  const IndexPangkat({super.key});

  @override
  State<IndexPangkat> createState() => StateIndexPangkat();
}

class StateIndexPangkat extends State<IndexPangkat> {
  final Utils _utility = Utils();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final BerkasService _service = BerkasService();
  late String nip;
  late String kodeLayanan = '';
  late String namaLayanan = '';
  late String deskripsiLayanan = '';
  late bool aksesVerifikator = false;
  late Widget verifikator = const Row();

  Future<Map<String, dynamic>> cekPeriode() async {
    final periode =
        await _service.cekPeriodeLayanan(_utility.kodeLayananPangkat);

    if (kDebugMode) {
      print(periode);
    }

    return periode;
  }

  Future<void> refresh() async {
    setState(() {});
  }

  Future<void> setKode() async {
    final user = await _storage.read(key: 'user');
    kodeLayanan = _utility.kodeLayananPangkat;
    namaLayanan = _utility.namaLayananPangkat;
    deskripsiLayanan = _utility.deskripsiLayananPangkat;
    nip = jsonDecode(user!)['nip'];
    setState(() {});
    cekAksesVerifikator();
  }

  Future<void> cekAksesVerifikator() async {
    aksesVerifikator = await _service.cekAksesVerifikator(nip, kodeLayanan);
    if (kDebugMode) {
      print(aksesVerifikator);
    }
    setState(() {});
  }

  @override
  void initState() {
    setKode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (aksesVerifikator) {
      verifikator = Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 64.0,
            ),
            child: const Divider(
              height: 0.0,
              color: CupertinoColors.systemFill,
            ),
          ),
          CupertinoListTile(
            title: const Text('Verifikator'),
            subtitle: const Text('Verifikasi permohonan mutasi'),
            trailing: const Icon(
              CupertinoIcons.chevron_forward,
              color: CupertinoColors.opaqueSeparator,
            ),
            leading: SvgPicture.asset(
              'assets/svg_image/auction_bid.svg',
            ),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(
                  builder: (context) {
                    return VerifikatorIndex(
                      kodeLayanan: kodeLayanan,
                      namaLayanan: namaLayanan,
                      deskripsiLayanan: deskripsiLayanan,
                    );
                  },
                ),
              );
            },
          ),
        ],
      );
    }
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Beranda',
        middle: Text('Kepangkatan'),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: cekPeriode(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Lottie.asset('assets/json_image/animation_wait.json'),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Memeriksa Periode')],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Pengajuan Kenaikan Pangkat')],
                        )
                      ],
                    ),
                  ),
                  const Row(
                    children: [],
                  ),
                ],
              );
            }

            if (snapshot.hasData) {
              if (!snapshot.data?['periode_aktif']) {
                if (kDebugMode) {
                  print('${snapshot.data?['data']}');
                }

                late List<Widget> listPeriode = [];

                if (snapshot.data?['data'] != null) {
                  for (var data in snapshot.data?['data']) {
                    var tanggalAwal =
                        _utility.formatIndonesia(data['tanggal_awal']);
                    var tanggalAkhir =
                        _utility.formatIndonesia(data['tanggal_akhir']);
                    var namaPeriode = data['nama_periode'];
                    final Widget widgetPeriode = Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Periode $namaPeriode: '
                            'waktu penerimaan berkas mulai $tanggalAwal hingga $tanggalAkhir',
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                    listPeriode.add(widgetPeriode);
                  }
                }

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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 16.0),
                              child: Column(
                                children: [
                                  Lottie.asset(
                                    'assets/json_image/animation_layanan.json',
                                    repeat: false,
                                    width: 200,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Layanan Belum tersedia'),
                                    ],
                                  ),
                                  Column(
                                    children: listPeriode,
                                  ),
                                ],
                              ),
                            ),
                            const Row(
                              children: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.secondarySystemGroupedBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        children: [
                          CupertinoListTile(
                            title: const Text('Pengajuan baru'),
                            subtitle: const Text('Ajukan kenaikan pangkat ASN'),
                            trailing: const Icon(
                              CupertinoIcons.chevron_forward,
                              color: CupertinoColors.opaqueSeparator,
                            ),
                            leading: SvgPicture.asset(
                              'assets/svg_image/pencil.svg',
                            ),
                            onTap: () async {
                              late bool status = false;
                              status =
                                  await Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return const PilihJenisPangkat();
                                  },
                                ),
                              ) ==
                                  null
                                  ? false
                                  : true;

                              if (status) {
                                if (context.mounted) {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) {
                                        return const ListPangkat(
                                            middle: 'Lacak', status: '0');
                                      },
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                          CupertinoListTile(
                            title: const Text('Pengajuan diterima'),
                            subtitle:
                                const Text('Lihat pengajuan kenaikan pangkat'),
                            trailing: const Icon(
                              CupertinoIcons.chevron_forward,
                              color: CupertinoColors.opaqueSeparator,
                            ),
                            leading: SvgPicture.asset(
                              'assets/svg_image/files_document.svg',
                            ),
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return const ListPangkat(
                                      middle: 'Diterima',
                                      status: '1',
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 64.0),
                            child: const Divider(
                              height: 0.0,
                              color: CupertinoColors.systemFill,
                            ),
                          ),
                          CupertinoListTile(
                            title: const Text('Pengajuan ditolak'),
                            subtitle: const Text(
                                'Kenaikan pangkat belum bisa dilaksanakan'),
                            trailing: const Icon(
                              CupertinoIcons.chevron_forward,
                              color: CupertinoColors.opaqueSeparator,
                            ),
                            leading: SvgPicture.asset(
                              'assets/svg_image/warning_error.svg',
                            ),
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return const ListPangkat(
                                      middle: 'Ditolak',
                                      status: '2',
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 64.0),
                            child: const Divider(
                              height: 0.0,
                              color: CupertinoColors.systemFill,
                            ),
                          ),
                          CupertinoListTile(
                            title: const Text('Lacak'),
                            subtitle: const Text(
                                'Lihat status pengajuan kenaikan pangkat'),
                            trailing: const Icon(
                              CupertinoIcons.chevron_forward,
                              color: CupertinoColors.opaqueSeparator,
                            ),
                            leading: SvgPicture.asset(
                              'assets/svg_image/loupe_search.svg',
                            ),
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return const ListPangkat(
                                      middle: 'Lacak',
                                      status: '0',
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          verifikator,
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 0.60 * MediaQuery.of(context).size.width,
                      child: const Column(
                        children: [
                          Text(
                            'e-PANGKAT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          Text(
                            'Proses pengajuan kenaikan pangkat secara elektronik.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const Text('')
                  ],
                );
              }
            }
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: Column(
                            children: [
                              Lottie.asset(
                                'assets/json_image/animation_layanan.json',
                                repeat: false,
                                width: 200,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Layanan tidak tersedia'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          children: [],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
