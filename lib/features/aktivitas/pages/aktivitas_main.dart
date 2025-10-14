import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/core/auth/blocs/permission_state.dart'
    as permission_state;
import 'package:super_app/core/global_variables.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_bloc/aktivitas_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_bloc/aktivitas_state.dart'
    as aktivitas_state;
import 'package:super_app/features/aktivitas/application/blocs/bulan_blocs/bulan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/bulan_blocs/bulan_state.dart'
    as bulan_state;
import 'package:super_app/features/aktivitas/application/models/detail_aktivitas_model/detail_aktivitas_model.dart';
import 'package:super_app/features/aktivitas/pages/aktivitas_create.dart';
import 'package:super_app/features/aktivitas/pages/aktivitas_detail.dart';
import 'package:super_app/features/aktivitas/pages/pilih_bulan.dart';
import 'package:super_app/features/aktivitas_bawahan/pages/aktivitas_bawahan_main.dart';
import '../application/lokal_variables.dart';
import '../application/services/aktivitas_service.dart';

class AktivitasMain extends StatefulWidget {
  const AktivitasMain({super.key});

  @override
  State<AktivitasMain> createState() => _AktivitasMainState();
}

class _AktivitasMainState extends State<AktivitasMain> {
  @override
  void initState() {
    setDefaultBulan(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.chevron_left,
            color: CupertinoColors.activeBlue,
            size: 36,
          ),
        ),
        title: const Text('Aktivitas Harian'),
        actions: [
          BlocBuilder<PermissionBloc, permission_state.PermissionState>(
            builder: (context, state) {
              late bool izin = false;
              if (state is permission_state.PermissionLoaded) {
                state.permission?.forEach(
                  (val) {
                    if (val.accessKode == utils.accAktivitasAccessCode) {
                      izin = true;
                    }
                  },
                );

                if (izin) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) {
                          return const AktivitasBawahanMain();
                        },
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.person_2_square_stack,
                      size: 24,
                      color: CupertinoColors.activeBlue,
                    ),
                  );
                }
              }

              if (state is permission_state.Permitted) {
                state.permission?.forEach(
                  (val) {
                    if (val.accessKode == utils.accAktivitasAccessCode) {
                      izin = true;
                    }
                  },
                );

                if (izin) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) {
                          return const AktivitasBawahanMain();
                        },
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.person_2_square_stack,
                      size: 24,
                      color: CupertinoColors.activeBlue,
                    ),
                  );
                }
              }

              return const SizedBox.shrink();
            },
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 20),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 16.0, right: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: CupertinoColors.white,
            foregroundColor: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const AktivitasCreate();
                },
              ),
            ).then((value) async {
              if (value != null) {
                final permissionState = context.mounted
                    ? context.read<PermissionBloc>().state
                    : null;
                final bulanState =
                    context.mounted ? context.read<BulanBloc>().state : null;
                final String? user = await storage.read(key: 'user');
                final String nip = jsonDecode(user!)['nip'];
                if (permissionState is permission_state.PermissionLoaded) {
                  if (bulanState is bulan_state.Selected) {
                    final bulan = bulanState.bulan.toString().length == 1
                        ? '0${bulanState.bulan}'
                        : bulanState.bulan.toString();
                    context.mounted
                        ? context.read<AktivitasBloc>().add(
                              AktivitasEvent.fetch(
                                nip,
                                '${bulanState.tahun}-$bulan',
                              ),
                            )
                        : null;
                  }
                }

                if (permissionState is permission_state.Permitted) {
                  if (bulanState is bulan_state.Selected) {
                    final bulan = bulanState.bulan.toString().length == 1
                        ? '0${bulanState.bulan}'
                        : bulanState.bulan.toString();
                    context.mounted
                        ? context.read<AktivitasBloc>().add(
                              AktivitasEvent.fetch(
                                permissionState.user.nip,
                                '${bulanState.tahun}-$bulan',
                              ),
                            )
                        : null;
                  }
                }
              }
            });
          },
          child: Icon(
            CupertinoIcons.add,
            color: Colors.blue.shade700,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
                BlocConsumer<BulanBloc, bulan_state.BulanState>(
                  builder: (context, state) {
                    if (state is bulan_state.Selected) {
                      widgetBulan = Text(state.namaBulan);
                      namaBulan = state.namaBulan;
                    }

                    return CupertinoListTile(
                      backgroundColor: CupertinoColors.white,
                      title: const Text(
                        'Bulan',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle:
                          const Text('Tap pada tombol untuk mengganti bulan'),
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return const PilihBulan();
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              namaBulan,
                              style: const TextStyle(
                                  color: CupertinoColors.activeBlue),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: CupertinoColors.activeBlue,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  listener: (BuildContext context, state) async {
                    final permissionState =
                        context.read<PermissionBloc>().state;
                    if (permissionState is permission_state.PermissionLoaded) {
                      if (state is bulan_state.Selected) {
                        final String? user = await storage.read(key: 'user');
                        final String nip = jsonDecode(user!)['nip'];
                        final bulan = state.bulan.toString().length == 1
                            ? '0${state.bulan}'
                            : state.bulan.toString();
                        context.read<AktivitasBloc>().add(
                              AktivitasEvent.fetch(
                                nip,
                                '${state.tahun}-$bulan',
                              ),
                            );
                      }
                    }

                    if (permissionState is permission_state.Permitted) {
                      if (state is bulan_state.Selected) {
                        final bulan = state.bulan.toString().length == 1
                            ? '0${state.bulan}'
                            : state.bulan.toString();
                        context.read<AktivitasBloc>().add(
                              AktivitasEvent.fetch(
                                permissionState.user.nip,
                                '${state.tahun}-$bulan',
                              ),
                            );
                      }
                    }
                  },
                ),
                BlocBuilder<AktivitasBloc, aktivitas_state.AktivitasState>(
                  builder: (context, state) {
                    if (state is aktivitas_state.Loaded) {
                      poinDiajukan = state.poin.diajukan;
                      poinDiterima = state.poin.diterima;
                      poinDitolak = state.poin.ditolak;
                    } else {
                      poinDiajukan = '0 Poin';
                      poinDiterima = '0 Poin';
                      poinDitolak = '0 Poin';
                    }

                    return Container(
                      margin: const EdgeInsets.all(18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                poinDiajukan,
                                style: const TextStyle(
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              const Text('Diajukan'),
                            ],
                          ),
                          const VerticalDivider(
                            width: 20,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                          Column(
                            children: [
                              Text(
                                poinDiterima,
                                style: const TextStyle(
                                  color: CupertinoColors.activeGreen,
                                ),
                              ),
                              const Text('Diterima'),
                            ],
                          ),
                          const VerticalDivider(
                            width: 20,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                          Column(
                            children: [
                              Text(
                                poinDitolak,
                                style: const TextStyle(
                                  color: CupertinoColors.destructiveRed,
                                ),
                              ),
                              const Text('Ditolak'),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<AktivitasBloc, aktivitas_state.AktivitasState>(
              builder: (context, state) {
                if (state is aktivitas_state.Loading) {
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

                if (state is aktivitas_state.Loaded) {
                  return CupertinoListSection.insetGrouped(
                    header: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: const Text(
                        'AKTIVITAS',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    children: state.listAktivitas
                        .map(
                          (val) => CupertinoListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => AktivitasDetail(
                                    aktivitas: DetailAktivitasModel.fromJson(
                                      val.detail,
                                    ),
                                    poin: '${val.poin} Poin',
                                  ),
                                ),
                              );
                            },
                            title: Text(val.keterangan),
                            subtitle: Text(
                              '${val.status} ${val.poin} Poin',
                              style: TextStyle(
                                color: val.status == 'diterima'
                                    ? CupertinoColors.activeGreen
                                    : (val.status == 'ditolak'
                                        ? CupertinoColors.destructiveRed
                                        : Colors.black45),
                              ),
                            ),
                            trailing: Row(
                              children: [
                                Text(val.tanggal),
                                const Icon(
                                  Icons.chevron_right,
                                  color: CupertinoColors.activeBlue,
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  );
                }

                return Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/json_image/animation_error.json',
                            width: 200,
                            height: 200,
                          ),
                        ],
                      ),
                      const Text('Tidak ada aktivitas.'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
