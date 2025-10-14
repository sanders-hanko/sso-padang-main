import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_app/auth/login_page.dart';
import 'package:super_app/services/auth_service.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => StateUpdatePassword();
}

class StateUpdatePassword extends State<UpdatePassword> {
  final TextEditingController _passwordLamaController = TextEditingController();
  final TextEditingController _passwordBaruController = TextEditingController();
  final TextEditingController _passwordBaruKonfirmasiController =
      TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final AuthService service = AuthService();
  late bool buttonPressed = false;
  late bool isSuccess = false;
  late String message = '';

  Future<void> update() async {
    buttonPressed = true;
    setState(() {});

    try {
      final bool status = await service.updatePassword(
        _passwordLamaController.text,
        _passwordBaruController.text,
        _passwordBaruKonfirmasiController.text,
      );

      if (status) {
        isSuccess = true;
        setState(() {});
        logout();
      }

      await Future.delayed(const Duration(seconds: 1));
      buttonPressed = false;
      isSuccess = false;
      message = (await storage.read(key: 'message'))!;
      setState(() {});
      await Future.delayed(const Duration(seconds: 3));
      message = '';
      setState(() {});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      await Future.delayed(const Duration(seconds: 1));
      buttonPressed = false;
      isSuccess = false;
      setState(() {});
    }
  }

  void logout() async {
    var url = Uri.https('simpeg.padang.go.id', '/api/v1/logout');
    String? dataStorage = await storage.read(key: 'user');
    if (dataStorage == null) {
      clearStorage();
    } else {
      final Map<String, dynamic> json = jsonDecode(dataStorage);
      var response = await http.post(url, body: {'username': json['nip']});
      if (response.statusCode == 200) {
        clearStorage();
      }
    }
  }

  void clearStorage() async {
    final String? uuid = await storage.read(key: 'uuid');
    await storage.deleteAll();
    await storage.write(key: 'uuid', value: uuid);
    goBack();
  }

  void goBack() {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      CupertinoPageRoute(
        builder: (BuildContext context) {
          return const LoginPage();
        },
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'padlock_lock',
                      child: SvgPicture.asset(
                        'assets/svg_image/padlock_lock.svg',
                        width: 100.0,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ubah Kata Sandi',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: const Border.fromBorderSide(
                  BorderSide(color: CupertinoColors.lightBackgroundGray),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
                    child: Text(
                      'Kata sandi lama dibutuhkan untuk memperbarui kata sandi anda.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordLamaController,
                      decoration: const InputDecoration(
                        fillColor: CupertinoColors.activeGreen,
                        // label: Text('Kata sandi lama'),
                        hintText: 'Kata sandi lama',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
                    child: Text(
                      'Masukan kata sandi baru dan ulangi kata sandi baru pada kolom konfirmasi.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordBaruController,
                      decoration: const InputDecoration(
                        // label: Text('Kata sandi baru'),
                        hintText: 'Kata sandi baru',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordBaruKonfirmasiController,
                      decoration: const InputDecoration(
                          // label: Text('Konfirmasi kata sandi baru'),
                          hintText: 'Konfirmasi kata sandi baru',
                          focusColor: Colors.white),
                    ),
                  ),
                  const Text(''),
                ],
              ),
            ),
            Text(
              message,
              style: const TextStyle(color: CupertinoColors.destructiveRed),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  buttonPressed ? null : update();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonPressed
                      ? isSuccess
                          ? Colors.green
                          : Colors.grey
                      : Colors.blue.shade500,
                  foregroundColor: CupertinoColors.white,
                  minimumSize: const Size(double.infinity, 50.0),
                  elevation: 2.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buttonPressed
                      ? isSuccess
                          ? [
                              const Text('Berhasil Disimpan'),
                            ]
                          : [
                              const SizedBox(
                                  height: 20.0,
                                  width: 20.0,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3.0,
                                    color: CupertinoColors.white,
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Menyimpan ...'),
                              )
                            ]
                      : [
                          const Text('Simpan'),
                        ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
