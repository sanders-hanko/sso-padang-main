import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/features/aktivitas/application/models/detail_aktivitas_model/detail_aktivitas_model.dart';

class AktivitasDetail extends StatefulWidget {
  const AktivitasDetail(
      {super.key, required this.aktivitas, required this.poin});

  final DetailAktivitasModel aktivitas;
  final String poin;

  @override
  State<AktivitasDetail> createState() => _AktivitasDetailState();
}

class _AktivitasDetailState extends State<AktivitasDetail> {
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
        title: const Text('Aktivitas'),
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
                  'AKTIVITAS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              children: [
                CupertinoListTile(
                  title: const Text('Tanggal'),
                  trailing: Text(widget.aktivitas.tanggal),
                ),
                CupertinoListTile(
                  title: const Text('Core Value'),
                  trailing: Text(widget.aktivitas.coreValue),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'KEGIATAN',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              children: [
                Container(
                  margin: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.aktivitas.kegiatan,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CupertinoListTile(
                  title: const Text('Poin'),
                  trailing: Text(widget.poin),
                ),
                CupertinoListTile(
                  title: const Text('Status'),
                  trailing: Text(widget.aktivitas.statusAktivitas),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'KETERANGAN',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              children: [
                Container(
                  margin: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.aktivitas.keterangan,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'FOTO KEGIATAN',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              children: [
                Image.network(
                  widget.aktivitas.fotoUrl,
                  loadingBuilder: (context, child, progress) {

                    if(progress?.cumulativeBytesLoaded == progress?.expectedTotalBytes) {
                      return child;
                    }

                    return Container(
                      margin: const EdgeInsets.all(32),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CupertinoActivityIndicator()],
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
