import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/core/auth/repositories/permission_repository.dart';
import 'package:super_app/core/repositories/asisten_repository.dart';
import 'package:super_app/core/repositories/file_repository.dart';
import 'package:super_app/core/repositories/organisasi_repository.dart';
import 'package:super_app/core/repositories/surat_repository.dart';
import 'package:super_app/core/interceptors/token_interceptor.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_bloc/aktivitas_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_validation_bloc/aktivitas_validation_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/atasan_bloc/atasan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/bulan_blocs/bulan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/core_value_bloc/core_value_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/foto_bloc/foto_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/aktivitas_bawahan/aktivitas_bawahan_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/centang_aktivitas_bloc/centang_aktivitas_bloc.dart';
import 'package:super_app/features/etpp/application/blocs/etpp_bloc/etpp_bloc.dart';
import 'package:super_app/features/kamera/application/blocs/kamera_bloc/kamera_bloc.dart';
import 'package:super_app/features/surat/application/blocs/disposisi_bloc/disposisi_bloc.dart';
import 'package:super_app/features/surat/application/blocs/file_bloc/file_bloc.dart';
import 'package:super_app/features/surat/application/blocs/form_input_bloc/form_input_bloc.dart';
import 'package:super_app/features/surat/application/blocs/surat_bloc/surat_bloc.dart';
import '../../features/aktivitas/application/blocs/kegiatan_bloc/kegiatan_bloc.dart';
import '../../features/aktivitas/application/blocs/tanggal_bloc/tanggal_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_bloc.dart' as bulan_bloc;

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FileRepository>(() => FileRepository());

  getIt.registerLazySingleton<TextEditingController>(
    () => TextEditingController(),
  );

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<Utils>(() => Utils());

  getIt.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  getIt.registerLazySingleton<SuratRepository>(
    () => SuratRepository(
      getIt<Utils>(),
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<AsistenRepository>(
    () => AsistenRepository(
      getIt<Dio>(),
      getIt<Utils>(),
    ),
  );

  getIt.registerFactory(
    () => OrganisasiRepository(
      getIt<Dio>(),
      getIt<Utils>(),
    ),
  );

  getIt.registerFactory(
    () => PermissionRepository(
      getIt<Dio>(),
      getIt<Utils>(),
    ),
  );

  getIt.registerFactory(() => SuratBloc(getIt<SuratRepository>()));
  getIt.registerFactory(() => BulanBloc());
  getIt.registerFactory(() => bulan_bloc.BulanBloc());
  getIt.registerFactory(() => AtasanBloc());
  getIt.registerFactory(() => CoreValueBloc());
  getIt.registerFactory(() => KegiatanBloc());
  getIt.registerFactory(() => TanggalBloc());
  getIt.registerFactory(() => FotoBloc());
  getIt.registerFactory(() => AktivitasValidationBloc());
  getIt.registerFactory(() => AktivitasBloc());
  getIt.registerFactory(() => AktivitasBawahanBloc());
  getIt.registerFactory(() => CentangAktivitasBloc());
  getIt.registerFactory(() => EtppBloc());
  getIt.registerFactory(() => KameraBloc());

  getIt.registerFactory(() => FileBloc(getIt<FileRepository>()));
  getIt.registerFactory(() => DisposisiBloc(getIt<SuratRepository>()));

  getIt.registerFactory(() => PermissionBloc(getIt<PermissionRepository>(), getIt<FlutterSecureStorage>()));

  getIt.registerFactory(
    () => TokenInterceptor(
      getIt<Utils>(),
      getIt<FlutterSecureStorage>(),
      getIt<Dio>(),
    ),
  );

  getIt.registerFactory(
    () => FormInputBloc(
      getIt<SuratRepository>(),
      getIt<OrganisasiRepository>(),
      getIt<AsistenRepository>(),
    ),
  );
}
