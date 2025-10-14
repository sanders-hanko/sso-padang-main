import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:home_widget/home_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart' as permission;
import 'package:super_app/Utils/sso_ui.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/features/etpp/pages/etpp_main.dart';
import 'package:super_app/features/surat/pages/surat_masuk.dart';
import 'package:super_app/landing.dart';
import 'package:super_app/pages/cuti/index_cuti.dart';
import 'package:super_app/services/permission_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:super_app/services/webview_page.dart';
import 'package:super_app/tab_view_page/pegawai.dart';
import 'package:super_app/pages/coming_soon.dart';
import 'package:super_app/services/take_foto.dart';
import 'package:super_app/pages/presensi/index_presensi.dart';
import 'package:appcheck/appcheck.dart';
import 'package:advertising_id/advertising_id.dart';
import '../core/auth/blocs/permission_state.dart';
import '../features/aktivitas/pages/aktivitas_main.dart';

List<String> imgList = [];

dynamic user;

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => BerandaState();
}

class BerandaState extends State<Beranda> with WidgetsBindingObserver {
  final PermissionService _permissionService = PermissionService();
  final Utils utils = Utils();
  late StreamSubscription<Position>? locationSubs;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  late permission.PermissionStatus _locationPermissionStatus =
      permission.PermissionStatus.denied;
  late bool _locationServiceStatus = false;

  StreamSubscription<Position>? _locationSubscription;
  Position? _currentPosition;
  AppLifecycleState _appState = AppLifecycleState.resumed;

  late bool isMocked = true;
  late bool isLocationStreamActive = false;
  late bool isLocationServiceActive = false;
  late bool isInRadius = false;
  late bool isOfficeRegistered = false;
  late bool cutiPegawaiPermission = false;
  late bool izinPegawaiPermission = false;
  late String cutiPegawaiPermissionStorage = 'default';
  late String izinPegawaiPermissionStorage = 'default';
  late List<dynamic> kantor;
  late double kantorLat = 0;
  late List<double> listKantorLat = [];
  late double currentLat = 0;
  late double kantorLong = 0;
  late List<double> listKantorLong = [];
  late double currentLong = 0;
  late String kantorNama;
  late List<String> listKantorNama = [];
  late double kantorRadius;
  late List<double> listKantorRadius = [];
  late String cutiPegawaiBadge = '';
  late String izinPegawaiBadge = '';
  late bool isHukdis = false;
  late Widget infoHukdis = Container();
  late String currentTime = '';

  late int _current = 0;
  late bool locationLoadState = false;
  late Widget modalContent;
  final CarouselSliderController _controller = CarouselSliderController();
  late String absenMasuk = "Tap Presensi";
  late String absenPulang = "Tap Presensi";
  late String lokasiAbsen = "-\nLokasi";
  late String noteAbsen = "-\nCatatan";
  late String domino = "Checking domino ..";
  late bool kantorLoaded = false;
  late List<Widget> modalMessage = <Widget>[];

  late String appVersion = 'null';
  late String installerStore = 'null';
  late String? advertisingId;
  late String? fcm;
  late List installedApp = [];

  Future<void> fetchPermission() async {
    context.read<PermissionBloc>().add(const PermissionEvent.fetch());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setImageUrl();
    requestPermission();
    checkUser();
    loadPackageInfo();
    cekHukdis();
    runAppCheck();
    fetchPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopLocationStream();
    super.dispose();
  }

