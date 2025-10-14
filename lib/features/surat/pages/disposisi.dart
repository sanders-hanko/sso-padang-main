import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_validation_bloc/aktivitas_validation_state.dart';
import 'package:super_app/features/surat/application/blocs/disposisi_bloc/disposisi_bloc.dart';
import 'package:super_app/features/surat/application/blocs/disposisi_bloc/disposisi_state.dart'
    as disposisi_state;
import 'package:super_app/features/surat/application/blocs/surat_bloc/surat_bloc.dart';

class Disposisi extends StatefulWidget {
  const Disposisi(
      {super.key,
      required this.jenis,
      required this.id,
      required this.fromNip});

  final String id;
  final String jenis;
  final String fromNip;

  @override
  State<Disposisi> createState() => _DisposisiState();
}

class _DisposisiState extends State<Disposisi> {
  final TextEditingController disposisiController = TextEditingController();
  final FocusNode disposisiFocusNode = FocusNode();
  late String title = '';
  late String appBarTitle = '...';
  late String subtitle = 'Init';
  late String toNip = '';
  late List<Widget> listWidget = [];

  void cekDisposisiBerikutnya() {
    context.read<DisposisiBloc>().add(DisposisiEvent.fetch(widget.id));
  }

  @override
  void initState() {
    super.initState();
    cekDisposisiBerikutnya();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
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
        middle: Text('Teruskan'),
        backgroundColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<DisposisiBloc, disposisi_state.DisposisiState>(
              builder: (context, state) {
                if (state is disposisi_state.Loading) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoActivityIndicator(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Memuat'),
                        ],
                      ),
                    ],
                  );
                }

                if (state is disposisi_state.Loaded) {
                  if (state.data['data'].isNotEmpty) {
                    appBarTitle = 'TELITI SARAN';
                    title = state.data['data']['jabatan'];
                    subtitle = state.data['data']['nama'];
                    toNip = state.data['data']['nip'];
                    if (listWidget.isEmpty) {
                      listWidget.add(
                        CupertinoListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SvgPicture.asset(
                              'assets/svg_image/inbox.svg',
                            ),
                          ),
                          title: Text(title),
                          subtitle: Text(subtitle),
                        ),
                      );
                    }
                  } else if (state.data['opd_penerima'].isNotEmpty) {
                    appBarTitle = 'Disposisi';
                    if (listWidget.isEmpty) {
                      state.data['opd_penerima'].forEach(
                        (val) {
                          listWidget.add(
                            CupertinoListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SvgPicture.asset(
                                  'assets/svg_image/inbox.svg',
                                ),
                              ),
                              title: Text('Perangkat Daerah'),
                              subtitle: Text(
                                val['penerima_nama'],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoListSection.insetGrouped(
                        header: Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: Text(
                            appBarTitle,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              controller: disposisiController,
                              focusNode: disposisiFocusNode,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              minLines: 3,
                              maxLines: null,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: Colors.cyan.shade900,
                                    width: 0.7,
                                  ),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: CupertinoColors.black,
                                    width: 0.5,
                                  ),
                                ),
                                hintText: appBarTitle,
                              ),
                              onTapOutside: (val) {
                                disposisiFocusNode.unfocus();
                              },
                            ),
                          ),
                        ],
                      ),
                      CupertinoListSection.insetGrouped(
                        header: Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: const Text(
                            'PENERIMA',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        children: listWidget,
                      ),
                      CupertinoListSection.insetGrouped(
                        header: Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: const Text(
                            'Tips',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Gunakan tombol simpan untuk meneruskan ${widget.jenis} ke penerima atau gunakan tombol batal untuk kembali ke halaman sebelumnya.',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }

                if (state is disposisi_state.Sending ||
                    state is disposisi_state.Sent ||
                    state is disposisi_state.SendError) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoListSection.insetGrouped(
                        header: Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: Text(
                            appBarTitle,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              controller: disposisiController,
                              focusNode: disposisiFocusNode,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              minLines: 3,
                              maxLines: null,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: Colors.cyan.shade900,
                                    width: 0.7,
                                  ),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: CupertinoColors.black,
                                    width: 0.5,
                                  ),
                                ),
                                hintText: appBarTitle,
                              ),
                              onTapOutside: (val) {
                                disposisiFocusNode.unfocus();
                              },
                            ),
                          ),
                        ],
                      ),
                      CupertinoListSection.insetGrouped(
                        header: Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: const Text(
                            'PENERIMA',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        children: listWidget,
                      ),
                      CupertinoListSection.insetGrouped(
                        header: Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: const Text(
                            'Tips',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Gunakan tombol simpan untuk meneruskan ${widget.jenis} ke penerima atau gunakan tombol batal untuk kembali ke halaman sebelumnya.',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              alignment: Alignment.bottomCenter,
              curve: Curves.linear,
              margin: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade900,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.2, 44),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: const Icon(
                                Icons.close,
                                color: CupertinoColors.white,
                              ),
                            ),
                            const Text(
                              'BATAL',
                              style: TextStyle(
                                color: CupertinoColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: BlocConsumer<DisposisiBloc,
                          disposisi_state.DisposisiState>(
                        listener: (context, state) async {
                          if (state is disposisi_state.SendError) {
                            final SnackBar snackBar = SnackBar(
                              content: Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                              backgroundColor: CupertinoColors.destructiveRed,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          if (state is disposisi_state.Sent) {
                            final SnackBar snackBar = SnackBar(
                              content: Text(
                                'Sukses',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                              backgroundColor: CupertinoColors.activeGreen,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            context.read<SuratBloc>().add(const SuratEvent.fetch());

                            await Future.delayed(Duration(seconds: 2));
                            context.mounted
                                ? Navigator.of(context).pop(true)
                                : null;
                          }
                        },
                        builder: (context, state) {
                          if (state is disposisi_state.Sending || state is disposisi_state.Sent) {
                            return ElevatedButton(
                              onPressed: () async {
                                // no action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade900,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2,
                                    44),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.all(2),
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: CupertinoColors.white,
                                      strokeWidth: 3,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return ElevatedButton(
                            onPressed: () {
                              context
                                  .read<DisposisiBloc>()
                                  .add(DisposisiEvent.send(
                                    widget.id,
                                    widget.fromNip,
                                    disposisiController.text,
                                    toNip,
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade900,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.2, 44),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: const Icon(
                                    Icons.save,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                                const Text(
                                  'SIMPAN',
                                  style: TextStyle(
                                    color: CupertinoColors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
