import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/auth/login_page.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/pages/coming_soon.dart';
import 'package:super_app/tab_view_page/pegawai/profil_pegawai.dart';
import 'package:super_app/tab_view_page/pegawai/riwayat_jabatan.dart';
import 'package:super_app/tab_view_page/pegawai/update_password.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:super_app/pages/tentang.dart';

dynamic user;
const String assetName = 'assets/svg_image/person.svg';
const storage = FlutterSecureStorage();

class Pegawai extends StatefulWidget {
  const Pegawai({super.key});

  @override
  State<Pegawai> createState() => PegawaiState();
}

class PegawaiState extends State<Pegawai> {
  late bool _buttonPressed = false;
  late bool isLoggedOut = false;
  late String? jenisKepegawaian = '';
  final Uri _url =
      Uri.parse('https://${Utils().presensiDomain}${Utils().privacyPolicy}');

  void clearSession() {
    setState(() {
      _buttonPressed = true;
    });
    logout();
  }

  void logout() async {
    const storage = FlutterSecureStorage();
    var url = Uri.https('simpeg.padang.go.id', '/api/v1/logout');
    String? dataStorage = await storage.read(key: 'user');
    if (dataStorage == null) {
      clearStorage();
    } else {
      final Map<String, dynamic> json = jsonDecode(dataStorage);
      final username = jenisKepegawaian == 'asn' ? json['nip'] : json['USERNAME'];
      var response = await http.post(url, body: {'username': username});
      if (response.statusCode == 200) {
        context.mounted ? context.read<PermissionBloc>().add(const PermissionEvent.reset()) : null;
        clearStorage();
      } else {
        setState(() {
          _buttonPressed = false;
        });
      }
    }
  }

