import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTubel extends StatefulWidget {
  const CreateTubel({super.key});

  @override
  State<CreateTubel> createState() => StateCreateTubel();
}

class StateCreateTubel extends State<CreateTubel> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Kembali',
        middle: Text('Pengajuan Tubel'),
      ),
      body: SafeArea(
        bottom: false,
        child: Text(''),
      ),
    );
  }
}