  Future<void> runAppCheck() async {
    if (defaultTargetPlatform == TargetPlatform.android && context.mounted) {
      final appCheck = AppCheck();
      final String authority = utils.simpegDomain;
      final String unencodedPath = utils.appPackage;
      final url = Uri.https(authority, unencodedPath);

      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['data'].length > 0) {
        final listApp = jsonDecode(response.body)['data'];

        for (var appList in listApp) {
          final isInstalled =
              await appCheck.isAppInstalled(appList['nama_package'].toString());

          if (isInstalled) {
            installedApp.add(appList['id']);
            setState(() {});
          }
        }
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // AppLifecycleState.resumed
    // AppLifecycleState.inactive
    // AppLifecycleState.paused
    setState(() {
      _appState = state;
    });
    if (_appState == AppLifecycleState.resumed) {
      fetchPermission();
    }
    _manageLocationStream();
  }

  Future<void> cekHukdis() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final user = await storage.read(key: 'user');
    final String nip = jsonDecode(user!)['nip'];
    final String authority = utils.simpegIP;
    final String unencodedPath = utils.cekHukdis + nip;
    final url = Uri.http(authority, unencodedPath);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['is_hukdis']) {
        setState(
          () {
            isHukdis = true;
            infoHukdis = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  width: 0.8 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    border: Border.all(
                      color: Colors.orange,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Sedang masa hukuman disiplin.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void setImageUrl() {
    imgList.clear();
    imgList.add('http://${Utils().simpegIP}${Utils().getSlide1}');
    imgList.add('http://${Utils().simpegIP}${Utils().getSlide2}');
    imgList.add('http://${Utils().simpegIP}${Utils().getSlide3}');
    imgList.add('http://${Utils().simpegIP}${Utils().getSlide4}');
    imgList.add('http://${Utils().simpegIP}${Utils().getSlide5}');
  }

  Future<void> loadPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = info.version;
      installerStore = info.installerStore!;
    });
  }

  Future<void> requestPermission() async {
    final locationPermissionStatus = await _permissionService
        .requestPermission(permission.Permission.location);

    final locationServiceStatus = await Geolocator.isLocationServiceEnabled();

    await _permissionService
        .requestPermission(permission.Permission.appTrackingTransparency);

    await _permissionService
        .requestPermission(permission.Permission.notification);

    setState(() {
      _locationPermissionStatus = locationPermissionStatus;
      _locationServiceStatus = locationServiceStatus;
    });

    _checkLocationService();
  }

  Future<void> getDataKantor() async {
    var url = Uri.http(Utils().presensiIP, '/api/get-data-kantor');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      kantor = jsonDecode(response.body)['data'];

      setState(() {
        kantorLoaded = true;
      });

      for (var data in kantor) {
        if (data['unor_induk_id'] == user['unorIndukId']) {
          setState(() {
            listKantorLat.add(double.parse(data['latitude_kantor']));
            listKantorLong.add(double.parse(data['longitude_kantor']));
            listKantorNama.add(data['nama_kantor']);
            listKantorRadius.add(double.parse(data['radius']));
            kantorLat = double.parse(data['latitude_kantor']);
            kantorLong = double.parse(data['longitude_kantor']);
            kantorNama = data['nama_kantor'];
            kantorRadius = double.parse(data['radius']);
            if (kantorLat != 0 && kantorLong != 0) {
              setState(() {
                isOfficeRegistered = true;
              });
            }
          });
          refreshTime();
        }
      }
    }
  }

