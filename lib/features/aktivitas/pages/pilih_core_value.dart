import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/core_value_bloc/core_value_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/core_value_bloc/core_value_state.dart';
import 'package:super_app/features/aktivitas/application/blocs/kegiatan_bloc/kegiatan_bloc.dart';
import 'package:super_app/features/aktivitas/application/lokal_variables.dart';

class PilihCoreValue extends StatefulWidget {
  const PilihCoreValue({super.key});

  @override
  State<PilihCoreValue> createState() => _PilihCoreValueState();
}

class _PilihCoreValueState extends State<PilihCoreValue> {
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
        title: const Text('Pilih Core Value'),
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              header: const Text('Tips'),
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Text(pilihCoreValueTips),
                ),
              ],
            ),
            BlocBuilder<CoreValueBloc, CoreValueState>(
              builder: (context, state) {
                if (state is Loaded) {
                  return CupertinoListSection.insetGrouped(
                    children: state.coreValue.map(
                      (val) {
                        return CupertinoListTile(
                          leading: const Text(''),
                          title: Text(val.nama),
                          onTap: () {
                            context.read<CoreValueBloc>().add(
                                  CoreValueEvent.select(val, state.coreValue),
                                );
                            context.read<KegiatanBloc>().add(
                                  KegiatanEvent.fetch(val.id, val.nama),
                                );
                          },
                        );
                      },
                    ).toList(),
                  );
                }

                if (state is Selected) {
                  return CupertinoListSection.insetGrouped(
                    children: state.listCoreValue.map(
                      (val) {
                        Widget leading = const Text('');
                        if (val.id == state.coreValue.id) {
                          leading = const Icon(
                            CupertinoIcons.checkmark,
                            color: CupertinoColors.activeBlue,
                          );
                        }
                        return CupertinoListTile(
                          leading: leading,
                          title: Text(val.nama),
                          onTap: () {
                            context.read<CoreValueBloc>().add(
                                  CoreValueEvent.select(
                                      val, state.listCoreValue),
                                );
                            context.read<KegiatanBloc>().add(
                                  KegiatanEvent.fetch(val.id, val.nama),
                                );
                          },
                        );
                      },
                    ).toList(),
                  );
                }

                return const Text('');
              },
            ),
          ],
        ),
      ),
    );
  }
}
