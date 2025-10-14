import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    const double navbarTextSize = 14;
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: const Border(bottom: BorderSide.none),
        previousPageTitle: 'Kembali',
        middle: Text(
          title,
          style: const TextStyle(
            fontSize: navbarTextSize,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: CupertinoColors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/json_image/animation_loop.json',
                  width: 200,
                  height: 200,
                ),
                Text('Coming Soon', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade300),),
                const SizedBox(height: 200,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
