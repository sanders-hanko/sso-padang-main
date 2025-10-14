import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/services/izin_service.dart';

class VervalDetail extends StatefulWidget {
  final String id;
  final String status;
  final String url;
  final String heroTag;
  final String nama;
  final String nip;
  final String jenisIzin;
  final String alasan;
  final String tanggal;
  final String jenis;
  final int kategori;

  //kategori 1 = absensi telat atau cp, 2 = absensi diluar kantor
  //kategori 1 atau 2 menentukan ke API persetujuan akan dikirim

  const VervalDetail({
    super.key,
    required this.id,
    required this.url,
    required this.heroTag,
    required this.nama,
    required this.nip,
    required this.jenisIzin,
    required this.alasan,
    required this.tanggal,
    required this.status,
    required this.jenis,
    required this.kategori,
  });

  @override
  State<VervalDetail> createState() => StateVervalDetail();
}

class StateVervalDetail extends State<VervalDetail> {
  final IzinService service = IzinService();
  late bool terimaButtonPressed = false;
  late bool tolakButtonPressed = false;
  late String id;
  late String status;
  late String url;
  late String heroTag;
  late String nama;
  late String nip;
  late String jenisIzin;
  late String alasan;
  late String tanggal;
  late String jenis;
  late int kategori;

  void setData() {
    id = widget.id;
    status = widget.status;
    url = widget.url;
    heroTag = widget.heroTag;
    nama = widget.nama;
    nip = widget.nip;
    jenisIzin = widget.jenisIzin;
    alasan = widget.alasan;
    tanggal = widget.tanggal;
    jenis = widget.jenis;
    kategori = widget.kategori;
  }

  Future<void> update(String status) async {
    late bool result;

    if (status == '1') {
      terimaButtonPressed = true;
      setState(() {});
    } else {
      tolakButtonPressed = true;
      setState(() {});
    }

    if (kategori == 1) {
      result = await service.updateIzinTc(id, status);
    } else {
      result = await service.updateAbsenLuarKantor(id, status, jenis);
    }
    if (result) {
      goBack();
    } else {}
  }

  void goBack() {
    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Widget tombolTerima = const Text('');
    late Widget tombolTolak = const Text('');
    late Widget terimaWidget = const Text('');
    late Widget tolakWidget = const Text('');
    late Color terimaColor = CupertinoColors.activeBlue;
    late Color tolakColor = CupertinoColors.destructiveRed;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    if (status == '0') {
      if (terimaButtonPressed) {
        terimaWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2.0),
              child: const CircularProgressIndicator(
                color: CupertinoColors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Memproses ...',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          ],
        );
        terimaColor = Colors.blue.shade300;
      } else {
        terimaWidget = const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Terima',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ],
        );
        terimaColor = CupertinoColors.activeBlue;
      }

      if (tolakButtonPressed) {
        tolakWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2.0),
              child: const CircularProgressIndicator(
                color: CupertinoColors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Memproses ...',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          ],
        );
        tolakColor = Colors.red.shade300;
      } else {
        tolakWidget = const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tolak',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ],
        );
        tolakColor = CupertinoColors.destructiveRed;
      }

      tombolTerima = Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          onPressed: () {
            update('1');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: terimaColor,
              minimumSize: const Size(double.infinity, 50.0)),
          child: terimaWidget,
        ),
      );

      tombolTolak = Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          onPressed: () {
            update('2');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: tolakColor,
              minimumSize: const Size(double.infinity, 50.0)),
          child: tolakWidget,
        ),
      );
    }
    if (status == '1' && kategori == 1) {
      tombolTolak = Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'izin Diterima',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: CupertinoColors.white,
              ),
            ),
          ],
        ),
      );
    }

    if (status == '1' && kategori == 2) {
      tombolTolak = Container(
        width: double.infinity,
        color: Colors.green,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Absen luar kantor diterima',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: CupertinoColors.white,
              ),
            ),
          ],
        ),
      );
    }

    if (status == '2' && kategori == 1) {
      tombolTolak = Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'izin Ditolak',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: CupertinoColors.white,
              ),
            ),
          ],
        ),
      );
    }

    if (status == '2' && kategori == 2) {
      tombolTolak = Container(
        width: double.infinity,
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Absen luar kantor ditolak',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: CupertinoColors.white,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        toolbarHeight: 0.0,
      ),
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black87),
                  width: width,
                  child: Hero(
                    tag: heroTag,
                    child: Image.network(
                      url,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),
                ),
              ),
              Container(
                height: height * 0.5,
                width: width,
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide()),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tanggal,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CupertinoListTile(
                          title: const Text('NIP'),
                          trailing: Text(nip),
                        ),
                        CupertinoListTile(
                          title: const Text('Nama'),
                          trailing: Text(nama),
                        ),
                        CupertinoListTile(
                          title: const Text('Keterangan'),
                          trailing: Text(jenisIzin),
                        ),
                        CupertinoListTile(
                          title: const Text('Alasan'),
                          trailing: Text(alasan),
                        ),
                        tombolTolak,
                        tombolTerima,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
