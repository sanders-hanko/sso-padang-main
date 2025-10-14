import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/services/tpp_service.dart';

final List<String> _listNamaBulan = <String>[];

final List<int> _listBulan = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
final List<int> _listTahun = <int>[2024,2025];

int _indexSelectedBulan = 0;

class IndexTpp extends StatefulWidget {
  const IndexTpp({super.key});

  @override
  State<IndexTpp> createState() => StateIndexTpp();
}

class StateIndexTpp extends State<IndexTpp> {
  final TppService _service = TppService();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final Utils _utility = Utils();
  late String nama = '';
  late int bulan = 0;
  late int indexSelectedTahun = 0;
  late String namaBulan = '';
  late String tahun = '';
  late String totalPenerimaan = '0';
  late String jumlahTpp = '0';
  late String jumlahEkinerja = '0';
  late String jumlahPresensi = '0';
  late String jumlahAktivitas = '0';
  late String tanggalTl30 = '-';
  late String tanggalTl60 = '-';
  late String tanggalTl90 = '-';
  late String tanggalCp30 = '-';
  late String tanggalCp60 = '-';
  late String tanggalCp90 = '-';
  late String tanggalTk = '-';
  late String potonganTl30 = '0';
  late String potonganTl60 = '0';
  late String potonganTl90 = '0';
  late String potonganCp30 = '0';
  late String potonganCp60 = '0';
  late String potonganCp90 = '0';
  late String potonganTk = '0';
  late String nilaiSkp = '-';
  late String nilaiAktivitas = '-';
  late String potonganEkinerja = '0';
  late String potonganAktivitas = '0';
  late String potonganPresensi = '0';
  late String potonganTK = '0';
  late String totalPph21 = '0';
  late String totalPphBK = '0';
  late String totalPphKK = '0';
  late String totalPphPK = '0';
  late String totalPphKP = '0';
  late String iwp1persen = '0';
  late String totalPotongan = '0';
  late String persentaseKinerja = '-';
  late String persentasePresensi = '-';
  late String persentaseAktivitas = '-';

  Future<void> refresh() async {
    setState(() {});
  }

  void setData() async {
    final user = await _storage.read(key: 'user');
    final date = DateTime.now();
    late int index = 0;
    bulan = date.month;
    namaBulan = _utility.namaBulan(date.month);
    tahun = date.year.toString();
    nama = jsonDecode(user!)['nama'];
    for (var val in _listBulan) {
      _listNamaBulan.add(_utility.namaBulan(val));
    }

    for(var val in _listTahun){
      if(val == date.year){
        indexSelectedTahun = index;
      }
      index++;
    }

    _indexSelectedBulan = bulan - 1;

    setState(() {});
  }

