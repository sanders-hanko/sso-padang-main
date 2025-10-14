import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaporanSibangkom extends StatefulWidget {
  const LaporanSibangkom({super.key});

  @override
  State<LaporanSibangkom> createState() => StateLaporanSibangkom();
}

class StateLaporanSibangkom extends State<LaporanSibangkom> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Beranda',
        middle: Text('Laporan'),
      ),
      body: SafeArea(
        bottom: false,
        child: Text(''),
      ),
    );
  }
}
