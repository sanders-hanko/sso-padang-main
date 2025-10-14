import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/aktivitas_bawahan/aktivitas_bawahan_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/aktivitas_bawahan/aktivitas_bawahan_state.dart'
    as aktivitas_bawahan_state;
import 'package:super_app/features/aktivitas_bawahan/pages/aktivitas_bawahan_list.dart';
import 'package:super_app/features/aktivitas_bawahan/pages/pilih_bulan.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_state.dart'
    as bulan_state;
import 'package:super_app/features/aktivitas_bawahan/application/services/aktivitas_bawahan_service.dart';

class AktivitasBawahanMain extends StatefulWidget {
  const AktivitasBawahanMain({super.key});

  @override
  State<AktivitasBawahanMain> createState() => _AktivitasBawahanMainState();
}

class _AktivitasBawahanMainState extends State<AktivitasBawahanMain> {
  @override
  void initState() {
    setDefaultBulan(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.chevron_left,
            size: 36,
            color: CupertinoColors.activeBlue,
          ),
        ),
        title: const Text('Aktivitas Bawahan'),
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'INFORMASI',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              children: [
                BlocBuilder<BulanBloc, bulan_state.BulanState>(
                  builder: (context, state) {
                    late String bulan = '-';

                    if (kDebugMode) {
                      print(state);
                    }


                    if (state is bulan_state.Selected) {
                      bulan = state.bulan.namaBulan;
                      initAktivitasBawahan(context);
                    }

                    return CupertinoListTile(
                      title: const Text('Bulan'),
                      subtitle:
                          const Text('Tap pada tombol untuk mengganti bulan'),
                      trailing: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const PilihBulan(),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              bulan,
                              style: const TextStyle(
                                color: CupertinoColors.activeBlue,
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: CupertinoColors.activeBlue,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<AktivitasBawahanBloc,
                aktivitas_bawahan_state.AktivitasBawahanState>(
              builder: (context, state) {

                if (state is aktivitas_bawahan_state.Loading) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoActivityIndicator(),
                      ],
                    ),
                  );
                }

                if (state is aktivitas_bawahan_state.Loaded) {
                  late String bulan = '';
                  late String indexBulan = '';
                  final bulanState = context.read<BulanBloc>().state;

                  if (bulanState is bulan_state.Selected) {
                    bulan = bulanState.bulan.namaBulan;
                    indexBulan = bulanState.bulan.bulan;
                  }

                  return CupertinoListSection.insetGrouped(
                    header: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: const Text(
                        'PEGAWAI',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    children: state.listNama
                        .map(
                          (val) => CupertinoListTile(
                            leading: Stack(
                              children: [
                                CircularProgressIndicator(
                                  value: double.parse(val!.capaian) / 100,
                                  color: CupertinoColors.activeBlue,
                                ),
                                Center(
                                  child: Text(
                                    val.capaian,
                                    style: const TextStyle(
                                      color: CupertinoColors.activeBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            title: Text(val.nama),
                            subtitle: Text(val.jabatan),
                            trailing: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => AktivitasBawahanList(
                                    nip: val.nip,
                                    nama: val.nama,
                                    bulan: bulan,
                                    capaian: val.capaian,
                                    aktivitas: val.aktivitasHarian,
                                    indexBulan: indexBulan,
                                  ),
                                ),
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    'Aktivitas',
                                    style: TextStyle(
                                      color: CupertinoColors.activeBlue,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: CupertinoColors.activeBlue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }

                if (state is aktivitas_bawahan_state.Empty ||
                    state is aktivitas_bawahan_state.Error) {
                  return Column(
                    children: [
                      Lottie.asset(
                        'assets/json_image/animation_error.json',
                        width: 200,
                        height: 200,
                      ),
                      const Text('Tidak ada data.')
                    ],
                  );
                }
                return const Text('');
              },
            )
          ],
        ),
      ),
    );
  }
}
