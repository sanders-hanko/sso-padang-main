import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_app/pages/sibangkom/list_sibangkom.dart';
import 'package:super_app/pages/verifikator/verifikator_menunggu.dart';
import 'package:super_app/pages/verifikator/verifikator_selesai.dart';

class VerifikatorIndex extends StatefulWidget {
  const VerifikatorIndex({
    super.key,
    required this.kodeLayanan,
    required this.namaLayanan,
    required this.deskripsiLayanan,
  });

  final String kodeLayanan;
  final String namaLayanan;
  final String deskripsiLayanan;

  @override
  State<VerifikatorIndex> createState() => StateIndexVerifikator();
}

class StateIndexVerifikator extends State<VerifikatorIndex> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late String kodeLayanan = '';
  late String namaLayanan = '';
  late String deskripsiLayanan = '';
  late String nip;

  Future<void> setKode() async {
    final user = await storage.read(key: 'user');
    nip = jsonDecode(user!)['nip'];
    kodeLayanan = widget.kodeLayanan;
    namaLayanan = widget.namaLayanan;
    deskripsiLayanan = widget.deskripsiLayanan;
    setState(() {});
  }

  @override
  void initState() {
    setKode();
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
        middle: Text('Verifikator'),
      ),
      body: SafeArea(
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
                    title: const Text('Menunggu verifikasi'),
                    subtitle: const Text('Permohonan menunggu verifikasi'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoColors.opaqueSeparator,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg_image/clock.svg',
                    ),
                    onTap: () async {
                      late bool status = false;
                      status =
                          await Navigator.of(context, rootNavigator: true).push(
                                    CupertinoPageRoute(
                                      builder: (context) {
                                        return VerifikatorMenunggu(
                                          kodeLayanan: kodeLayanan,
                                          nip: nip,
                                        );
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
                    title: const Text('Sudah diverifikasi'),
                    subtitle: const Text('Permohonan sudah diverifikasi'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoColors.opaqueSeparator,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg_image/email.svg',
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (context) {
                            return VerifikatorSelesai(
                              kodeLayanan: kodeLayanan,
                              nip: nip,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 0.60 * MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    namaLayanan,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    deskripsiLayanan,
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
