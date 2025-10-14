import 'package:flutter/cupertino.dart';

class DisposisiList extends StatelessWidget {
  const DisposisiList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
