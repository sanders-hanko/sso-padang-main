import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/json_image/animation_welcome.json',
            height: 200.0,
            width: 200.0,
          ),
          const SizedBox(
            height: 200.0,
          ),
        ],
      ),
    );
  }
}
