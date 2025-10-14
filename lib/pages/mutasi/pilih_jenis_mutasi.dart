import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/services/berkas_service.dart';

import 'berkas_mutasi.dart';

const double _kItemExtent = 32.0;

List<String> _namaJenis = <String>[];

List<String> _idJenis = <String>[];

class PilihJenisMutasi extends StatefulWidget {
  const PilihJenisMutasi({super.key});

  @override
  State<PilihJenisMutasi> createState() => StatePilihJenisMutasi();
}

class StatePilihJenisMutasi extends State<PilihJenisMutasi> {
  final getJenisLayanan = BerkasService().getJenisLayanan(Utils().kodeLayananMutasi);

  late bool _jenisSelected = false;

  late String _pilih = 'Pilih';

  late String _selectedId;

  int _selectedJenis = 0;

  Future<void> refresh() async {
    setState(() {});
  }

  void _showDialog(Widget child, BuildContext context) {
    if (!_jenisSelected) {
      if (kDebugMode) {
        print('jenis tapped');
      }
      setState(() {
        _pilih = _namaJenis[0];
        _jenisSelected = true;
        _selectedId = _idJenis[0].toString();
      });
    }
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  Future<void> redirect(context, String id, String pilih) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) {
          return BerkasMutasi(
            idLayanan: id,
            namaLayanan: pilih,
          );
        },
      ),
    );
    if (context.mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Kembali',
        middle: Text('Pengajuan Baru'),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder<List>(
          future: getJenisLayanan,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/json_image/animation_sibangkom_load.json',
                        width: 0.5 * MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Memeriksa Layanan'),
                    ],
                  )
                ],
              );
            }

            if (snapshot.data == null) {
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: CupertinoColors.extraLightBackgroundGray,
                ),
                child: RefreshIndicator(
                  onRefresh: () {
                    return refresh();
                  },
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/json_image/animation_layanan.json',
                            width: 200,
                            height: 200,
                            repeat: false,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Layanan belum tersedia.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tarik kebawah untuk memeriksa kembali",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "atau",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hubungi admin.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }

            if (snapshot.data?[0]['timeout'] != null) {
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: CupertinoColors.extraLightBackgroundGray,
                ),
                child: RefreshIndicator(
                  onRefresh: () {
                    return refresh();
                  },
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/json_image/animation_layanan.json',
                            width: 200,
                            height: 200,
                            repeat: false,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Waktu koneksi habis.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tarik kebawah untuk memeriksa kembali",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "atau",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hubungi admin.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }

            final List namaJenis = [];

            _namaJenis.clear();

            snapshot.data?.forEach((data) {
              namaJenis.add(data['nama_jenis']);
              _namaJenis.add(data['nama_jenis']);
              _idJenis.add(data['id'].toString());
            });

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 8.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: CupertinoListTile(
                        title: const Text('Jenis Mutasi'),
                        subtitle: Text(namaJenis.join(", ")),
                        trailing: Text(_pilih),
                        onTap: () => _showDialog(
                          CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: _kItemExtent,
                            scrollController: FixedExtentScrollController(
                              initialItem: _selectedJenis,
                            ),
                            onSelectedItemChanged: (int selectedItem) {
                              setState(
                                () {
                                  _selectedJenis = selectedItem;
                                  _jenisSelected = true;
                                  _pilih = _namaJenis[selectedItem];
                                  _selectedId =
                                      _idJenis[selectedItem].toString();
                                },
                              );
                            },
                            children: List<Widget>.generate(
                              _namaJenis.length,
                              (int index) {
                                return Center(
                                  child: Text(
                                    _namaJenis[index],
                                  ),
                                );
                              },
                            ),
                          ),
                          context,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 32.0,
                    right: 32.0,
                    left: 32.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      late bool status = false;
                      !_jenisSelected
                          ? null
                          : status = await Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) {
                                        return BerkasMutasi(
                                          idLayanan: _selectedId,
                                          namaLayanan: _pilih,
                                        );
                                      },
                                    ),
                                  ) ==
                                  null
                              ? false
                              : true;

                      if (status) {
                        if (context.mounted) Navigator.of(context).pop(true);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !_jenisSelected ? Colors.grey : Colors.blue[500],
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                    ),
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
