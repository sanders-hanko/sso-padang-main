import 'package:flutter/material.dart';
import 'package:super_app/tab_view_page/beranda.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 0.0,
      ),
      body: const Beranda(),
    );
  }
}
