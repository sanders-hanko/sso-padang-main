import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/pages/coming_soon.dart';
import 'package:super_app/pages/sibangkom/list_sibangkom.dart';
import 'package:super_app/pages/sibangkom/pilih_jenis_sibangkom.dart';
import 'package:super_app/pages/verifikator/verifikator_index.dart';
import 'package:super_app/services/berkas_service.dart';

class IndexSibangkom extends StatefulWidget {
  const IndexSibangkom({super.key});

  @override
  State<IndexSibangkom> createState() => StateIndexSibangkom();
}

class StateIndexSibangkom extends State<IndexSibangkom> {
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
    kodeLayanan = _utility.kodeLayananSibangkom;
    namaLayanan = _utility.namaLayananSibangkom;
    deskripsiLayanan = _utility.deskripsiLayananSibangkom;
    nip = jsonDecode(user!)['nip'];
    setState(() {});
    cekAksesVerifikator();
  }

  Future<void> cekAksesVerifikator() async {
    aksesVerifikator = await _service.cekAksesVerifikator(nip, kodeLayanan);
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
            subtitle: const Text('Verifikasi permohonan tubel/bimtek'),
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
        middle: Text('SIBANGKOM'),
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
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
              ),
              child: Column(
                children: [
                  CupertinoListTile(
                    title: const Text('Pengajuan baru'),
                    subtitle: const Text(
                        'Buat pengajuan pengembangan kompetensi ASN'),
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
                                        return const PilihJenisSibangkom();
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
                                return const ListSibangkom();
                              },
                            ),
                          );
                        }
                      }
                    },
                  ),
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
                    title: const Text('List Bimtek/Tubel'),
                    subtitle: const Text('Lihat semua bimtek/tubel'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoColors.opaqueSeparator,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg_image/open_book.svg',
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) {
                            return const ListSibangkom();
                          },
                        ),
                      );
                    },
                  ),
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
                    title: const Text('Laporan'),
                    subtitle: const Text('Laporan kegiatan'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoColors.opaqueSeparator,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg_image/check.svg',
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (context) {
                            return const ComingSoon(title: 'Laporan');
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
                    'SIBANGKOM',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Sistem Informasi Pengembangan Kompetensi Bagi ASN.',
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
