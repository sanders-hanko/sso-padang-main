import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/services/aktivitas_service.dart';
import 'detail_aktivitas.dart';

List listNilaiAktivitas = [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

class ListAktivitasBawahan extends StatefulWidget {
  const ListAktivitasBawahan({
    super.key,
    required this.nama,
    required this.nipBawahan,
    required this.aktivitas,
    required this.nilai,
    required this.tanggal,
  });

  final String nama;
  final String nipBawahan;
  final String tanggal;
  final List<dynamic> aktivitas;
  final String nilai;

  @override
  State<StatefulWidget> createState() => StateListAktivitasBawahan();
}

class StateListAktivitasBawahan extends State<ListAktivitasBawahan> {
  final Utils utils = Utils();
  final AktivitasService service = AktivitasService();
  final int _indexSelectedNilai = 2;
  late String nilai = '-';
  late String tanggal;
  late String nipBawahan;
  late bool stateLoaded = false;
  late Widget textNilai = Text(nilai,
      style: const TextStyle(
        fontSize: 56.0,
      ));

  void setNilai() {
    if (widget.nilai != '-') {
      nilai = widget.nilai;
    }
    nipBawahan = widget.nipBawahan;
    tanggal = widget.tanggal;
    setState(() {});
  }

  void stateReady() {
    stateLoaded = true;
    setState(() {});
  }

  void simpanNilai(index) async {
    if (stateLoaded) {
      setState(() {
        textNilai = const CupertinoActivityIndicator();
        nilai = listNilaiAktivitas[index].toString();
      });

      final result = await service.simpanNilai(nipBawahan, tanggal, nilai);

      await Future.delayed(const Duration(seconds: 2));

      if (result) {
        setState(() {
          textNilai = Text(nilai,
              style: const TextStyle(
                fontSize: 56.0,
                color: CupertinoColors.activeGreen,
              ));
        });
      } else {
        setState(() {
          textNilai = InkWell(
            onTap: () {
              simpanNilai(index);
            },
            child: Text(nilai,
                style: const TextStyle(
                  fontSize: 56.0,
                  color: CupertinoColors.destructiveRed,
                )),
          );
        });
      }
    }
  }

  @override
  void initState() {
    setNilai();
    super.initState();
    stateReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        previousPageTitle: 'Kembali',
        middle: Text(widget.nama),
        backgroundColor: CupertinoColors.white,
        border: const Border.fromBorderSide(BorderSide.none),
      ),
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Petunjuk:'),
                      Text('- Nilai maksimal adalah 15.'),
                      Text(
                          '- Geser angka keatas atau kebawah untuk memilih nilai.'),
                      Text(
                          '- Proses simpan dilakukan otomatis setelah nilai dipilih.'),
                      Text(
                          '- Warna hijau menandakan proses simpan nilai berhasil.'),
                      Text(
                          '- Warna merah menandakan proses simpan nilai gagal.'),
                      Text('- Tap pada tulisan berwarna merah untuk mencoba menyimpan kembali.')
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  height: MediaQuery.of(context).size.height * 0.11,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Nilai Aktivitas',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      textNilai,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: double.infinity,
                        child: CupertinoPicker(
                          useMagnifier: true,
                          magnification: 1.66,
                          squeeze: 0.9,
                          itemExtent: 24.0,
                          scrollController: FixedExtentScrollController(
                            initialItem: _indexSelectedNilai,
                          ),
                          onSelectedItemChanged: (index) async {
                            await Future.delayed(const Duration(seconds: 2));
                            simpanNilai(index);
                          },
                          children: List<Widget>.generate(
                            listNilaiAktivitas.length,
                            (int index) {
                              return Text(
                                listNilaiAktivitas[index].toString(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: widget.aktivitas.asMap().entries.map(
                      (entry) {
                        int index = entry.key;
                        var item = entry.value;
                        final String tanggal =
                            utils.formatIndonesia(item['tanggal']);
                        return Column(
                          children: [
                            CupertinoListTile(
                              title: Text(tanggal),
                              subtitle: Text(item['aktivitas']),
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return DetailAktivitas(
                                        id: 'fotoAktivitas$index',
                                        url: '${item['foto']}',
                                        aktivitas: '${item['aktivitas']}',
                                        tanggal: tanggal,
                                      );
                                    },
                                  ),
                                );
                              },
                              trailing: Hero(
                                tag: 'fotoAktivitas$index',
                                child: Image.network(
                                  '${item['foto']}',
                                  height: 30.0,
                                ),
                              ),
                            ),
                            if (index != widget.aktivitas.length - 1)
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 20.0,
                                ),
                                child: const Divider(
                                  height: 0.0,
                                  color: CupertinoColors.systemFill,
                                ),
                              ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
