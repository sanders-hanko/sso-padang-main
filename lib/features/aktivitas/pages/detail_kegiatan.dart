import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/features/aktivitas/application/models/kegiatan_model/kegiatan_model.dart';

class DetailKegiatan extends StatelessWidget {
  const DetailKegiatan({super.key, required this.kegiatan});

  final KegiatanModel kegiatan;

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
            size: 36,
            color: CupertinoColors.activeBlue,
          ),
        ),
        title: const Text('Detail'),
        backgroundColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            CupertinoListSection(
              header: const Text('KEGIATAN'),
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Text(kegiatan.nama),
                ),
              ],
            ),
            CupertinoListSection(
              header: const Text('POIN'),
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Text('${kegiatan.poin} Poin'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
