import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/kegiatan_bloc/kegiatan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/kegiatan_bloc/kegiatan_state.dart';
import 'package:super_app/features/aktivitas/application/lokal_variables.dart';

class PilihKegiatan extends StatefulWidget {
  const PilihKegiatan({super.key, required this.coreValue});

  final String coreValue;

  @override
  State<PilihKegiatan> createState() => _PilihKegiatanState();
}

class _PilihKegiatanState extends State<PilihKegiatan> {
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
        title: const Text('Pilih Kegiatan'),
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
                  child: Text('$pilihKegiatanTips\n\n$pilihKegiatanTips2'),
                ),
              ],
            ),
            BlocBuilder<KegiatanBloc, KegiatanState>(
              builder: (context, state) {
                if (state is Loaded) {
                  return CupertinoListSection.insetGrouped(
                    header: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Text(
                        widget.coreValue,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    children: state.kegiatan.map(
                      (val) {
                        var index = state.kegiatan.indexOf(val) + 1;
                        return GestureDetector(
                          onTap: () {
                            context.read<KegiatanBloc>().add(
                                  KegiatanEvent.select(
                                    widget.coreValue,
                                    val,
                                    state.kegiatan,
                                  ),
                                );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(
                                BorderSide(
                                  color: CupertinoColors.transparent,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 24,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(index.toString()),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${val.nama}.',
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          '+ ${val.poin} Poin',
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        // return CupertinoListTile(
                        //   leading: const Text(''),
                        //   title: Text(val.nama),
                        //   subtitle: Text('${val.poin} poin'),
                        //   trailing: GestureDetector(
                        //     onTap: () {
                        //       Navigator.of(context).push(
                        //         CupertinoPageRoute(
                        //           builder: (context) {
                        //             return DetailKegiatan(kegiatan: val);
                        //           },
                        //         ),
                        //       );
                        //     },
                        //     child: const Row(
                        //       children: [
                        //         Text(
                        //           'Detail',
                        //           style: TextStyle(
                        //             color: CupertinoColors.activeBlue,
                        //           ),
                        //         ),
                        //         Icon(
                        //           Icons.chevron_right,
                        //           color: CupertinoColors.activeBlue,
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        //   onTap: () {
                        //     context.read<KegiatanBloc>().add(
                        //           KegiatanEvent.select(
                        //             widget.coreValue,
                        //             val,
                        //             state.kegiatan,
                        //           ),
                        //         );
                        //   },
                        // );
                      },
                    ).toList(),
                  );
                }

                if (state is Selected) {
                  return CupertinoListSection.insetGrouped(
                    header: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Text(
                        widget.coreValue,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    children: state.listKegiatan.map(
                      (val) {
                        Widget leading = const Text('');
                        if (val.id == state.kegiatan.id) {
                          leading = const Icon(
                            CupertinoIcons.checkmark,
                            color: CupertinoColors.activeBlue,
                          );
                        } else {
                          leading = Text(
                              (state.listKegiatan.indexOf(val) + 1).toString());
                        }

                        return GestureDetector(
                          onTap: () {
                            context.read<KegiatanBloc>().add(
                                  KegiatanEvent.select(
                                    widget.coreValue,
                                    val,
                                    state.listKegiatan,
                                  ),
                                );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(
                                BorderSide(
                                  color: CupertinoColors.transparent,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 24,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      leading
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${val.nama}.',
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          '+ ${val.poin} Poin',
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                        // return CupertinoListTile(
                        //   leading: leading,
                        //   title: Text(val.nama),
                        //   subtitle: Text('${val.poin} poin'),
                        //   trailing: GestureDetector(
                        //     onTap: () {
                        //       Navigator.of(context).push(
                        //         CupertinoPageRoute(
                        //           builder: (context) {
                        //             return DetailKegiatan(kegiatan: val);
                        //           },
                        //         ),
                        //       );
                        //     },
                        //     child: const Row(
                        //       children: [
                        //         Text(
                        //           'Detail',
                        //           style: TextStyle(
                        //             color: CupertinoColors.activeBlue,
                        //           ),
                        //         ),
                        //         Icon(
                        //           Icons.chevron_right,
                        //           color: CupertinoColors.activeBlue,
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        //   onTap: () {
                        //     context.read<KegiatanBloc>().add(
                        //           KegiatanEvent.select(
                        //             widget.coreValue,
                        //             val,
                        //             state.listKegiatan,
                        //           ),
                        //         );
                        //   },
                        // );
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