  Future<void> getJumlahCutiPegawai() async {
    var url = Uri.http(
        utils.presensiIP, '${Utils().getJumlahCutiPegawai}/${user["nip"]}/0');
    var response = await http.get(url);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)['success'] == true) {
      if (jsonDecode(response.body)['success'] &&
          jsonDecode(response.body)['data']['jumlah'] > 0) {
        setState(() {
          cutiPegawaiBadge =
              jsonDecode(response.body)['data']['jumlah'].toString();
        });
      }
    } else {
      setState(() {
        cutiPegawaiBadge = '';
      });
    }
  }

  Future<void> getJumlahIzinPegawai() async {
    var url = Uri.http(
        utils.presensiIP, '${Utils().getJumlahIzinPegawai}/${user["nip"]}/0');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success'] &&
          jsonDecode(response.body)['data']['jumlah'] > 0) {
        setState(() {
          izinPegawaiBadge =
              jsonDecode(response.body)['data']['jumlah'].toString();
        });
      }
    } else {
      setState(() {
        izinPegawaiBadge = '';
      });
    }
  }

  Future<void> _determinePosition() async {
    setState(() {
      modalMessage = <Widget>[
        const Center(
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: CircularProgressIndicator(
              value: null,
              strokeWidth: 7.0,
              color: Colors.blueAccent,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 25.0),
          child: const Center(
            child: Text(
              "Sedang diproses..",
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ),
      ];

      locationLoadState = true;
    });

    const storage = FlutterSecureStorage();

    var url = Uri.http(Utils().presensiIP, '/api/absensi');
    var token = await storage.read(key: 'token');
    var user = await storage.read(key: 'user');
    String? uuid = await storage.read(key: 'uuid');
    var nip = jsonDecode(user!)['nip'];

    if (isInRadius) {
      var tanggalSekarang =
          "${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}";

      var storageJamMasuk =
          await storage.read(key: "jam_masuk_$tanggalSekarang");
      var storageJamPulang =
          await storage.read(key: "jam_pulang_$tanggalSekarang");

      if (storageJamMasuk != null && storageJamPulang != null) {
        return;
      }

      try {
        advertisingId = await AdvertisingId.id(true);
        fcm = await messaging.getToken();
        await http.post(url, headers: {
          'Authorization': 'Bearer $token'
        }, body: {
          'time': currentTime,
          'nip': '$nip',
          'latitude': '$currentLat',
          'longitude': '$currentLong',
          'isMocked': '$isMocked',
          'appVersion': appVersion,
          'installerStore': installerStore,
          'uuid': '$uuid',
          'ads_id': advertisingId ?? '',
          'fcm': fcm ?? '',
          'installed_app': installedApp.toString(),
        }).then((value) async {
          if (value.statusCode == 200) {
            var tanggalSekarang =
                "${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}";

            var lokasi =
                "${jsonDecode(value.body)['lokasi'][0]}\n${jsonDecode(value.body)['lokasi'][1]}";
            var note =
                "${jsonDecode(value.body)['note'][0]}\n${jsonDecode(value.body)['note'][1]}";

            storage.write(key: 'lokasi_$tanggalSekarang', value: lokasi);
            storage.write(key: 'note_$tanggalSekarang', value: note);

            lokasiAbsen = lokasi;
            noteAbsen = note;

            switch (jsonDecode(value.body)['presensi_code']) {
              case 1:
                storage.write(
                    key: 'jam_masuk_$tanggalSekarang',
                    value: jsonDecode(value.body)['jam_masuk']);
                absenMasuk = jsonDecode(value.body)['jam_masuk'];
                break;
              case 2:
                storage.write(
                    key: 'jam_keluar_$tanggalSekarang',
                    value: jsonDecode(value.body)['jam_keluar']);
                absenPulang = jsonDecode(value.body)['jam_keluar'];
                break;
              default:
            }

            await HomeWidget.saveWidgetData<String>(
                'jam_masuk', jsonDecode(value.body)['jam_masuk']);
            await HomeWidget.saveWidgetData<String>(
                'jam_pulang', jsonDecode(value.body)['jam_keluar']);
            await HomeWidget.updateWidget(
              androidName: 'SuratWidgetProvider',
            );

            modalMessage = <Widget>[
              const Center(
                child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: Icon(
                      CupertinoIcons.check_mark_circled,
                      color: Colors.green,
                      size: 50.0,
                    )),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                child: Center(
                  child: Text(
                    jsonDecode(value.body)['message'],
                    style: const TextStyle(color: Colors.black45),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ];

            Future.delayed(const Duration(seconds: 2), () {
              locationLoadState = false;
              refreshTime();
            });
          } else {
            modalMessage = <Widget>[
              const Center(
                child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: Icon(
                      CupertinoIcons.xmark_circle,
                      color: Colors.red,
                      size: 50.0,
                    )),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                child: Center(
                  child: Text(
                    jsonDecode(value.body)['message'],
                    style: const TextStyle(color: Colors.black45),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ];

            Future.delayed(const Duration(seconds: 2), () {
              locationLoadState = false;
              refreshTime();
            });
          }

          setState(() {});
        });
      } catch (e) {
        await storage.write(key: 'error', value: e.toString());
        modalMessage = <Widget>[
          const Center(
            child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: Icon(
                  CupertinoIcons.xmark_circle,
                  color: Colors.red,
                  size: 50.0,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: const Center(
              child: Text(
                "Terjadi kesalahan.",
                style: TextStyle(color: Colors.black45),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ];

        Future.delayed(const Duration(seconds: 1), () {
          locationLoadState = false;
        });

        setState(() {});

        return;
      }
    } else {
      final Map<String, dynamic> data =
          await Navigator.of(context, rootNavigator: true)
              .push(
        MaterialPageRoute(
          builder: (_) => const TakePhoto(),
        ),
      )
              .then(
        (value) {
          if (value == null) {
            modalMessage = <Widget>[
              const Center(
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: Icon(
                    CupertinoIcons.xmark_circle,
                    color: Colors.red,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                child: const Center(
                  child: Text(
                    "Pengambilan absen dibatalkan.",
                    style: TextStyle(color: Colors.black45),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ];
            Future.delayed(const Duration(seconds: 2), () {
              locationLoadState = false;
              refreshTime();
            });
            setState(() {});
          }
          return value;
        },
      );

      final String? imagePath = data['path'];
      final String? alasan = data['alasan'];
      final String? atasan = data['atasan'];

      http.MultipartRequest request = http.MultipartRequest('POST', url);

      if (imagePath == null) {
        modalMessage = <Widget>[
          const Center(
            child: SizedBox(
              height: 50.0,
              width: 50.0,
              child: Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.red,
                size: 50.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: const Center(
              child: Text(
                "Pengambilan absen dibatalkan.",
                style: TextStyle(color: Colors.black45),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ];
        Future.delayed(const Duration(seconds: 2), () {
          locationLoadState = false;
          refreshTime();
        });
        setState(() {});
        return;
      }
      advertisingId = await AdvertisingId.id(true);
      fcm = await messaging.getToken();

      request.files.add(await http.MultipartFile.fromPath('berkas', imagePath));
      request.headers.addAll({'Authorization': 'Bearer $token'});
      request.fields.addAll({
        'time': currentTime,
        'nip': '$nip',
        'alasan': '$alasan',
        'atasan': '$atasan',
        'latitude': '$currentLat',
        'longitude': '$currentLong',
        'isMocked': '$isMocked',
        'appVersion': appVersion,
        'installerStore': installerStore,
        'uuid': '$uuid',
        'ads_id': advertisingId ?? '',
        'fcm': fcm ?? '',
        'installed_app': installedApp.toString(),
      });

      http.StreamedResponse response = await request.send();
      var responseBytes = await response.stream.toBytes();
      var responseString = utf8.decode(responseBytes);

      if (response.statusCode == 200) {
        var tanggalSekarang =
            "${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}";

        var lokasi =
            "${jsonDecode(responseString)['lokasi'][0]}\n${jsonDecode(responseString)['lokasi'][1]}";
        var note =
            "${jsonDecode(responseString)['note'][0]}\n${jsonDecode(responseString)['note'][1]}";

        storage.write(key: 'lokasi_$tanggalSekarang', value: lokasi);
        storage.write(key: 'note_$tanggalSekarang', value: note);

        lokasiAbsen = lokasi;
        noteAbsen = note;

        switch (jsonDecode(responseString)['presensi_code']) {
          case 1:
            storage.write(
                key: 'jam_masuk_$tanggalSekarang',
                value: jsonDecode(responseString)['jam_masuk']);
            absenMasuk = jsonDecode(responseString)['jam_masuk'];
            break;
          case 2:
            storage.write(
                key: 'jam_keluar_$tanggalSekarang',
                value: jsonDecode(responseString)['jam_keluar']);
            absenPulang = jsonDecode(responseString)['jam_keluar'];
            break;
          default:
        }

        await HomeWidget.saveWidgetData<String>(
            'jam_masuk', jsonDecode(responseString)['jam_masuk']);
        await HomeWidget.saveWidgetData<String>(
            'jam_pulang', jsonDecode(responseString)['jam_keluar']);
        await HomeWidget.updateWidget(
          androidName: 'SuratWidgetProvider',
        );

        modalMessage = <Widget>[
          const Center(
            child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: Icon(
                  CupertinoIcons.check_mark_circled,
                  color: Colors.green,
                  size: 50.0,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: Center(
              child: Text(
                jsonDecode(responseString)['message'],
                style: const TextStyle(color: Colors.black45),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ];

        Future.delayed(const Duration(seconds: 1), () {
          locationLoadState = false;
        });
      } else {
        modalMessage = <Widget>[
          const Center(
            child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: Icon(
                  CupertinoIcons.xmark_circle,
                  color: Colors.red,
                  size: 50.0,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: Center(
              child: Text(
                jsonDecode(responseString)['message'],
                style: const TextStyle(color: Colors.black45),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ];

        Future.delayed(const Duration(seconds: 2), () {
          locationLoadState = false;
          refreshTime();
        });
      }

      setState(() {});
    }
  }

  Future<void> checkUser() async {
    var tanggalSekarang =
        "${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}";
    const storage = FlutterSecureStorage();
    final dataStorage = await storage.read(key: 'user');
    final jamMasuk = await storage.read(key: 'jam_masuk_$tanggalSekarang');
    final jamKeluar = await storage.read(key: 'jam_keluar_$tanggalSekarang');
    final lokasi = await storage.read(key: 'lokasi_$tanggalSekarang');
    final note = await storage.read(key: 'note_$tanggalSekarang');
    final jsonUser = dataStorage != null ? jsonDecode(dataStorage) : null;

    setState(() {
      user = jsonUser;
    });

    if (jamMasuk != null ||
        jamKeluar != null ||
        lokasi != null ||
        note != null) {
      setState(() {
        absenMasuk = jamMasuk ?? "Tap Presensi";
        absenPulang = jamKeluar ?? "Tap Presensi";
        lokasiAbsen = lokasi ?? "-\nLokasi";
        noteAbsen = note ?? "-\nCatatan";
      });
    } else {
      await checkAbsen();
    }

    await getDataKantor();
    await _permissionService.getPermission(user['jabatanId']);
    await checkPermission();
    await getJumlahCutiPegawai();
    await getJumlahIzinPegawai();
  }

  Future<void> refresh() async {
    await checkAbsen();
    await getDataKantor();
    await _permissionService.getPermission(user['jabatanId']);
    await checkPermission();
    await getJumlahCutiPegawai();
    await getJumlahIzinPegawai();
    await cekHukdis();
    fetchPermission();
  }

  void refreshTime() {
    setState(() {
      final date = DateTime.now();
      currentTime =
          '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}';
    });
  }

  Future<void> checkPermission() async {
    await storage.read(key: 'cutiPegawaiPermission').then((value) => {
          setState(() {
            cutiPegawaiPermissionStorage = 'saved $value';
            if (value == '1') {
              cutiPegawaiPermission = true;
            } else {
              cutiPegawaiPermission = false;
            }
          })
        });
    await storage.read(key: 'izinPegawaiPermission').then((value) => {
          setState(() {
            izinPegawaiPermissionStorage = 'saved $value';
            if (value == '1') {
              izinPegawaiPermission = true;
            } else {
              izinPegawaiPermission = false;
            }
          })
        });
  }

  Future<void> checkAbsen() async {
    const storage = FlutterSecureStorage();
    var userData = await storage.read(key: 'user');
    var token = await storage.read(key: 'token');
    var tgl =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

    var url = Uri.http(Utils().presensiIP,
        '${Utils().dataRiwayat}/${jsonDecode(userData!)['nip']}/$tgl/$tgl');

    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      const flutterStorage = FlutterSecureStorage();

      var tgl =
          '${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}';

      if (jsonDecode(response.body)[0]['kalender'][0]['data_absen'] != null) {
        var tapIn =
            jsonDecode(response.body)[0]['kalender'][0]['data_absen']['tap_in'];
        var tapOut = jsonDecode(response.body)[0]['kalender'][0]['data_absen']
            ['tap_out'];
        var lokasi =
            jsonDecode(response.body)[0]['kalender'][0]['data_absen']['lokasi'];
        var note =
            jsonDecode(response.body)[0]['kalender'][0]['data_absen']['note'];
        lokasi ??= '-\nLokasi';
        note ??= '-\nCatatan';
        await flutterStorage.write(key: 'jam_masuk_$tgl', value: tapIn);
        await flutterStorage.write(key: 'lokasi_$tgl', value: lokasi);
        await flutterStorage.write(key: 'note_$tgl', value: note);

        if (tapOut != null) {
          await flutterStorage.write(key: 'jam_keluar_$tgl', value: tapOut);
        }

        absenMasuk = tapIn ?? "Tap Presensi";
        absenPulang = tapOut ?? "Tap Presensi";
        noteAbsen = note;
        lokasiAbsen = lokasi;
      } else {
        await flutterStorage.delete(key: 'jam_masuk_$tgl');
        await flutterStorage.delete(key: 'lokasi_$tgl');
        await flutterStorage.delete(key: 'note_$tgl');
        await flutterStorage.delete(key: 'jam_keluar_$tgl');

        setState(() {
          absenMasuk = "Tap Presensi";
          absenPulang = "Tap Presensi";
          lokasiAbsen = "-\nLokasi";
          noteAbsen = "-\nCatatan";
        });
      }

      setState(() {});
    } else {
      //no action
    }
  }

  Future<void> _checkLocationService() async {
    await Future.delayed(const Duration(seconds: 2));
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      _startLocationStream();
    }
  }

  void _startLocationStream() {
    if (_locationSubscription != null) {
      _locationSubscription?.cancel();
      _locationSubscription = null;
    }
    _locationSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        _currentPosition = position;
        isLocationServiceActive = true;
      });
    });
  }

  void _stopLocationStream() {
    _locationSubscription?.cancel();

    setState(() {
      _currentPosition = null;
      isOfficeRegistered = false;
      _locationPermissionStatus = permission.PermissionStatus.denied;
      _locationServiceStatus = false;
      _locationSubscription = null;
      _appState = AppLifecycleState.inactive;
    });
  }

  void _manageLocationStream() {
    if (_appState == AppLifecycleState.resumed) {
      requestPermission();
      getDataKantor();
      _checkLocationService();
    } else if (_appState == AppLifecycleState.inactive ||
        _appState == AppLifecycleState.paused) {
      _stopLocationStream();
    }
  }

  Widget locationWidget() {
    final screenWidth = MediaQuery.of(context).size.width;
    final textSize = screenWidth * 0.024 + 2;
    final iconSize = screenWidth * 0.08;

    if (!_locationServiceStatus) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_image/gps_disable.svg',
            width: iconSize,
          ),
          SizedBox(
            width: 0.023 * screenWidth,
          ),
          Text(
            'Layanan GPS tidak aktif!',
            style: TextStyle(
              fontSize: textSize,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
        ],
      );
    }

    if (_locationPermissionStatus != permission.PermissionStatus.granted) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_image/gps_disable.svg',
            width: iconSize,
          ),
          SizedBox(
            width: 0.023 * screenWidth,
          ),
          Text(
            'Izin lokasi tidak aktif!',
            style: TextStyle(
              fontSize: textSize,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
        ],
      );
    }

    if (_currentPosition == null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_image/gps_disable.svg',
            width: iconSize,
          ),
          SizedBox(
            width: 0.023 * screenWidth,
          ),
          Text(
            'Menunggu GPS!',
            style: TextStyle(
              fontSize: textSize,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
        ],
      );
    }

    if (kantorLoaded && listKantorNama.isEmpty) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_image/placeholder_gps.svg',
            width: iconSize,
          ),
          SizedBox(
            width: 0.023 * screenWidth,
          ),
          Text(
            'Kantor belum terdaftar!',
            style: TextStyle(
              fontSize: textSize,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
        ],
      );
    }

    if (!isOfficeRegistered) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_image/cloud_database.svg',
            width: iconSize,
          ),
          SizedBox(
            width: 0.023 * screenWidth,
          ),
          Text(
            'Connecting...',
            style: TextStyle(
              fontSize: textSize,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
        ],
      );
    }

    setState(() {
      currentLat = _currentPosition!.latitude;
      currentLong = _currentPosition!.longitude;
      isMocked = _currentPosition!.isMocked;
    });

    late List<double> distance = [];

    int index = 0;
    for (var data in listKantorLong) {
      distance.add(Geolocator.distanceBetween(
        listKantorLat[index],
        data,
        currentLat,
        currentLong,
      ));
      index++;
    }

    late double jarakTerdekat = 1000.0;
    int i = 0;
    int posisi = 0;

    for (var jarak in distance) {
      if (jarak < jarakTerdekat) {
        jarakTerdekat = jarak;
        posisi = i;
      }
      i++;
    }

    if (jarakTerdekat > kantorRadius) {
      setState(() {
        isInRadius = false;
      });
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_image/route_gps.svg',
            width: iconSize,
          ),
          SizedBox(
            width: 0.023 * screenWidth,
          ),
          Text(
            'Diluar kantor',
            style: TextStyle(
              fontSize: textSize,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
        ],
      );
    } else {
      setState(() {
        isInRadius = true;
      });
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_image/building_small.svg',
            width: iconSize,
          ),
          SizedBox(
            width: 0.023 * screenWidth,
          ),
          Text(
            listKantorNama[posisi],
            style: TextStyle(
              fontSize: textSize,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String firstname = '';
    String nip = '';
    String avatar = 'assets/svg_image/avatar_male.svg';
    if (user != null) {
      nip = user['nip'];
      firstname = user['nama'];
      avatar = user['jenisKelamin'] == 'F'
          ? 'assets/svg_image/avatar_female.svg'
          : 'assets/svg_image/avatar_male.svg';
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final textSize = screenWidth * 0.024 + 2;
    final iconSize = screenWidth * 0.08;
    final extendSize = screenWidth * 0.25;
    final headerHeight = iconSize + 20;

    var body = ListView(
      children: [
        Container(
          height: headerHeight,
          padding: const EdgeInsets.only(left: 16.0),
          margin: EdgeInsets.symmetric(
            horizontal: 0.055 * screenWidth,
            vertical: 0.028 * screenWidth,
          ),
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstname,
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                      textAlign: TextAlign.left,
                      textScaler: const TextScaler.linear(1.2),
                    ),
                    Text(
                      nip,
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                      textAlign: TextAlign.left,
                      textScaler: const TextScaler.linear(1.2),
                    )
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          CupertinoPageRoute(
                            builder: (context) {
                              return const Pegawai();
                            },
                          ),
                        ).then((val) {});
                      },
                      child: Container(
                        width: iconSize + 5,
                        margin: const EdgeInsets.only(right: 10.0, left: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SvgPicture.asset(
                          avatar,
                          width: iconSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
              flex: 0,
              child: CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 21 / 9,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _current = index;
                      },
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map(
                (entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        locationWidget(),
        infoHukdis,
        Container(
          margin: EdgeInsets.only(
            left: 0.04 * screenWidth,
            right: 0.04 * screenWidth,
            top: 0.05 * screenWidth,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Informasi presensi hari ini',
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaler: const TextScaler.linear(1.2),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    Utils().tanggalHariIni(),
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaler: const TextScaler.linear(1.2),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              StaggeredGrid.count(
                crossAxisCount: 6,
                children: [
                  StaggeredGridTile.extent(
                    crossAxisCellCount: 3,
                    mainAxisExtent: (3 / 4) * extendSize,
                    child: Card(
                      color: CupertinoColors.white,
                      surfaceTintColor: CupertinoColors.white,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 0.04 * screenWidth,
                          right: 5.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {
                            _determinePosition();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                'assets/svg_image/sunrise.svg',
                                width: iconSize,
                              ),
                              SizedBox(
                                width: 0.023 * screenWidth,
                                // width: (1 / 3) * iconSize,
                              ),
                              Text(
                                '$absenMasuk\nMasuk',
                                style: TextStyle(
                                    fontSize: textSize,
                                    // fontSize: textSize + 4,
                                    color: Colors.black87),
                                textScaler: const TextScaler.linear(1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  StaggeredGridTile.extent(
                    crossAxisCellCount: 3,
                    mainAxisExtent: (3 / 4) * extendSize,
                    child: Card(
                      color: CupertinoColors.white,
                      surfaceTintColor: CupertinoColors.white,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 0.04 * screenWidth,
                          right: 10.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {
                            _determinePosition();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                'assets/svg_image/sunset.svg',
                                width: iconSize,
                              ),
                              SizedBox(
                                width: 0.023 * screenWidth,
                                // width: (1 / 3) * iconSize,
                              ),
                              Text(
                                '$absenPulang\nPulang',
                                style: TextStyle(
                                    fontSize: textSize,
                                    // fontSize: textSize + 4,
                                    color: Colors.black87),
                                textScaler: const TextScaler.linear(1.2),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  StaggeredGridTile.extent(
                    crossAxisCellCount: 3,
                    mainAxisExtent: (3 / 4) * extendSize,
                    child: Card(
                      color: CupertinoColors.white,
                      surfaceTintColor: CupertinoColors.white,
                      child: Container(
                        width: 150.0,
                        margin: EdgeInsets.only(
                          left: 0.04 * screenWidth,
                          right: 5.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg_image/map_location.svg',
                              width: iconSize,
                            ),
                            SizedBox(
                              width: 0.023 * screenWidth,
                              // width: (1 / 3) * iconSize,
                            ),
                            Text(
                              lokasiAbsen,
                              style: TextStyle(
                                fontSize: textSize,
                                // fontSize: textSize + 4,
                              ),
                              textScaler: const TextScaler.linear(1.2),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  StaggeredGridTile.extent(
                    crossAxisCellCount: 3,
                    mainAxisExtent: (3 / 4) * extendSize,
                    child: Card(
                      color: CupertinoColors.white,
                      surfaceTintColor: CupertinoColors.white,
                      child: Container(
                        width: 150.0,
                        margin: EdgeInsets.only(
                          left: 0.04 * screenWidth,
                          right: 10.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg_image/information.svg',
                              width: iconSize,
                            ),
                            SizedBox(
                              width: 0.023 * screenWidth,
                            ),
                            Text(
                              noteAbsen,
                              style: TextStyle(
                                fontSize: textSize,
                              ),
                              textScaler: const TextScaler.linear(1.2),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _currentPosition != null &&
                      isLocationServiceActive &&
                      isOfficeRegistered &&
                      _locationPermissionStatus ==
                          permission.PermissionStatus.granted
                  ? const Text('')
                  : Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius:
                              BorderRadius.circular(0.045 * screenWidth),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg_image/lock_circle.svg',
                                  width: iconSize,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 0.04 * screenWidth,
            top: 0.05 * screenWidth,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Layanan Kepegawaian',
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaler: const TextScaler.linear(1.2),
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'Presensi',
                    asset: 'assets/svg_image/id_card.svg',
                    ref: const IndexPresensi(),
                    badgeText: izinPegawaiPermission ? izinPegawaiBadge : '',
                  ),
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'e-TPP',
                    asset: 'assets/svg_image/pie_chart.svg',
                    ref: const EtppMain(),
                    // badgeText: 'soon',
                    // ref: const ComingSoon(
                    //   title: 'e-TPP',
                    // ),
                  ),
                ],
              ),
              Column(
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'e-Cuti',
                    ref: const IndexCuti(),
                    asset: 'assets/svg_image/calendar.svg',
                    badgeText: cutiPegawaiPermission ? cutiPegawaiBadge : '',
                  ),
                  BlocConsumer<PermissionBloc, PermissionState>(
                    listener: (context, state) {
                      if (state is PermissionLoaded) {
                        context
                            .read<PermissionBloc>()
                            .add(const PermissionEvent.read());

                        SnackBar snackBar = const SnackBar(
                          content: Text(
                            'Data aplikasi berhasil dimuat.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: CupertinoColors.white),
                          ),
                          backgroundColor: CupertinoColors.activeGreen,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      if (state is PermissionLoadError) {
                        context
                            .read<PermissionBloc>()
                            .add(const PermissionEvent.read());

                        SnackBar snackBar = SnackBar(
                          content: Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style:
                                const TextStyle(color: CupertinoColors.white),
                          ),
                          backgroundColor: CupertinoColors.destructiveRed,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    builder: (context, state) {
                      return NewGrid(
                        screenWidth: screenWidth,
                        textSize: textSize,
                        iconSize: iconSize,
                        text: 'Aktivitas',
                        asset: 'assets/svg_image/presentation_analysis.svg',
                        ref: const AktivitasMain(),
                      );
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'e-Gaber',
                    asset: 'assets/svg_image/pen-fountain.svg',
                    badgeText: 'soon',
                    ref: const ComingSoon(
                      title: 'e-Gaber',
                    ),
                  ),
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'e-Arsip',
                    asset: 'assets/svg_image/archive.svg',
                    badgeText: 'soon',
                    ref: const ComingSoon(
                      title: 'e-Arsip',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'SIBANGKOM',
                    asset: 'assets/svg_image/studying.svg',
                    badgeText: 'soon',
                    // ref: const IndexSibangkom(),
                    ref: const ComingSoon(
                      title: 'SIBANGKOM',
                    ),
                  ),
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'e-Pensiun',
                    asset: 'assets/svg_image/briefcase.svg',
                    badgeText: 'soon',
                    ref: const ComingSoon(
                      title: 'Pensiun',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'e-Mutasi',
                    asset: 'assets/svg_image/workspace_employee.svg',
                    badgeText: 'soon',
                    // ref: const IndexMutasi(),
                    ref: const ComingSoon(
                      title: 'e-Mutasi',
                    ),
                  ),
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'e-Pangkat',
                    asset: 'assets/svg_image/user_businessman.svg',
                    badgeText: 'soon',
                    // ref: const IndexPangkat(),
                    ref: const ComingSoon(
                      title: 'e-Pangkat',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 0.04 * screenWidth,
            top: 0.05 * screenWidth,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Layanan Umum',
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaler: const TextScaler.linear(1.2),
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Column(
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'Berita',
                    asset: 'assets/svg_image/newspaper_journal.svg',
                    ref: const Landing(),
                  ),
                ],
              ),
              Column(
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'CCTV',
                    asset: 'assets/svg_image/laptop_computer.svg',
                    ref: WebViewPage(
                      title: 'CCTV',
                      webUrl: Utils().cctvDomain,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  BlocBuilder<PermissionBloc, PermissionState>(
                    builder: (context, state) {
                      late bool inputSuratPermission = false;

                      if (state is PermissionLoaded) {
                        state.permission?.forEach((val) {
                          if (val.accessKode == utils.inputSuratAccessCode ||
                              val.accessKode ==
                                  utils.disposisiSuratAccessCode) {
                            inputSuratPermission = true;
                          }
                        });

                        if (inputSuratPermission) {
                          return NewGrid(
                            screenWidth: screenWidth,
                            textSize: textSize,
                            iconSize: iconSize,
                            text: 'Surat Masuk',
                            asset: 'assets/svg_image/email-open.svg',
                            ref: const SuratMasuk(),
                          );
                        }
                      }

                      if (state is Permitted) {
                        state.permission?.forEach((val) {
                          if (val.accessKode == utils.inputSuratAccessCode ||
                              val.accessKode ==
                                  utils.disposisiSuratAccessCode) {
                            inputSuratPermission = true;
                          }
                        });

                        if (inputSuratPermission) {
                          return NewGrid(
                            screenWidth: screenWidth,
                            textSize: textSize,
                            iconSize: iconSize,
                            text: 'Surat Masuk',
                            asset: 'assets/svg_image/email-open.svg',
                            ref: const SuratMasuk(),
                          );
                        }
                      }

                      return NewGrid(
                        screenWidth: screenWidth,
                        textSize: textSize,
                        iconSize: iconSize,
                        text: 'Surat Masuk',
                        asset: 'assets/svg_image/email-open.svg',
                        ref: const ComingSoon(title: 'Surat Masuk'),
                        badgeText: 'soon',
                      );
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'JDIH',
                    asset: 'assets/svg_image/auction_bid.svg',
                    badgeText: 'soon',
                    ref: const ComingSoon(
                      title: 'JDIH',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  NewGrid(
                    screenWidth: screenWidth,
                    textSize: textSize,
                    iconSize: iconSize,
                    text: 'Info Pangan',
                    asset: 'assets/svg_image/shopping_bag.svg',
                    badgeText: 'soon',
                    ref: const ComingSoon(
                      title: 'Pasarami',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0.05 * screenWidth,
        ),
      ],
    );

    var bodyProgress = Stack(
      children: <Widget>[
        body,
        Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
            color: Colors.black26,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            width: 300.0,
            height: 200.0,
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: modalMessage,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.white10,
        surfaceTintColor: Colors.white10,
      ),
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: refresh,
          child: Container(child: locationLoadState ? bodyProgress : body),
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(
                  5.0,
                  5.0,
                ),
              ),
            ],
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          margin: const EdgeInsets.all(2.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    item,
                    fit: BoxFit.fill,
                    width: 800.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(0, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 5.0,
                      ),
                      child: const Text(''),
                    ),
                  ),
                ],
              )),
        ))
    .toList();
