import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/core/auth/blocs/permission_state.dart';
import 'package:super_app/core/global_variables.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_bloc/aktivitas_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/atasan_bloc/atasan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/bulan_blocs/bulan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/core_value_bloc/core_value_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/foto_bloc/foto_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/kegiatan_bloc/kegiatan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/tanggal_bloc/tanggal_bloc.dart';
import 'package:super_app/features/aktivitas/application/lokal_variables.dart';
import 'package:super_app/features/aktivitas/application/models/aktivitas_model/aktivitas_model.dart';
import 'package:super_app/features/aktivitas/application/models/atasan_model/atasan_model.dart';
import 'package:super_app/features/aktivitas/application/models/core_value_model/core_value_model.dart';
import 'package:super_app/features/aktivitas/application/models/foto_model/foto_model.dart';
import 'package:super_app/features/aktivitas/application/models/kegiatan_model/kegiatan_model.dart';
import 'package:super_app/features/aktivitas/application/models/list_aktivitas_model/list_aktivitas_model.dart';
import 'package:super_app/features/aktivitas/application/models/poin_model/poin_model.dart';
import 'package:super_app/features/aktivitas/application/models/tanggal_model/tanggal_model.dart';
import 'package:super_app/features/kamera/pages/kamera.dart';

final ImagePicker picker = ImagePicker();

void pilihBulan() {}

void setDefaultBulan(BuildContext context) {
  context.read<BulanBloc>().add(const BulanEvent.initial());
}

void setDefaultTanggal(BuildContext context) {
  context.read<TanggalBloc>().add(const TanggalEvent.setDefault());
}

void fetchAktivitas(BuildContext context, String nip, String tanggal) {
  context.read<AktivitasBloc>().add(AktivitasEvent.fetch(nip, tanggal));
}

Future<void> setDefaultAtasan(
  BuildContext context,
  TextEditingController nipController,
  TextEditingController atasanController,
) async {
  final PermissionState state = context.read<PermissionBloc>().state;
  final String? user = await storage.read(key: 'user');
  final String nip = jsonDecode(user!)['nip'];
  if (state is PermissionLoaded) {
    nipController.text = nip;
    state.permission?.forEach(
      (val) {
        if (val.accessKode == utils.bypassAktivitasAccessCode) {
          atasanController.text = nip;
        }
      },
    );
  }

  if (state is Permitted) {
    nipController.text = state.user.nip;
    state.permission?.forEach(
      (val) {
        if (val.accessKode == utils.bypassAktivitasAccessCode) {
          atasanController.text = state.user.nip;
        }
      },
    );
  }
}

void fetchAtasan(BuildContext context) {
  context.read<AtasanBloc>().add(const AtasanEvent.fetch());
}

void fetchCoreValue(BuildContext context) {
  context.read<CoreValueBloc>().add(const CoreValueEvent.fetch());
}

void initialKegiatan(BuildContext context) {
  context.read<KegiatanBloc>().add(const KegiatanEvent.initial());
}

void initialFoto(BuildContext context) {
  context.read<FotoBloc>().add(const FotoEvent.initial());
}

void pickFoto(BuildContext context, bool bypassPermission) {
  context.read<FotoBloc>().add(FotoEvent.pickFoto(bypassPermission, context));
}

Future<Map<String, dynamic>> defaultBulan() async {
  final date = DateTime.now();
  final int bulan = date.month;
  final String namaBulan = listNamaBulan[bulan - 1];
  final String bulanString =
      bulan.toString().length == 1 ? '0$bulan' : bulan.toString();
  final String tahun = date.year.toString();
  final String tanggal = '$tahun-$bulanString';

  return {
    'bulan': bulan.toString(),
    'namaBulan': namaBulan,
    'tahun': tahun,
    'tanggal': tanggal,
  };
}

Future<TanggalModel?> defaultTanggal() async {
  final date = DateTime.now();
  final int tanggal = date.day;
  final int bulan = date.month;
  final String namaBulan = listNamaBulan[bulan - 1];
  final String tahun = date.year.toString();
  final int totalDays = daysInMonth(date);
  final List<int> listOfDates = List<int>.generate(totalDays, (i) => i + 1);

  tanggalModel = TanggalModel.fromJson({
    'tahun': tahun,
    'bulan': bulan.toString(),
    'tanggal': tanggal.toString(),
    'namaBulan': namaBulan,
    'listTanggal': listOfDates,
  });

  return tanggalModel;
}

Future<TanggalModel?> setListTanggal(
    int inputTahun, int inputBulan, int? inputTanggal) async {
  late DateTime date;
  if (inputTanggal == null) {
    date = DateTime(inputTahun, inputBulan);
  } else {
    date = DateTime(inputTahun, inputBulan, inputTanggal);
  }
  final int bulan = date.month;
  final String namaBulan = listNamaBulan[bulan - 1];
  final String tahun = date.year.toString();
  final int totalDays = daysInMonth(date);
  final List<int> listOfDates = List<int>.generate(totalDays, (i) => i + 1);

  tanggalModel = TanggalModel.fromJson({
    'tahun': tahun,
    'bulan': bulan.toString(),
    'tanggal': inputTanggal?.toString(),
    'namaBulan': namaBulan,
    'listTanggal': listOfDates,
  });

  return tanggalModel;
}

Future<Map<String, dynamic>> setTanggal(int index) async {
  final date = DateTime.now();
  final int bulan = index + 1;
  final String namaBulan = listNamaBulan[index];
  final String bulanString =
      bulan.toString().length == 1 ? '0$bulan' : bulan.toString();
  final String tahun = date.year.toString();
  final String tanggal = '$tahun-$bulanString';

  return {
    'bulan': bulan.toString(),
    'namaBulan': namaBulan,
    'tahun': tahun,
    'tanggal': tanggal,
  };
}

