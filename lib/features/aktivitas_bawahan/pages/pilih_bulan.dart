import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/global_variables.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_state.dart';

class PilihBulan extends StatefulWidget {
  const PilihBulan({super.key});

  @override
  State<PilihBulan> createState() => _PilihBulanState();
}

class _PilihBulanState extends State<PilihBulan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 36,
            color: CupertinoColors.activeBlue,
          ),
        ),
        title: const Text('Pilih Bulan'),
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<BulanBloc, BulanState>(
          builder: (BuildContext context, state) {
            return ListView(
              children: [
                CupertinoListSection.insetGrouped(
                  header: const Text('Tips'),
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16),
                      child: Text(
                        pilihBulanTips,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  children: listNamaBulan.map(
                    (val) {
                      final leading =
                          state is Selected && state.bulan.namaBulan == val
                              ? const Icon(
                                  CupertinoIcons.checkmark,
                                  color: CupertinoColors.activeBlue,
                                )
                              : const Text('');

                      return CupertinoListTile(
                        onTap: () {
                          context.read<BulanBloc>().add(
                                BulanEvent.select(
                                  listNamaBulan.indexOf(val),
                                ),
                              );
                        },
                        leading: leading,
                        title: Text(val),
                      );
                    },
                  ).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
