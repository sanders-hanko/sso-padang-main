import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/atasan_bloc/atasan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/atasan_bloc/atasan_state.dart';
import 'package:super_app/features/aktivitas/application/lokal_variables.dart';

class PilihAtasan extends StatefulWidget {
  const PilihAtasan({super.key});

  @override
  State<PilihAtasan> createState() => _PilihAtasanState();
}

class _PilihAtasanState extends State<PilihAtasan> {
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
        title: const Text('Pilih Atasan'),
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
                  child: Text(pilihAtasanTips),
                ),
              ],
            ),
            BlocBuilder<AtasanBloc, AtasanState>(
              builder: (context, state) {

                if (state is Loaded) {
                  return CupertinoListSection.insetGrouped(
                    children: state.atasan.map(
                      (val) {
                        return CupertinoListTile(
                          leading: const Text(''),
                          title: Text(val.nama),
                          subtitle: Text(val.jabatan),
                          onTap: () {
                            context.read<AtasanBloc>().add(
                                  AtasanEvent.select(val, state.atasan),
                                );
                          },
                        );
                      },
                    ).toList(),
                  );
                }

                if (state is Selected) {
                  return CupertinoListSection.insetGrouped(
                    children: state.listAtasan.map(
                      (val) {
                        Widget leading = const Text('');
                        if (val.nip == state.atasan.nip) {
                          leading = const Icon(
                            CupertinoIcons.checkmark,
                            color: CupertinoColors.activeBlue,
                          );
                        }
                        return CupertinoListTile(
                          leading: leading,
                          title: Text(val.nama),
                          subtitle: Text(val.jabatan),
                          onTap: () {
                            context.read<AtasanBloc>().add(
                                  AtasanEvent.select(val, state.listAtasan),
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