Future<List<AtasanModel>> getAtasan() async {
  final data = await storage.read(key: 'user');
  final nip = jsonDecode(data!)['nip'];
  final String protokol = utils.protokolHttps;
  final String domain = utils.simpegDomain;
  final String path = '/api/v1${utils.getStruktural}$nip';
  final String url = protokol + domain + path;
  final response = await dio.get(url);
  listDataAtasan.clear();
  response.data['data'].forEach(
    (val) {
      listDataAtasan.add(
        AtasanModel.fromJson(
          {
            'nip': val['nip_baru'],
            'nama': val['nama'],
            'jabatan': val['jabatan_nama'],
          },
        ),
      );
    },
  );

  return listDataAtasan;
}

Future<List<CoreValueModel>> getCoreValue() async {
  final String protokol = utils.protokolHttps;
  final String domain = utils.tppDomain;
  final String path = utils.coreValue;
  final String url = protokol + domain + path;
  final response = await dio.get(url);
  listDataCoreValue.clear();
  response.data['data'].forEach(
    (val) {
      listDataCoreValue.add(
        CoreValueModel.fromJson(
          {
            'id': val['id'].toString(),
            'nama': val['nama'],
          },
        ),
      );
    },
  );

  return listDataCoreValue;
}

Future<List<KegiatanModel>> getKegiatan(String id) async {
  final data = await storage.read(key: 'user');
  final String unorIndukId = jsonDecode(data!)['unorIndukId'];
  final String protokol = utils.protokolHttps;
  final String domain = utils.tppDomain;
  final String path = utils.getKegiatan;
  final String url = '$protokol$domain$path$id/$unorIndukId';
  final response = await dio.get(url);
  listDataKegiatan.clear();
  response.data['data'].forEach(
    (val) {
      listDataKegiatan.add(
        KegiatanModel.fromJson(
          {
            'id': val['id'].toString(),
            'nama': val['nama_kegiatan'],
            'poin': val['bobot'].toString(),
          },
        ),
      );
    },
  );

  return listDataKegiatan;
}

Future<FotoModel> pickImage(bool bypassPermission, BuildContext context) async {
  late XFile? file;
  if (bypassPermission) {
    file = await picker.pickImage(
      source: ImageSource.gallery,
      requestFullMetadata: false,
      maxWidth: 720,
      imageQuality: 50,
    );
  } else {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Kamera()));

    if (result != null) {
      file = result;
    }
  }

  final result = {'path': file?.path, 'filename': file?.name};

  return FotoModel.fromJson(result);
}

Future<bool> validate(
  TextEditingController atasanController,
  TextEditingController tanggalController,
  TextEditingController coreValueController,
  TextEditingController kegiatanController,
  TextEditingController fotoController,
  TextEditingController keteranganController,
) async {
  late bool atasanValid = false;
  late bool tanggalValid = false;
  late bool coreValueValid = false;
  late bool kegiatanValid = false;
  late bool fotoValid = false;
  late bool keteranganValid = false;

  if (atasanController.text != '') {
    atasanValid = true;
  }

  if (tanggalController.text != '') {
    tanggalValid = true;
  }

  if (coreValueController.text != '') {
    coreValueValid = true;
  }

  if (kegiatanController.text != '') {
    kegiatanValid = true;
  }

  if (fotoController.text != '') {
    fotoValid = true;
  }

  if (keteranganController.text != '') {
    keteranganValid = true;
  }

  if (atasanValid &&
      tanggalValid &&
      coreValueValid &&
      kegiatanValid &&
      fotoValid &&
      keteranganValid) {
    return true;
  }

  return false;
}

Future<bool> postAktivitas(AktivitasModel aktivitas) async {
  final protokol = utils.protokolHttps;
  final authority = utils.tppDomain;
  final unencodedPath = utils.storeAktivitasPegawai;
  final secretKey = utils.secretKey;
  final url = protokol + authority + unencodedPath;

  FormData formData = FormData.fromMap(
    {
      "nip": aktivitas.nip,
      "nip_atasan": aktivitas.atasan,
      "tanggal": aktivitas.tanggal,
      "core_value_id": aktivitas.coreValue,
      "kegiatan_id": aktivitas.kegiatan,
      "foto": await MultipartFile.fromFile(
        aktivitas.foto,
        filename: aktivitas.filename,
      ),
      "keterangan": aktivitas.keterangan,
    },
  );

  final response = await dio.post(
    url,
    data: formData,
    options: Options(headers: {'Secret-Key': secretKey}),
  );

  if (response.statusCode == HttpStatus.created) {
    return true;
  }

  return false;
}

Future<Map<String, dynamic>> getAktivitas(String nip, String tanggal) async {
  final protokol = utils.protokolHttps;
  final authority = utils.tppDomain;
  final unencodedPath = utils.getAktivitasPegawai;
  final url = protokol + authority + unencodedPath;
  final secretKey = utils.secretKey;

  final Options options = Options(headers: {'Secret-Key': secretKey});

  final response = await dio.post(
    url,
    data: {'nip': nip, 'tanggal': tanggal},
    options: options,
  );

  listAktivitas.clear();

  response.data['data']['aktivitas'].forEach((val) {
    listAktivitas.add(ListAktivitasModel.fromJson(val));
  });

  return {
    'poin': PoinModel.fromJson({
      'diajukan': response.data['data']['poinDiajukan'],
      'diterima': response.data['data']['poinDiterima'],
      'ditolak': response.data['data']['poinDitolak'],
    }),
    'aktivitas': listAktivitas,
  };
}

int daysInMonth(DateTime date) {
  var firstDayThisMonth = DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}
