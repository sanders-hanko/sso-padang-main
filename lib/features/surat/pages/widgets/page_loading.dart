import 'package:flutter/cupertino.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(),
          const SizedBox(
            height: 200.0,
          ),
        ],
      ),
    );
  }
}
