import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/global_variables.dart';
import 'package:super_app/features/aktivitas/application/blocs/tanggal_bloc/tanggal_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/tanggal_bloc/tanggal_state.dart';

class PilihTanggal extends StatefulWidget {
  const PilihTanggal({super.key});

  @override
  State<PilihTanggal> createState() => _PilihTanggalState();
}

class _PilihTanggalState extends State<PilihTanggal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Tanggal Aktivitas'),
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'TAHUN',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: BlocBuilder<TanggalBloc, TanggalState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CupertinoColors.white,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              '2025',
                              style:
                                  TextStyle(color: CupertinoColors.activeBlue),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CupertinoListSection(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'BULAN',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: BlocBuilder<TanggalBloc, TanggalState>(
                    builder: (context, state) {
                      late String tahun = '';

                      if(state is TanggalDefault) {
                        tahun = state.tahun;
                      }

                      if (state is Selected) {
                        tahun = state.tahun;
                      }

                      return Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          ...listNamaBulan.map((val) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.285,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<TanggalBloc>().add(
                                          TanggalEvent.select(
                                              tahun,
                                              (listNamaBulan
                                                  .indexOf(val)+1)
                                                  .toString(),
                                              val,
                                              null),
                                        );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ((state is Selected) &&
                                                state.namaBulan == val) ||
                                            ((state is TanggalDefault) &&
                                                state.namaBulan == val)
                                        ? Colors.grey.shade200
                                        : CupertinoColors.white,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                      color: ((state is Selected) &&
                                          state.namaBulan == val) ||
                                          ((state is TanggalDefault) &&
                                              state.namaBulan == val)
                                          ? CupertinoColors.activeBlue
                                          : CupertinoColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
            CupertinoListSection(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'TANGGAL',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
              children: [
                BlocBuilder<TanggalBloc, TanggalState>(
                  builder: (context, state) {
                    late String tahun;
                    late String bulan;
                    late String namaBulan;

                    if (state is TanggalDefault) {
                      listDataTanggal = state.listTanggal;
                      tahun = state.tahun;
                      bulan = state.bulan;
                      namaBulan = state.namaBulan;
                    }

                    if (state is Selected) {
                      listDataTanggal = state.listTanggal;
                      tahun = state.tahun;
                      bulan = state.bulan;
                      namaBulan = state.namaBulan;
                    }

                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: Wrap(
                        children: [
                          ...listDataTanggal.map((val) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<TanggalBloc>().add(
                                        TanggalEvent.select(
                                          tahun,
                                          bulan,
                                          namaBulan,
                                          val.toString(),
                                        ),
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  backgroundColor: (state is TanggalDefault &&
                                      state.tanggal == val.toString()) || (state is Selected &&
                                      state.tanggal == val.toString())
                                      ? Colors.grey.shade200
                                      : CupertinoColors.white,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  val.toString(),
                                  style: TextStyle(
                                    color: (state is TanggalDefault &&
                                        state.tanggal == val.toString()) || (state is Selected &&
                                        state.tanggal == val.toString())
                                        ? CupertinoColors.activeBlue
                                        : CupertinoColors.black,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
