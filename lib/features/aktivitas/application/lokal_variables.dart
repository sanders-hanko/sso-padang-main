import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/features/aktivitas/application/models/list_aktivitas_model/list_aktivitas_model.dart';

String namaBulan = '';
Widget namaAtasan = const CupertinoActivityIndicator();
Widget namaCoreValue = const CupertinoActivityIndicator();
Widget leadingAtasan = const Text('');
Widget leadingTanggal = const Text('');
Widget leadingCoreValue = const Text('');
Widget leadingKegiatan = const Text('');
Widget leadingFotoKegiatan = const Text('');
Widget subtitleFotoKegiatan = const Text('Foto kegiatan belum dipilih.');
String poinDiajukan = '0 Poin';
String poinDiterima = '0 Poin';
String poinDitolak = '0 Poin';
Widget namaKegiatan = const Row(
  children: [
    Text(
      'Pilih',
      style: TextStyle(color: CupertinoColors.inactiveGray),
    ),
    Icon(
      Icons.chevron_right,
      color: CupertinoColors.inactiveGray,
    ),
  ],
);

Widget widgetBulan = const CupertinoActivityIndicator();

String pilihAtasanTips =
    'Silakan pilih atasan dengan melakukan tap pada list nama atasan berikut.';
String pilihCoreValueTips =
    'Silakan pilih Core Value dengan melakukan tap pada list core value berikut.';
String pilihKegiatanTips =
    'Silakan pilih Kegiatan dengan melakukan tap pada list kegiatan berikut.';
String pilihKegiatanTips2 =
    'Tap pada tombol Detail untuk melihat detail informasi kegiatan.';
String buatAktivitasInfo =
    'Aktivitas harian digunakan untuk komponen penilaian aktivitas sebesar 50% pada e-TPP.';
String buatAktivitasInfo2 =
    'Setiap aktivitas yang dilakukan akan mendapatkan poin berdasarkan poin per masing-masing kegiatan.';
String pilihAtasanSubtitle = 'Atasan belum dipilih.';
String pilihCoreValueSubtitle = 'Core value belum dipilih.';
String pilihKegiatanSubtitle = 'Kegiatan belum dipilih.';
List<ListAktivitasModel> listAktivitas = [];