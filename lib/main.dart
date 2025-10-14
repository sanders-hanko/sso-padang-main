import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/auth/login_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/core/di/injector.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_bloc/aktivitas_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_validation_bloc/aktivitas_validation_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/atasan_bloc/atasan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/bulan_blocs/bulan_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/aktivitas_bawahan/aktivitas_bawahan_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_bloc.dart'
    as bulan_bloc;
import 'package:super_app/features/aktivitas/application/blocs/core_value_bloc/core_value_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/foto_bloc/foto_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/tanggal_bloc/tanggal_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/centang_aktivitas_bloc/centang_aktivitas_bloc.dart';
import 'package:super_app/features/etpp/application/blocs/etpp_bloc/etpp_bloc.dart';
import 'package:super_app/features/kamera/application/blocs/kamera_bloc/kamera_bloc.dart';
import 'package:super_app/features/surat/application/blocs/disposisi_bloc/disposisi_bloc.dart';
import 'package:super_app/features/surat/pages/surat_masuk.dart';
import 'package:super_app/pages/cuti/create_cuti.dart';
import 'package:super_app/pages/home_page.dart';
import 'package:super_app/pages/izin/create_izin.dart';
import 'package:super_app/pages/izin/index_izin.dart';
import 'package:super_app/pages/pangkat/berkas_pangkat.dart';
import 'package:super_app/pages/pangkat/form_pangkat.dart';
import 'package:super_app/pages/pangkat/index_pangkat.dart';
import 'package:super_app/pages/pangkat/pilih_jenis_pangkat.dart';
import 'package:super_app/pages/sibangkom/index_sibangkom.dart';
import 'package:super_app/pages/sibangkom/berkas_simbakom.dart';
import 'package:super_app/pages/sibangkom/form_sibangkom.dart';
import 'package:super_app/pages/sibangkom/pilih_jenis_sibangkom.dart';
import 'package:super_app/tab_view_page/beranda.dart';
import 'features/aktivitas/application/blocs/kegiatan_bloc/kegiatan_bloc.dart';
import 'features/surat/application/blocs/file_bloc/file_bloc.dart';
import 'features/surat/application/blocs/form_input_bloc/form_input_bloc.dart';
import 'features/surat/application/blocs/surat_bloc/surat_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: android,
    );
  } else if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: ios,
    );
  }

  setupLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt<SuratBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FileBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FormInputBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<PermissionBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<DisposisiBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<BulanBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AtasanBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CoreValueBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<KegiatanBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<TanggalBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FotoBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AktivitasValidationBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AktivitasBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<bulan_bloc.BulanBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AktivitasBawahanBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CentangAktivitasBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<EtppBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<KameraBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

FlutterSecureStorage storage = const FlutterSecureStorage();

class MyAppState extends State<MyApp> {
  late bool isLoggedIn = false;
  late String? jenisKepegawaian = '';

  void loggedIn() async {

    // baca sesi aktif dengan durasi timeout 5 detik
    final String? loginSession =
        await storage.read(key: 'loggedIn').timeout(const Duration(seconds: 5));

    final storageJenisKepegawaian = await storage.read(key: 'jenisKepegawaian');

    //set state baru
    setState(() {
      //update nilai attribute "isLoggedIn"
      isLoggedIn = (loginSession == null) ? false : true;
      jenisKepegawaian = storageJenisKepegawaian;
      //hapus splash screen
      FlutterNativeSplash.remove();
    });

    if (kDebugMode) {
      print(jenisKepegawaian);
    }
  }

  @override
  void initState() {
    super.initState();
    loggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      // initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/create-cuti': (context) => const CreateCuti(),
        '/index-izin': (context) => const IndexIzin(),
        '/create-izin': (context) => const CreateIzin(),
        '/index-sibangkom': (context) => const IndexSibangkom(),
        '/jenis-sibangkom': (context) => const PilihJenisSibangkom(),
        '/berkas-sibangkom': (context) => const BerkasSimbakom(
              idLayanan: '',
              namaLayanan: '',
            ),
        '/form-sibangkom': (context) => const FormSibangkom(
              files: [],
              namaLayanan: '',
              idJenisLayanan: '',
            ),
        '/index-pangkat': (context) => const IndexPangkat(),
        '/jenis-pangkat': (context) => const PilihJenisPangkat(),
        '/berkas-pangkat': (context) => const BerkasPangkat(
              idLayanan: '',
              namaLayanan: '',
            ),
        '/form-pangkat': (context) => const FormPangkat(
              files: [],
              namaLayanan: '',
              idJenisLayanan: '',
            ),
      },
      home: isLoggedIn
          ? (jenisKepegawaian == 'asn' ? const Beranda() : SuratMasuk())
          : const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
