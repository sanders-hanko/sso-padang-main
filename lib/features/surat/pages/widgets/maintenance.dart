import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Maintenance extends StatelessWidget {
  const Maintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        previousPageTitle: 'Surat Masuk',
        backgroundColor: CupertinoColors.white,
        border: Border.fromBorderSide(BorderSide.none),
        middle: Text('Detail'),
      ),
      backgroundColor: CupertinoColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/json_image/animation_construction.json',
              width: 200,
              height: 200,
            ),
            const Text('App is under construction'),
            const SizedBox(height: 128.0,),
          ],
        ),
      ),
    );
  }
}
