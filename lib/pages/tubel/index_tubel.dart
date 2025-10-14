import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_app/pages/tubel/create_tubel.dart';

class IndexTubel extends StatefulWidget {
  const IndexTubel({super.key});

  @override
  State<IndexTubel> createState() => StateIndexTubel();
}

class StateIndexTubel extends State<IndexTubel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Beranda',
        middle: Text('Tugas Belajar'),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
              ),
              decoration: BoxDecoration(
                color: CupertinoColors.secondarySystemGroupedBackground,
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
              ),
              child: Column(
                children: [
                  CupertinoListTile(
                    title: const Text('Pengajuan baru'),
                    subtitle: const Text('Ajukan tugas belajar'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoColors.opaqueSeparator,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg_image/pencil.svg',
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context){
                        return const CreateTubel();
                      }));
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 64.0,
                    ),
                    child: const Divider(
                      height: 0.0,
                      color: CupertinoColors.systemFill,
                    ),
                  ),
                  CupertinoListTile(
                    title: const Text('Pengajuan selesai'),
                    subtitle: const Text('Lihat rekomendasi tugas belajar'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoColors.opaqueSeparator,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg_image/files_document.svg',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 64.0,
                    ),
                    child: const Divider(
                      height: 0.0,
                      color: CupertinoColors.systemFill,
                    ),
                  ),
                  CupertinoListTile(
                    title: const Text('Pengajuan dikembalikan'),
                    subtitle:
                        const Text('Periksa kembali pengajuan tugas belajar'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoColors.opaqueSeparator,
                    ),
                    additionalInfo: const Badge(
                      label: Text('1'),
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg_image/refresh.svg',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 64.0,
                    ),
                    child: const Divider(
                      height: 0.0,
                      color: CupertinoColors.systemFill,
                    ),
                  ),
                  CupertinoListTile(
                    title: const Text('Lacak'),
                    subtitle:
                        const Text('Ketahui status pengajuan tugas belajar'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_forward,
                      color: CupertinoColors.opaqueSeparator,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg_image/loupe_search.svg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 0.60 * MediaQuery.of(context).size.width,
              child: const Column(
                children: [
                  Text(
                    'e-TUBEL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),
                  ),
                  Text(
                    'Proses pengajuan tugas belajar secara elektronik.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Text('')
          ],
        ),
      ),
    );
  }
}
