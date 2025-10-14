import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/core/di/injector.dart';
import 'package:super_app/features/aktivitas/application/models/atasan_model/atasan_model.dart';
import 'package:super_app/features/aktivitas/application/models/core_value_model/core_value_model.dart';
import 'package:super_app/features/aktivitas/application/models/kegiatan_model/kegiatan_model.dart';
import 'package:super_app/features/aktivitas/application/models/tanggal_model/tanggal_model.dart';
import '../Utils/utils.dart';

List<String> listNamaBulan = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

String pilihBulanTips =
    'Silakan pilih bulan dengan melakukan tap pada list nama bulan berikut.';

final Utils utils = Utils();
final Dio dio = getIt<Dio>();
const FlutterSecureStorage storage = FlutterSecureStorage();
List<AtasanModel> listDataAtasan = [];
List<CoreValueModel> listDataCoreValue = [];
List<KegiatanModel> listDataKegiatan = [];
List<int> listDataTanggal = [];
TanggalModel? tanggalModel;
