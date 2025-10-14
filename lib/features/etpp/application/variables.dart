import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../Utils/utils.dart';
import '../../../services/tpp_service.dart';

List<ChartData> chartData = [
  ChartData('Aktivitas', 50, const Color.fromRGBO(0, 48, 146, 1.000)),
  ChartData('Kinerja', 20, const Color.fromRGBO(0, 135, 158, 1.000)),
  ChartData('Kehadiran', 20, const Color.fromRGBO(255, 171, 91, 1.000)),
  ChartData('Realisasi OPD', 10, const Color.fromRGBO(255, 242, 219, 1.000)),
  ChartData('Potongan', 0, const Color.fromRGBO(159, 179, 223, 1.000)),
];

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

final TppService service = TppService();
const FlutterSecureStorage storage = FlutterSecureStorage();
final Utils utils = Utils();

final List<String> listNamaBulan = <String>[];

final List<int> listBulan = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
final List<int> listTahun = <int>[2025];

int indexSelectedBulan = 0;
int touchedIndex = -1;
String nama = '';
int bulan = 0;
int indexSelectedTahun = 0;
String namaBulan = '';
String tahun = '';
String totalPenerimaan = '0';
String jumlahTpp = '0';
String jumlahEkinerja = '0';
String jumlahPresensi = '0';
String jumlahAktivitas = '0';
String tanggalTl30 = '-';
String tanggalTl60 = '-';
String tanggalTl90 = '-';
String tanggalCp30 = '-';
String tanggalCp60 = '-';
String tanggalCp90 = '-';
String tanggalTk = '-';
String potonganTl30 = '0';
String potonganTl60 = '0';
String potonganTl90 = '0';
String potonganCp30 = '0';
String potonganCp60 = '0';
String potonganCp90 = '0';
String potonganTk = '0';
String nilaiSkp = '-';
String nilaiAktivitas = '-';
String potonganEkinerja = '0';
String potonganAktivitas = '0';
String potonganPresensi = '0';
String potonganTK = '0';
String totalPph21 = '0';
String totalPphBK = '0';
String totalPphKK = '0';
String totalPphPK = '0';
String totalPphKP = '0';
String iwp1persen = '0';
String totalPotongan = '0';
String persentasePresensi = '-';

String path = utils.protokolHttps + utils.simpegDomain + utils.getTpp;
String tppAkhir = '-';
String tppBasic = '-';
String tppAktivitas = '-';
String tppKinerja = '-';
String tppKehadiran = '-';
String tppRealisasi = '-';
String capaianAktivitas = '-';
String capaianKinerja = '-';
String capaianKehadiran = '-';
String capaianRealisasi = '-';
String persentase = '-';
String persentaseAktivitas = '-';
String persentaseKinerja = '-';
String persentaseKehadiran = '-';
String persentaseRealisasi = '-';
String capaianPersentaseAktivitas = '0';
String capaianPersentaseKinerja = '0';
String capaianPersentaseKehadiran = '0';
String capaianPersentaseRealisasi = '0';
String capaianPersentasePotongan = '0';
