import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/aktivitas/application/models/detail_aktivitas_model/detail_aktivitas_model.dart';
import 'package:super_app/features/aktivitas/application/models/list_aktivitas_model/list_aktivitas_model.dart';
import 'package:super_app/features/aktivitas/pages/aktivitas_detail.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/centang_aktivitas_bloc/centang_aktivitas_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/centang_aktivitas_bloc/centang_aktivitas_state.dart';
import 'package:super_app/features/aktivitas_bawahan/application/services/aktivitas_bawahan_service.dart';

class AktivitasBawahanList extends StatefulWidget {
  const AktivitasBawahanList({
    super.key,
    required this.nip,
    required this.nama,
    required this.bulan,
    required this.capaian,
    required this.aktivitas,
    required this.indexBulan,
  });

  final String nip;
  final String nama;
  final String indexBulan;
  final String bulan;
  final String capaian;
  final List<Map<String, dynamic>> aktivitas;

  @override
  State<AktivitasBawahanList> createState() => _AktivitasBawahanListState();
}

class _AktivitasBawahanListState extends State<AktivitasBawahanList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BlocBuilder<CentangAktivitasBloc, CentangAktivitasState>(
          builder: (context, state) {
            if (state is Selecting || state is Selected) {
              return const SizedBox.shrink();
            }

            return GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.chevron_left,
                size: 36,
                color: CupertinoColors.activeBlue,
              ),
            );
          },
        ),
        title: Text(widget.nama),
        actions: [
          BlocBuilder<CentangAktivitasBloc, CentangAktivitasState>(
            builder: (context, state) {
              if (state is Selecting || state is Selected) {
                return GestureDetector(
                  onTap: () => selesaiSelecting(
                      context, int.parse(widget.indexBulan) - 1),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontSize: 16,
                    ),
                  ),
                );
              }

              return GestureDetector(
                onTap: () => startSelecting(context),
                child: const Text(
                  'Tandai',
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontSize: 16,
                  ),
                ),
              );
            },
          )
        ],
        actionsPadding: const EdgeInsets.only(right: 20),
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      floatingActionButton:
          BlocConsumer<CentangAktivitasBloc, CentangAktivitasState>(
        builder: (context, state) {
          if (state is Selected) {
            if (state.id.isNotEmpty) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: () =>
                          sending(context, widget.nip, state.id, 'ditolak'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade900,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.3, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: const Icon(
                              Icons.close,
                              color: CupertinoColors.white,
                            ),
                          ),
                          const Text(
                            'Tolak',
                            style: TextStyle(
                              color: CupertinoColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: ElevatedButton(
                      onPressed: () =>
                          sending(context, widget.nip, state.id, 'diterima'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.3, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: const Icon(
                              Icons.check,
                              color: CupertinoColors.white,
                            ),
                          ),
                          const Text(
                            'Terima',
                            style: TextStyle(
                              color: CupertinoColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }
          if (state is Sending) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CupertinoActivityIndicator()],
            );
          }

          if (state is Sent) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: const Icon(
                    Icons.check_circle,
                    color: CupertinoColors.activeGreen,
                  ),
                ),
                const Text(
                  'Berhasil',
                  style: TextStyle(color: CupertinoColors.activeGreen),
                )
              ],
            );
          }

          return const SizedBox.shrink();
        },
        listener: (BuildContext context, CentangAktivitasState state) {
          if (state is Sent) {
            Future.delayed(const Duration(seconds: 2)).then((val) {
              context.mounted
                  ? selesaiSelecting(context, int.parse(widget.indexBulan) - 1)
                  : null;
              context.mounted ? Navigator.of(context).pop() : null;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Center(
                            child: Text(
                          widget.bulan,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )),
                      ),
                      const VerticalDivider(
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black12,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Center(
                          child: Text(
                            '${widget.capaian}\nPoin',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BlocBuilder<CentangAktivitasBloc, CentangAktivitasState>(
              builder: (context, state) {
                late double leadingSize = 0;
                late double leadingToTitle = 0;

                if (state is Selecting) {
                  leadingSize = 16;
                  leadingToTitle = 16;
                } else {
                  leadingSize = 0;
                  leadingToTitle = 0;
                }

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
                  children: widget.aktivitas.map((val) {
                    final ListAktivitasModel aktivitas =
                        ListAktivitasModel.fromJson(val);

                    late Widget leadingIcon = const SizedBox.shrink();

                    if (aktivitas.status == 'diajukan') {
                      if (state is Selected) {
                        if (state.id.contains(aktivitas.id)) {
                          leadingIcon = const Icon(
                            Icons.check_box_rounded,
                            color: CupertinoColors.activeBlue,
                          );
                        } else {
                          leadingIcon = const Icon(
                            Icons.check_box_outline_blank_outlined,
                          );
                        }
                      }

                      if (state is Selecting) {
                        leadingIcon = const Icon(
                          Icons.check_box_outline_blank_outlined,
                        );
                      }
                    }

                    return CupertinoListTile(
                      leading: leadingIcon,
                      leadingSize: state is Selected ? 16 : leadingSize,
                      leadingToTitle: state is Selected ? 16 : leadingToTitle,
                      onTap: () {
                        if (aktivitas.status == 'diajukan') {
                          if (state is Selecting || state is Selected) {
                            selecting(
                              context,
                              widget.nip,
                              int.parse(aktivitas.id),
                            );
                          }
                        }
                      },
                      title: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        child: Text(aktivitas.keterangan),
                      ),
                      subtitle: Text(
                        '${aktivitas.status} ${aktivitas.poin} poin',
                        style: TextStyle(
                          color: aktivitas.status == 'diterima'
                              ? CupertinoColors.activeGreen
                              : (aktivitas.status == 'ditolak'
                                  ? CupertinoColors.destructiveRed
                                  : Colors.black45),
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => AktivitasDetail(
                                aktivitas: DetailAktivitasModel.fromJson(
                                    aktivitas.detail),
                                poin: aktivitas.poin,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              aktivitas.tanggal,
                              style: const TextStyle(
                                  color: CupertinoColors.activeBlue),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: CupertinoColors.activeBlue,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
