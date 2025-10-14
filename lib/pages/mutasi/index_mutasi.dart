import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_app/pages/mutasi/list_mutasi.dart';
import 'package:super_app/pages/mutasi/pilih_jenis_mutasi.dart';
import 'package:super_app/services/berkas_service.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/verifikator/verifikator_index.dart';

class IndexMutasi extends StatefulWidget {
  const IndexMutasi({super.key});

  @override
  State<IndexMutasi> createState() => StateIndexMutasi();
}

class StateIndexMutasi extends State<IndexMutasi> {
  final Utils _utility = Utils();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final BerkasService _service = BerkasService();
  late String nip;
  late String kodeLayanan = '';
  late String namaLayanan = '';
  late String deskripsiLayanan = '';
  late bool aksesVerifikator = false;
  late Widget verifikator = const Row();

  Future<void> setKode() async {
    final user = await _storage.read(key: 'user');
    kodeLayanan = _utility.kodeLayananMutasi;
    namaLayanan = _utility.namaLayananMutasi;
    deskripsiLayanan = _utility.deskripsiLayananMutasi;
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
        middle: Text('Mutasi'),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
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
                    title: const Text('Pengajuan Baru'),
                    subtitle: const Text('Ajukan mutasi pegawai'),
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
                                        return const PilihJenisMutasi();
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
                                return const ListMutasi(
                                    middle: 'Lacak', status: '0');
                              },
                            ),
                          );
                        }
                      }
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
                    title: const Text('Pengajuan diterima'),
                    subtitle: const Text('Lihat data mutasi pegawai'),
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
                            return const ListMutasi(
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
                    subtitle:
                        const Text('Mutasi pegawai belum bisa dilaksanakan'),
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
                            return const ListMutasi(
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
                    subtitle: const Text('Ketahui status pengajuan mutasi'),
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
                            return const ListMutasi(
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
                    'e-MUTASI',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Text(
                    'Proses pengajuan mutasi secara elektronik.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Text('')
          ],
        ),
      ),
    );
  }
}
