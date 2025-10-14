import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../tab_view_page/pegawai.dart';

PreferredSizeWidget? suratAppBar(BuildContext context, String jenisKepegawaian) {
  return CupertinoNavigationBar(
    previousPageTitle: 'Beranda',
    middle: Text('Surat Masuk'),
    trailing: jenisKepegawaian == 'nonasn'
        ? GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .push(CupertinoPageRoute(builder: (context) {
                return Pegawai();
              }));
            },
            child: Icon(
              Icons.menu,
              size: 32,
              color: Colors.blue.shade900,
            ),
          )
        : SizedBox.shrink(),
    backgroundColor: CupertinoColors.white,
    border: Border.fromBorderSide(BorderSide.none),
  );
}
