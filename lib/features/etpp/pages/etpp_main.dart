import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/etpp/application/blocs/etpp_bloc/etpp_bloc.dart';
import 'package:super_app/features/etpp/application/blocs/etpp_bloc/etpp_state.dart';
import 'package:super_app/features/etpp/application/services/etpp_service.dart';
import 'package:super_app/features/etpp/application/variables.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EtppMain extends StatefulWidget {
  const EtppMain({super.key});

  @override
  State<EtppMain> createState() => _EtppMainState();
}

class _EtppMainState extends State<EtppMain> {
  Future<void> refresh() async {
    setState(() {});
  }

  void setData() async {
    final user = await storage.read(key: 'user');
    final date = DateTime.now();
    late int index = 0;
    bulan = date.month;
    namaBulan = utils.namaBulan(date.month);
    tahun = date.year.toString();
    nama = jsonDecode(user!)['nama'];
    for (var val in listBulan) {
      listNamaBulan.add(utils.namaBulan(val));
    }

    for (var val in listTahun) {
      if (val == date.year) {
        indexSelectedTahun = index;
      }
      index++;
    }

    indexSelectedBulan = bulan - 1;

    setState(
      () {
        initEtpp(
          context,
          tahun,
          bulan.toString(),
        );
      },
    );
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
                    initialItem: indexSelectedBulan,
                  ),
                  onSelectedItemChanged: (value) {
                    gantiBulan(context, value);
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                  children: List<Widget>.generate(
                    listNamaBulan.length,
                    (int index) {
                      return Text(
                        listNamaBulan[index],
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
                    gantiTahun(context, value);
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                  children: List<Widget>.generate(
                    listTahun.length,
                    (int index) {
                      return Text(
                        listTahun[index].toString(),
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

  Future<void> gantiBulan(BuildContext context, int index) async {
    await Future.delayed(const Duration(seconds: 1));
    namaBulan = listNamaBulan[index];
    tahun = listTahun[indexSelectedTahun].toString();
    bulan = listBulan[index];
    indexSelectedBulan = index;
    if (kDebugMode) {
      print('Index bulan: $index');
    }
    setState(() {
      initEtpp(
        context,
        tahun,
        (index + 1).toString(),
      );
    });
  }

  Future<void> gantiTahun(BuildContext context, int index) async {
    await Future.delayed(const Duration(seconds: 3));
    tahun = listTahun[index].toString();
    bulan = listBulan[indexSelectedBulan];
    indexSelectedTahun = index;
    setState(() {
      if (context.mounted) {
        initEtpp(
          context,
          tahun,
          bulan.toString().length == 1 ? '0$bulan' : bulan.toString(),
        );
      }
    });
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(53, 65, 183, 1),
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
        child: BlocBuilder<EtppBloc, EtppState>(builder: (context, state) {
          late Widget loadingIndicator = const SizedBox.shrink();

          if (state is Loading) {
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
            tppBasic = 'Rp. 0';
            tppAkhir = 'Rp. 0';
            persentase = '0%';
            tppAktivitas = 'Rp. 0';
            tppKinerja = 'Rp. 0';
            tppKehadiran = 'Rp. 0';
            tppRealisasi = 'Rp. 0';
            persentaseAktivitas = '0';
            persentaseKinerja = '0';
            persentaseKehadiran = '0';
            persentaseRealisasi = '0';
            capaianPersentaseAktivitas = '0';
            capaianPersentaseKinerja = '0';
            capaianPersentaseKehadiran = '0';
            capaianPersentaseRealisasi = '0';
            capaianPersentasePotongan = '0';
            capaianAktivitas = 'Rp. 0';
            capaianKinerja = 'Rp. 0';
            capaianKehadiran = 'Rp. 0';
            capaianRealisasi = 'Rp. 0';
          }

          if (state is Loaded) {
            loadingIndicator = const SizedBox.shrink();
            tppAkhir = state.etpp.tppAkhir;
            tppBasic = state.etpp.tppBasic;
            tppAktivitas = state.etpp.tppAktivitas;
            tppKinerja = state.etpp.tppKinerja;
            tppKehadiran = state.etpp.tppKehadiran;
            tppRealisasi = state.etpp.tppRealisasi;
            capaianAktivitas = state.etpp.capaianAktivitas;
            capaianKinerja = state.etpp.capaianKinerja;
            capaianKehadiran = state.etpp.capaianKehadiran;
            capaianRealisasi = state.etpp.capaianRealisasi;
            persentase = state.etpp.persentase;
            persentaseAktivitas = state.etpp.persentaseAktivitas;
            persentaseKinerja = state.etpp.persentaseKinerja;
            persentaseKehadiran = state.etpp.persentaseKehadiran;
            persentaseRealisasi = state.etpp.persentaseRealisasi;
            capaianPersentaseAktivitas = state.etpp.capaianPersentaseAktivitas;
            capaianPersentaseKinerja = state.etpp.capaianPersentaseKinerja;
            capaianPersentaseKehadiran = state.etpp.capaianPersentaseKehadiran;
            capaianPersentaseRealisasi = state.etpp.capaianPersentaseRealisasi;
            capaianPersentasePotongan = state.etpp.capaianPersentasePotongan;

            if (kDebugMode) {
              print(state.etpp.capaianPersentaseKehadiran);
              print(capaianPersentaseKehadiran);
            }

            chartData = [
              ChartData('Aktivitas', double.parse(capaianPersentaseAktivitas),
                  const Color.fromRGBO(0, 48, 146, 1.000)),
              ChartData('Kinerja', double.parse(capaianPersentaseKinerja),
                  const Color.fromRGBO(0, 135, 158, 1.000)),
              ChartData('Kehadiran', double.parse(capaianPersentaseKehadiran),
                  const Color.fromRGBO(255, 171, 91, 1.000)),
              ChartData(
                  'Realisasi OPD',
                  double.parse(capaianPersentaseRealisasi),
                  const Color.fromRGBO(255, 242, 219, 1.000)),
              ChartData('Potongan', double.parse(capaianPersentasePotongan),
                  const Color.fromRGBO(159, 179, 223, 1.000)),
            ];
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 32.0,
                                  ),
                                  child: const Text(
                                    'Periode',
                                    style: TextStyle(
                                      color: CupertinoColors
                                          .extraLightBackgroundGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
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
                                    tppAkhir,
                                    style: const TextStyle(
                                      color: CupertinoColors.white,
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 16.0),
                                    child: InkWell(
                                      onTap: () {
                                        initEtpp(
                                            context, tahun, bulan.toString());
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 16,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.465,
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
                                                  capaianAktivitas,
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
                                                            ' ($capaianPersentaseAktivitas%)',
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.465,
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
                                                  capaianKinerja,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text: 'Kinerja',
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            ' ($capaianPersentaseKinerja%)',
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.465,
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
                                                  capaianKehadiran,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text: 'Kehadiran',
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            ' ($capaianPersentaseKehadiran%)',
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.465,
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
                                                  capaianRealisasi,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text: 'Realisasi',
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            ' ($capaianPersentaseRealisasi%)',
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                              CupertinoListSection.insetGrouped(
                                header: Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: const Text(
                                    'KOMPONEN',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                children: [
                                  CupertinoListTile(
                                    title: const Text('TPP Basic'),
                                    subtitle: Text('$persentase%'),
                                    trailing: Text(tppBasic),
                                  ),
                                  CupertinoListTile(
                                    title: const Text('Aktivitas'),
                                    subtitle: Text('$persentaseAktivitas%'),
                                    trailing: Text(tppAktivitas),
                                  ),
                                  CupertinoListTile(
                                    title: const Text('Kinerja'),
                                    subtitle: Text('$persentaseKinerja%'),
                                    trailing: Text(tppKinerja),
                                  ),
                                  CupertinoListTile(
                                    title: const Text('Kehadiran'),
                                    subtitle: Text('$persentaseKehadiran%'),
                                    trailing: Text(tppKehadiran),
                                  ),
                                  CupertinoListTile(
                                    title: const Text('Realisasi OPD'),
                                    subtitle: Text('$persentaseRealisasi%'),
                                    trailing: Text(tppRealisasi),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Card(
                                      color: CupertinoColors.white,
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: SfCircularChart(
                                          title: const ChartTitle(
                                            text: 'Persentase TPP Pegawai',
                                          ),
                                          legend: const Legend(
                                            isVisible: true,
                                            overflowMode:
                                                LegendItemOverflowMode.wrap,
                                            position: LegendPosition.bottom,
                                          ),
                                          series: <CircularSeries>[
                                            PieSeries<ChartData, String>(
                                                dataSource: chartData,
                                                explode: true,
                                                dataLabelSettings:
                                                    const DataLabelSettings(
                                                  isVisible: true,
                                                  labelPosition:
                                                      ChartDataLabelPosition
                                                          .outside,
                                                ),
                                                animationDuration: 500,
                                                dataLabelMapper:
                                                    (ChartData data, _) =>
                                                        '${data.y}%',
                                                pointColorMapper:
                                                    (ChartData data, _) =>
                                                        data.color,
                                                xValueMapper:
                                                    (ChartData data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData data, _) =>
                                                        data.y),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Card(
                                      color: CupertinoColors.white,
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('e-TPP'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
        }),
      ),
    );
  }
}
