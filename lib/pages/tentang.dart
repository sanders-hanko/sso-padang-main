import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Tentang extends StatefulWidget {
  const Tentang({super.key});

  @override
  State<Tentang> createState() => TentangState();
}

class TentangState extends State<Tentang> {
  late PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  late String appVersion = 'null';

  Future<void> loadPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
      appVersion = _packageInfo.version;
    });
    if (kDebugMode) {
      print(_packageInfo);
    }
  }

  @override
  void initState() {
    loadPackageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: CupertinoColors.white,
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 32.0),
                      child: Lottie.asset(
                        'assets/json_image/animation_about.json',
                        width: 200.0,
                      )),
                  const Text(
                    'SSO ASN Padang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text('Versi Aplikasi'),
                  Text(appVersion),
                  const SizedBox(
                    height: 48.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