  void pilihBulan() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 216.0,
        // padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 32.0,
                  scrollController: FixedExtentScrollController(
                    initialItem: _indexSelectedBulan,
                  ),
                  onSelectedItemChanged: (value) {
                    gantiBulan(value);
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                  children: List<Widget>.generate(
                    _listNamaBulan.length,
                        (int index) {
                      return Text(
                        _listNamaBulan[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 32.0,
                  scrollController: FixedExtentScrollController(
                    initialItem: indexSelectedTahun,
                  ),
                  onSelectedItemChanged: (value) {
                    gantiTahun(value);
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                  children: List<Widget>.generate(
                    _listTahun.length,
                        (int index) {
                      return Text(
                        _listTahun[index].toString(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> gantiBulan(int index) async {
    await Future.delayed(const Duration(seconds: 3));
    namaBulan = _listNamaBulan[index];
    _indexSelectedBulan = index;
    refresh();
  }

  Future<void> gantiTahun(int index) async {
    await Future.delayed(const Duration(seconds: 3));
    tahun = _listTahun[index].toString();
    indexSelectedTahun = index;
    refresh();
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: CupertinoNavigationBar(
        previousPageTitle: 'Kembali',
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.chevron_back,
            color: CupertinoColors.white,
          ),
        ),
        middle: const Text(
          'e-TPP',
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(53, 65, 183, 1),
        border: const Border.fromBorderSide(BorderSide.none),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: _service.getTpp(_listBulan[_indexSelectedBulan], _listTahun[indexSelectedTahun]),
          builder: (context, snapshot) {
            late Widget loadingIndicator;
            if (snapshot.connectionState != ConnectionState.done) {
              totalPenerimaan = '0';
              jumlahTpp = '0';
              jumlahEkinerja = '0';
              jumlahPresensi = '0';
              jumlahAktivitas = '0';
              nilaiSkp = '-';
              nilaiAktivitas = '-';
              potonganEkinerja = '0';
              potonganAktivitas = '0';
              potonganPresensi = '0';
              potonganTK = '0';
              tanggalTl30 = '-';
              tanggalTl60 = '-';
              tanggalTl90 = '-';
              tanggalCp30 = '-';
              tanggalCp60 = '-';
              tanggalCp90 = '-';
              potonganTl30 = '0';
              potonganTl60 = '0';
              potonganTl90 = '0';
              potonganCp30 = '0';
              potonganCp60 = '0';
              potonganCp90 = '0';
              totalPph21 = '0';
              totalPphBK = '0';
              totalPphKK = '0';
              totalPphPK = '0';
              totalPphKP = '0';
              iwp1persen = '0';
              totalPotongan = '0';
              persentaseKinerja = '-';
              persentasePresensi = '-';
              persentaseAktivitas = '-';

              loadingIndicator = Container(
                color: Colors.black26,
                child: const Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: CupertinoColors.white,
                          radius: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              loadingIndicator = const Text('');
              if (snapshot.hasData && snapshot.data!['data'] != null) {
                MoneyFormatter fmfJTpp = MoneyFormatter(
                  amount: double.parse(
                      (snapshot.data!['data']['tpp_basic']).toString()),
                );

                MoneyFormatter fmfTEkinerja = MoneyFormatter(
                  amount: double.parse(snapshot.data!['data']['tpp_kinerja']),
                );

                MoneyFormatter fmfTPresensi = MoneyFormatter(
                  amount: double.parse(snapshot.data!['data']['tpp_presensi']),
                );

                MoneyFormatter fmfTAktivitas = MoneyFormatter(
                  amount: double.parse(snapshot.data!['data']['tpp_aktivitas']),
                );

                MoneyFormatter fmfTotal = MoneyFormatter(
                  amount:
                      double.parse(snapshot.data!['data']['jumlah_ditransfer']),
                );

                MoneyFormatter fmfPotonganEkinerja = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['potongan_e_kinerja']),
                );

                MoneyFormatter fmfPotonganAktivitas = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['potongan_aktivitas_harian']),
                );

                MoneyFormatter fmfPotonganPresensi = MoneyFormatter(
                  amount:
                      double.parse(snapshot.data!['data']['potongan_presensi']),
                );

                MoneyFormatter fmfPotonganTK = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['potongan_tanpa_keterangan']),
                );

                MoneyFormatter fmfPotonganTl30 = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['potongan_terlambat_30_menit']),
                );

                MoneyFormatter fmfPotonganTl60 = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['potongan_terlambat_31_60_menit']),
                );

                MoneyFormatter fmfPotonganTl90 = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['potongan_terlambat_61_90_menit']),
                );

                MoneyFormatter fmfPotonganCp30 = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['potongan_pulang_cepat_30_menit']),
                );

                MoneyFormatter fmfPotonganCp60 = MoneyFormatter(
                  amount: double.parse(snapshot.data!['data']
                      ['potongan_pulang_cepat_31_60_menit']),
                );

                MoneyFormatter fmfPotonganCp90 = MoneyFormatter(
                  amount: double.parse(snapshot.data!['data']
                      ['potongan_pulang_cepat_61_90_menit']),
                );

                MoneyFormatter fmfPph21 = MoneyFormatter(
                  amount: double.parse(snapshot.data!['data']['jumlah_pph_21']),
                );

                MoneyFormatter fmfPphBK = MoneyFormatter(
                  amount:
                      double.parse(snapshot.data!['data']['pph_beban_kerja']),
                );

                MoneyFormatter fmfPphKK = MoneyFormatter(
                  amount:
                      double.parse(snapshot.data!['data']['pph_kondisi_kerja']),
                );

                MoneyFormatter fmfPphPK = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['pph_prestasi_kerja']),
                );

                MoneyFormatter fmfPphKP = MoneyFormatter(
                  amount: double.parse(
                      snapshot.data!['data']['pph_kelangkaan_profesi']),
                );

                MoneyFormatter fmfIwp1persen = MoneyFormatter(
                  amount: double.parse(snapshot.data!['data']['iwp_1_persen']),
                );

                MoneyFormatter fmfTotalPotongan = MoneyFormatter(
                  amount:
                      double.parse(snapshot.data!['data']['total_potongan']),
                );

                jumlahEkinerja = fmfTEkinerja.output.withoutFractionDigits;

                jumlahPresensi = fmfTPresensi.output.withoutFractionDigits;

                jumlahAktivitas = fmfTAktivitas.output.withoutFractionDigits;

                jumlahTpp = fmfJTpp.output.withoutFractionDigits;

                totalPenerimaan = fmfTotal.output.withoutFractionDigits;

                nilaiSkp = snapshot.data!['data']['nilai_skp'];
                nilaiAktivitas =
                    snapshot.data!['data']['nilai_aktivitas_harian'];

                tanggalTl30 =
                    snapshot.data!['data']['tanggal_terlambat_30_menit'];
                tanggalTl60 =
                    snapshot.data!['data']['tanggal_terlambat_31_60_menit'];
                tanggalTl90 =
                    snapshot.data!['data']['tanggal_terlambat_61_90_menit'];
                tanggalCp30 =
                    snapshot.data!['data']['tanggal_pulang_cepat_30_menit'];
                tanggalCp60 =
                    snapshot.data!['data']['tanggal_pulang_cepat_31_60_menit'];
                tanggalCp90 =
                    snapshot.data!['data']['tanggal_pulang_cepat_61_90_menit'];
                tanggalTk = snapshot.data!['data']['tanggal_tanpa_keterangan'];

                persentaseKinerja =
                    snapshot.data!['data']['persentase_kinerja'];
                persentasePresensi =
                    snapshot.data!['data']['persentase_presensi'];
                persentaseAktivitas =
                    snapshot.data!['data']['persentase_aktivitas'];

                potonganTl30 = fmfPotonganTl30.output.withoutFractionDigits;
                potonganTl60 = fmfPotonganTl60.output.withoutFractionDigits;
                potonganTl90 = fmfPotonganTl90.output.withoutFractionDigits;
                potonganCp30 = fmfPotonganCp30.output.withoutFractionDigits;
                potonganCp60 = fmfPotonganCp60.output.withoutFractionDigits;
                potonganCp90 = fmfPotonganCp90.output.withoutFractionDigits;

                totalPph21 = fmfPph21.output.withoutFractionDigits;
                totalPphBK = fmfPphBK.output.withoutFractionDigits;
                totalPphKK = fmfPphKK.output.withoutFractionDigits;
                totalPphPK = fmfPphPK.output.withoutFractionDigits;
                totalPphKP = fmfPphKP.output.withoutFractionDigits;

                iwp1persen = fmfIwp1persen.output.withoutFractionDigits;

                potonganEkinerja =
                    fmfPotonganEkinerja.output.withoutFractionDigits;

                potonganAktivitas =
                    fmfPotonganAktivitas.output.withoutFractionDigits;

                potonganPresensi =
                    fmfPotonganPresensi.output.withoutFractionDigits;

                potonganTK = fmfPotonganTK.output.withoutFractionDigits;

                totalPotongan = fmfTotalPotongan.output.withoutFractionDigits;
              }
            }

            return Stack(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: const Color.fromRGBO(53, 65, 183, 1),
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 32.0),
                                    child: const Text(
                                      'TPP',
                                      style: TextStyle(
                                        color: CupertinoColors
                                            .extraLightBackgroundGray,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 32.0),
                                    child: InkWell(
                                      onTap: () {
                                        pilihBulan();
                                      },
                                      child: Text(
                                        '$namaBulan $tahun',
                                        style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                          color: CupertinoColors
                                              .extraLightBackgroundGray,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.all(24.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rp $totalPenerimaan',
                                      style: const TextStyle(
                                        color: CupertinoColors.white,
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.only(right: 16.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.refresh,
                                          color: CupertinoColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color:
                                      CupertinoColors.extraLightBackgroundGray,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32.0),
                                    topRight: Radius.circular(32.0),
                                  ),
                                ),
                                child: const SizedBox(
                                  height: 32.0,
                                  width: double.infinity,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: CupertinoColors.extraLightBackgroundGray,
                        ),
                        child: ListView(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Card(
                                      color: CupertinoColors.white,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.47,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Rp. $jumlahTpp',
                                                  ),
                                                ],
                                              ),
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      text: 'TPP Basic',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: ' (100%)',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
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
                                    Card(
                                      color: CupertinoColors.white,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.47,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Rp. $jumlahEkinerja',
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      text: 'e-Kinerja',
                                                      style: const TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              ' ($persentaseKinerja%)',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
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
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Card(
                                      color: CupertinoColors.white,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.47,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Rp. $jumlahPresensi',
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      text: 'Presensi',
                                                      style: const TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              ' ($persentasePresensi%)',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
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
                                    Card(
                                      color: CupertinoColors.white,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.47,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Rp. $jumlahAktivitas',
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      text: 'Aktivitas',
                                                      style: const TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              ' ($persentaseAktivitas%)',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
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
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8.0),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(
                                    color: CupertinoColors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Potongan e-Kinerja',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Nilai SKP'),
                                          Text(nilaiSkp),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Total Potongan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Rp. $potonganEkinerja'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(
                                    color: CupertinoColors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const Divider(),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Potongan Presensi',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Terlambat',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('01 - 30 Menit: $tanggalTl30'),
                                          Text('Rp. $potonganTl30'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('31 - 60 Menit: $tanggalTl60'),
                                          Text('Rp. $potonganTl60'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('61 - 90 Menit: $tanggalTl90'),
                                          Text('Rp. $potonganTl90'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pulang Cepat',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('01 - 30 Menit: $tanggalCp30'),
                                          Text('Rp. $potonganCp30'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('31 - 60 Menit: $tanggalCp60'),
                                          Text('Rp. $potonganCp60'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('61 - 90 Menit: $tanggalCp90'),
                                          Text('Rp. $potonganCp90'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tanpa keterangan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tanggal: $tanggalTk'),
                                          Text('Rp. $potonganTK'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Total Potongan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Rp. $potonganPresensi'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(
                                    color: CupertinoColors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const Divider(),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Potongan Aktivitas',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Nilai Aktivitas'),
                                          Text(nilaiAktivitas),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Total Potongan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Rp. $potonganAktivitas'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(
                                    color: CupertinoColors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const Divider(),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'PPh 21',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('PPh Beban Kerja'),
                                          Text('Rp. $totalPphBK'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('PPh Kondisi Kerja'),
                                          Text('Rp. $totalPphKK'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('PPh Prestasi Kerja'),
                                          Text('Rp. $totalPphPK'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('PPh Kelangkaan Profesi'),
                                          Text('Rp. $totalPphKP'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Total PPh 21',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Rp. $totalPph21'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Iuran Wajib Pegawai 1%',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Rp. $iwp1persen'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 32.0,
                                      ),
                                      const Divider(),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Nominal TPP',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Rp. $jumlahTpp'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Total Potongan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Rp. $totalPotongan'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Jumlah Ditransfer',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Rp. $totalPenerimaan'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      const Divider(),
                                      const SizedBox(
                                        height: 32.0,
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
                  ],
                ),
                loadingIndicator
              ],
            );
          },
        ),
      ),
    );
  }
}