  void clearStorage() async {
    const storage = FlutterSecureStorage();
    final String? uuid = await storage.read(key: 'uuid');
    await storage.deleteAll();
    await storage.write(key: 'uuid', value: uuid);
    if (context.mounted) {
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return const LoginPage();
          },
        ),
        (route) => false,
      );
    }
  }

  void checkStorage() async {
    final dataStorage = await storage.read(key: 'user');
    jenisKepegawaian = await storage.read(key: 'jenisKepegawaian');
    final jsonUser = dataStorage != null ? jsonDecode(dataStorage) : null;
    setState(() {
      user = jsonUser;
    });
  }

  @override
  void initState() {
    checkStorage();
    super.initState();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        previousPageTitle: 'Kembali',
        middle: Text('Pegawai'),
        backgroundColor: CupertinoColors.secondarySystemBackground,
        border: Border.fromBorderSide(BorderSide.none),
      ),
      backgroundColor: CupertinoColors.secondarySystemBackground,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 24, bottom: 8.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(24.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.white,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg_image/user_2.svg',
                      width: 90.0,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      user != null ? (jenisKepegawaian == 'asn' ? user['nama'] : user['NAMA']) : '',
                      style: const TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      child: Text(
                        user != null ? (jenisKepegawaian == 'asn' ? user['jabatan'] : user['JABATAN_NAMA']) : '',
                        style: const TextStyle(fontSize: 14.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            jenisKepegawaian == 'asn' ?
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoListTile(
                    // tileColor: Colors.transparent,
                    leading: SvgPicture.asset(
                      'assets/svg_image/user.svg',
                    ),
                    title: const Text(
                      'Profil Pegawai',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.blueAccent.shade100,
                      size: 14.0,
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const ProfilPegawai();
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
                    leading: SvgPicture.asset(
                      'assets/svg_image/briefcase.svg',
                    ),
                    title: const Text(
                      'Riwayat Jabatan',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.blueAccent.shade100,
                      size: 14.0,
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const RiwayatJabatan();
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
                    leading: SvgPicture.asset(
                      'assets/svg_image/trophy.svg',
                    ),
                    title: const Text(
                      'Riwayat Pendidikan',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.blueAccent.shade100,
                      size: 14.0,
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const ComingSoon(
                              title: 'Riwayat Pendidikan',
                            );
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
                    leading: SvgPicture.asset(
                      'assets/svg_image/bookmark.svg',
                    ),
                    title: const Text(
                      'Riwayat Golongan',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.blueAccent.shade100,
                      size: 14.0,
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const ComingSoon(
                              title: 'Riwayat Golongan',
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ) : SizedBox.shrink(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoListTile(
                    leading: SvgPicture.asset(
                      'assets/svg_image/chat.svg',
                    ),
                    title: const Text(
                      'Bantuan',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.blueAccent.shade100,
                      size: 14.0,
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const ComingSoon(
                              title: 'Bantuan',
                            );
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
                    leading: SvgPicture.asset(
                      'assets/svg_image/auction_bid.svg',
                    ),
                    title: const Text(
                      'Kebijakan Privasi',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.blueAccent.shade100,
                      size: 14.0,
                    ),
                    onTap: () {
                      _launchUrl();
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
                    leading: Hero(
                      tag: 'padlock_lock',
                      child: SvgPicture.asset(
                        'assets/svg_image/padlock_lock.svg',
                      ),
                    ),
                    title: const Text(
                      'Ubah Kata Sandi',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.blueAccent.shade100,
                      size: 14.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return const UpdatePassword();
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
                    leading: SvgPicture.asset(
                      'assets/svg_image/smartphone.svg',
                    ),
                    title: const Text(
                      'Tentang Aplikasi',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.blueAccent.shade100,
                      size: 14.0,
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const Tentang();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
              decoration: BoxDecoration(
                color: CupertinoColors.secondarySystemGroupedBackground,
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoListTile(
                    leading: _buttonPressed
                        ? const SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: Colors.red,
                            ),
                          )
                        : const Icon(
                            CupertinoIcons.escape,
                            color: Colors.red,
                          ),
                    // tileColor: Colors.red.shade900,
                    title: const Text(
                      'Keluar',
                      style: TextStyle(fontSize: 14.0, color: Colors.red),
                    ),
                    trailing: const Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.red,
                      size: 14.0,
                    ),
                    onTap: () {
                      clearSession();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RiwayatPendidikan extends StatelessWidget {
  const RiwayatPendidikan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Hero(
              tag: 'Riwayat Pendidikan',
              child: Material(
                child: ListTile(
                  leading: const Icon(CupertinoIcons.arrow_left),
                  title: const Text(
                    'Riwayat Pendidikan',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const ListTile(
              leading: Text('Pendidikan 1'),
              title: Text('Pendidikan 1'),
            ),
            const Divider(height: 0),
            const ListTile(
              leading: Text('Pendidikan 2'),
              title: Text('Pendidikan 2'),
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}

class RiwayatGolongan extends StatelessWidget {
  const RiwayatGolongan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Hero(
              tag: 'Riwayat Golongan',
              child: Material(
                child: ListTile(
                  leading: const Icon(CupertinoIcons.arrow_left),
                  title: const Text(
                    'Riwayat Golongan',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const ListTile(
              leading: Text('Golongan 1'),
              title: Text('Golongan 1'),
            ),
            const Divider(height: 0),
            const ListTile(
              leading: Text('Golongan 2'),
              title: Text('Golongan 2'),
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}

class Bantuan extends StatelessWidget {
  const Bantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Hero(
              tag: 'Bantuan',
              child: Material(
                child: ListTile(
                  leading: const Icon(CupertinoIcons.arrow_left),
                  title: const Text(
                    'Bantuan',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const ListTile(
              leading: Text('Bantuan 1'),
              title: Text('Bantuan 1'),
            ),
            const Divider(height: 0),
            const ListTile(
              leading: Text('Bantuan 2'),
              title: Text('Bantuan 2'),
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}

class TentangAplikasi extends StatelessWidget {
  const TentangAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(CupertinoIcons.chevron_back),
              title: Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: const Text(
                  'padang.go.id\nversi 1.0.9',
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Copyright Pemerintah Kota Padang'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
