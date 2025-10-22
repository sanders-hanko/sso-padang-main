import 'dart:convert';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/features/surat/pages/surat_masuk.dart';
import 'package:super_app/models/user_model.dart';
import 'package:super_app/pages/home_page.dart';
import 'package:advertising_id/advertising_id.dart';
import 'package:super_app/services/permission_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();
bool _buttonPressed = false;

class LoginPageState extends State<LoginPage> {
  late String errorMessage = '';
  late String appVersion = 'null';
  late String installerStore = 'null';
  PermissionService service = PermissionService();

  void _onSubmit(context) async {
    setState(() {
      _buttonPressed = true;
    });
    if (await login(context)) {
      if (context.mounted) {
        String? jenisKepegawaian =
            await FlutterSecureStorage().read(key: 'jenisKepegawaian');
        debugPrint(jenisKepegawaian);
        setState(() {
          _buttonPressed = false;
        });

        if (jenisKepegawaian == 'asn') {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (BuildContext context) {
                return const HomePage();
              },
            ),
            (route) => false,
          );
        } else {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (BuildContext context) {
                return const SuratMasuk();
              },
            ),
            (route) => false,
          );
        }
      }
    } else {
      setState(() {
        _buttonPressed = false;
      });
    }
  }

  Future<bool> login(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    FlutterSecureStorage storage = const FlutterSecureStorage();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    late String brand;
    late String deviceId;
    late String device;
    late String model;
    late String supportedAbis;
    late String release;
    late String sdkInt;
    late String? identifierForVendor;
    late String? adsId = '';
    late String? fcm = '';

    try {
      adsId = await AdvertisingId.id(true);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    try {
      fcm = await messaging.getToken();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      brand = androidInfo.brand;
      deviceId = androidInfo.id;
      device = androidInfo.device;
      model = androidInfo.model;
      supportedAbis = '${androidInfo.supportedAbis}';
      release = androidInfo.version.release;
      sdkInt = '${androidInfo.version.sdkInt}';
      identifierForVendor = '';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      brand = 'Apple';
      deviceId = iosInfo.identifierForVendor ?? '';
      device = iosInfo.utsname.machine;
      model = iosInfo.name;
      supportedAbis = iosInfo.systemVersion;
      release = iosInfo.systemName;
      sdkInt = iosInfo.systemName;
      identifierForVendor = iosInfo.identifierForVendor;
    }

    final segment1 = generateRandomString(8);
    final segment2 = generateRandomString(4);
    final segment3 = generateRandomString(4);
    final segment4 = generateRandomString(4);
    final segment5 = generateRandomString(12);

    String? uuid = await storage.read(key: 'uuid');

    uuid ??= '$segment1-$segment2-$segment3-$segment4-$segment5';

    try {
      var url = Uri.https(Utils().simpegDomain, '/api/v1/login-v1');

      var response = await http.post(url, body: {
        'username': usernameController.text,
        'password': passwordController.text,
        'app_code': 'PDG2024SSO',
        'app_version': appVersion,
        'installer_store': installerStore,
        'uuid': uuid,
        'client_id': '12',
        'client_secret': 'QHOgKuDpu8xF0sWTwNjyApImAdcZ6Om9BmbdZnOt',
        'brand': brand.toString(),
        'device': device.toString(),
        'deviceId': deviceId.toString(),
        'model': model.toString(),
        'supportedAbis': supportedAbis.toString(),
        'release': release.toString(),
        'sdkInt': sdkInt.toString(),
        'ads_id': adsId,
        'identifier_for_vendor': identifierForVendor,
        'fcm': fcm,
      }, headers: {
        'Accept': 'application/json'
      });

      await Future.delayed(const Duration(seconds: 2));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        Map<String, dynamic> queryParameters = data['user'];

        Map<String, String> responseUser = queryParameters
            .map((key, value) => MapEntry(key, value!.toString()));

        String responseToken = data['access_token'];

        String refreshToken = data['refresh_token'];

        String? jenisKepegawaian = responseUser['JENIS_KEPEGAWAIAN'];

        DateTime tokenExp =
            DateTime.now().add(Duration(seconds: data['expires_in']));

        await storage.write(
          key: 'uuid',
          value: uuid,
        );

        await storage.write(
          key: 'jenisKepegawaian',
          value: jenisKepegawaian,
        );

        await storage.write(
          key: 'tokenExp',
          value: tokenExp.toString(),
        );

        if (jenisKepegawaian == 'asn') {
          await storage.write(
            key: 'user',
            value: jsonEncode(User.fromJson(responseUser)),
          );
        } else {
          await storage.write(
            key: 'user',
            value: jsonEncode(responseUser),
          );
        }

        await storage.write(
          key: 'token',
          value: responseToken,
        );

        await storage.write(
          key: 'refreshToken',
          value: refreshToken,
        );

        await storage.write(
          key: 'loggedIn',
          value: 'true',
        );

        return true;
      } else {
        final data = jsonDecode(response.body);

        setState(() {
          _buttonPressed = false;
          errorMessage = data['message'];
          Future.delayed(const Duration(seconds: 15), () {
            setState(() {
              errorMessage = '';
            });
          });
        });

        return false;
      }
    } catch (e) {
      setState(() {
        _buttonPressed = false;
      });
      return false;
    }
  }

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  Future<void> loadPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = info.version;
      installerStore = info.installerStore!;
    });
  }

  void requestPermission() async {
    await service.requestPermission(Permission.notification);
  }

  @override
  void initState() {
    super.initState();
    passwordController.clear();
    _buttonPressed = false;
    loadPackageInfo();
    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 0.0,
          ),
          body: SafeArea(
            bottom: false,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: [
                                Lottie.asset(
                                  'assets/json_image/lottie.json',
                                  width: 250,
                                  height: 250,
                                ),
                              ],
                            ),
                            const Center(
                              child: Text('Login',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 32)),
                            ),
                            const Center(
                              child: Text('Single Sign On Kab. Kepulauan Mentawai',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18)),
                            ),
                            Center(
                              child: Text('versi $appVersion',
                                  style: const TextStyle(
                                      color: Colors.blueGrey, fontSize: 11)),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              height: 186,
                              child: Form(
                                // key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Silakan masukan NIP';
                                        }
                                        return null;
                                      },
                                      onTapOutside: (focusNode) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      controller: usernameController,
                                      decoration: InputDecoration(
                                        // contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        hintText: "NIP/Username",
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: TextFormField(
                                        controller: passwordController,
                                        textInputAction: TextInputAction.done,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Silakan masukan Kata Sandi';
                                          }
                                          return null;
                                        },
                                        onTapOutside: (focusNode) {
                                          FocusScope.of(context).unfocus();
                                        },
                                        onFieldSubmitted: (value) {
                                          _onSubmit(context);
                                        },
                                        obscureText: true,
                                        enableSuggestions: true,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                            // contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            hintText: "Kata Sandi",
                                            fillColor: Colors.deepPurple),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  errorMessage,
                                  style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              margin: const EdgeInsets.all(10),
                              child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _buttonPressed
                                          ? Colors.blue[100]
                                          : Colors.blue[500],
                                      minimumSize:
                                          const Size(double.infinity, 50),
                                    ),
                                    onPressed: () => {
                                      _buttonPressed
                                          ? null
                                          : _onSubmit(context),
                                    },
                                    icon: _buttonPressed
                                        ? Container(
                                            width: 24,
                                            height: 24,
                                            padding:
                                                const EdgeInsets.all(2.0),
                                            child:
                                                const CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 3,
                                            ),
                                          )
                                        : const Icon(
                                            color: Colors.white, Icons.login),
                                    label: _buttonPressed
                                        ? const Text('Memeriksa',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white))
                                        : const Text('Login',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
