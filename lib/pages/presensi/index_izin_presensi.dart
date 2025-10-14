import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_app/pages/izin/index_izin.dart';
import 'package:super_app/pages/izin/index_izin_bawahan.dart';
import 'package:super_app/pages/presensi/verval_luar.dart';
import 'package:super_app/pages/presensi/verval_tc.dart';

class IndexIzinPresensi extends StatefulWidget {
  const IndexIzinPresensi({super.key});

  @override
  State<IndexIzinPresensi> createState() => StateIndexIzinPresensi();
}

class StateIndexIzinPresensi extends State<IndexIzinPresensi> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late String izinPegawaiPermissionStorage = 'default';
  late bool izinPegawaiPermission = false;
  late List<Widget> menuList = [];

  Future<void> checkPermission() async {
    await storage.read(key: 'izinPegawaiPermission').then(
          (value) => {
            setState(
              () {
                izinPegawaiPermissionStorage = 'saved $value';
                if (value == '1') {
                  izinPegawaiPermission = true;
                } else {
                  izinPegawaiPermission = false;
                }
              },
            )
          },
        );

    if (kDebugMode) {
      print('izin Akses 1: $izinPegawaiPermission');
    }

    setMenu();
  }

  void setMenu() {
    if (kDebugMode) {
      print('izin akses: $izinPegawaiPermission');
    }
    menuList.add(
      CupertinoListTile(
        title: const Text('Ajukan Izin'),
        subtitle: const Text('Ajukan izin dinas luar, bimtek atau tubel'),
        trailing: const Icon(
          CupertinoIcons.chevron_forward,
          color: CupertinoColors.opaqueSeparator,
        ),
        leading: SvgPicture.asset(
          'assets/svg_image/pencil.svg',
        ),
        onTap: () async {
          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute(
              builder: (context) {
                return const IndexIzin();
              },
            ),
          );
        },
      ),
    );
    if (izinPegawaiPermission) {
      menuList.add(
        Container(
          margin: const EdgeInsets.only(
            left: 64.0,
          ),
          child: const Divider(
            height: 0.0,
            color: CupertinoColors.systemFill,
          ),
        ),
      );

      menuList.add(
        CupertinoListTile(
          title: const Text('Verifikasi Izin Bawahan'),
          subtitle: const Text(
              'Verifikasi izin dinas luar, bimtek dan tubel bawahan.'),
          trailing: const Icon(
            CupertinoIcons.chevron_forward,
            color: CupertinoColors.opaqueSeparator,
          ),
          leading: SvgPicture.asset(
            'assets/svg_image/calendar_8.svg',
          ),
          onTap: () async {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const IndexIzinBawahan();
                },
              ),
            );
          },
        ),
      );

      menuList.add(
        Container(
          margin: const EdgeInsets.only(
            left: 64.0,
          ),
          child: const Divider(
            height: 0.0,
            color: CupertinoColors.systemFill,
          ),
        ),
      );

      menuList.add(
        CupertinoListTile(
          title: const Text('Verifikasi Telat/Cepat Pulang'),
          subtitle: const Text('Verifikasi izin telat/cepat pulang bawahan'),
          trailing: const Icon(
            CupertinoIcons.chevron_forward,
            color: CupertinoColors.opaqueSeparator,
          ),
          leading: SvgPicture.asset(
            'assets/svg_image/stopclock_time.svg',
          ),
          onTap: () async {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const VervalTc();
                },
              ),
            );
          },
        ),
      );

      menuList.add(
        Container(
          margin: const EdgeInsets.only(
            left: 64.0,
          ),
          child: const Divider(
            height: 0.0,
            color: CupertinoColors.systemFill,
          ),
        ),
      );

      menuList.add(
        CupertinoListTile(
          title: const Text('Verifikasi Absen Luar Kantor'),
          subtitle: const Text('Verifikasi absen diluar kantor bawahan'),
          trailing: const Icon(
            CupertinoIcons.chevron_forward,
            color: CupertinoColors.opaqueSeparator,
          ),
          leading: SvgPicture.asset(
            'assets/svg_image/building_town.svg',
          ),
          onTap: () async {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const VervalLuar();
                },
              ),
            );
          },
        ),
      );
    }

    setState(() {});
  }

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        previousPageTitle: 'Presensi',
        middle: Text('Izin Pegawai'),
        backgroundColor: CupertinoColors.secondarySystemBackground,
        border: Border.fromBorderSide(BorderSide.none),
      ),
      backgroundColor: CupertinoColors.secondarySystemBackground,
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
                children: menuList,
              ),
            ),
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Presensi',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Absensi pegawai di lingkungan'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pemerintah Kota Padang'),
                  ],
                ),
              ],
            ),
            const Text(''),
          ],
        ),
      ),
    );
  }
}
