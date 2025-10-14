import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/pages/sibangkom/form_sibangkom.dart';
import 'package:super_app/services/berkas_service.dart';

class BerkasSimbakom extends StatefulWidget {
  const BerkasSimbakom({
    super.key,
    required this.idLayanan,
    required this.namaLayanan,
  });

  final String idLayanan;
  final String namaLayanan;

  @override
  State<BerkasSimbakom> createState() => StateBerkasSimbakom();
}

class StateBerkasSimbakom extends State<BerkasSimbakom> {
  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final String idLayanan = widget.idLayanan;
    final String namaLayanan = widget.namaLayanan;
    late List<Widget> namaBerkas = [];

    final service = BerkasService().getBerkasLayanan(idLayanan);

    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: service,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/json_image/animation_load_files.json',
                        width: 0.5 * MediaQuery.of(context).size.width,
                        repeat: false,
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Memeriksa Persyaratan Berkas'),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mohon tunggu...'),
                    ],
                  )
                ],
              );
            }

            if (snapshot.data!.isEmpty) {
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: CupertinoColors.white,
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
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          "Persyaratan berkas untuk pengajuan $namaLayanan belum tersedia. "
                          "Tarik kebawah untuk memeriksa kembali atau Hubungi admin BKPSDM.",
                          textAlign: TextAlign.justify,
                        ),
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
                  color: CupertinoColors.white,
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
                            "Hubungi admin BKPSDM.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }

            var index = 1;

            namaBerkas.clear();

            snapshot.data?.forEach((data) {
              var berkas = Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: Text(
                  '$index. ${data['keterangan']}',
                  textAlign: TextAlign.justify,
                ),
              );
              namaBerkas.add(berkas);
              index++;
            });

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.75 * MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 16.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pengajuan $namaLayanan',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '(Geser keatas untuk melihat berkas)',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: Text(
                              'Berikut persyaratan berkas untuk pengajuan pengembangan kompetensi ASN melalui $namaLayanan:',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: namaBerkas,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 16.0,
                            ),
                            child: const Text(
                              'Silakan tap Lanjutkan apabila sudah memiliki berkas yang diminta dan telah disimpan pada perangkat ini.',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 32.0,
                        decoration: const BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(32.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            final bool? status =
                                await Navigator.of(context, rootNavigator: true)
                                    .push(
                              CupertinoPageRoute(
                                builder: (context) {
                                  return FormSibangkom(
                                    files: snapshot.data,
                                    namaLayanan: namaLayanan,
                                    idJenisLayanan: idLayanan,
                                  );
                                },
                              ),
                            );

                            if (status != null && status == true) {
                              if (context.mounted) Navigator.of(context).pop(true);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CupertinoColors.white,
                            minimumSize: const Size(
                              double.infinity,
                              50,
                            ),
                          ),
                          child: const Text(
                            'Lanjutkan',
                            style: TextStyle(
                              color: CupertinoColors.label,
                            ),
                          ),
                        ),
                      ),
                    ],
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
