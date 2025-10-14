import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/services/berkas_service.dart';
import 'package:super_app/Utils/sso_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifikatorDetail extends StatefulWidget {
  const VerifikatorDetail({
    super.key,
    required this.idProses,
    required this.status,
    required this.middle,
  });

  final String idProses;
  final String status;
  final String middle;

  @override
  State<VerifikatorDetail> createState() => StateVerifikatorDetail();
}

class StateVerifikatorDetail extends State<VerifikatorDetail> {
  final Utils utility = Utils();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final BerkasService service = BerkasService();

  late String idProses;

  late List<Widget> dataLayanan = [];

  late List<Widget> listBerkas = [];

  late bool isUpdating = false;

  late String nama = '';

  late String nip = '';

  late String id = '';

  late String idJenisLayanan = '';

  late String status = '0';

  late String middle = '';

  final TextEditingController _controller = TextEditingController();

  Future<void> setData() async {
    final user = await storage.read(key: 'user');
    nip = jsonDecode(user!)['nip'];
    status = widget.status;
    middle = widget.middle;
    setState(() {});
  }

  Future<List> getData() async {
    idProses = widget.idProses;

    final data = await service.getListDetailVerifikator(idProses);

    return data;
  }

  Future<void> _launchUrl(
      String nip, String idBerkas, String namaBerkas) async {
    final unencodedPath = '/berkas/$nip/$idBerkas/$namaBerkas';
    final url = Uri.https(utility.simpegDomain, unencodedPath);

    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> confirm(
      BuildContext context, String id, String nama, int status) async {
    late Widget pesan;
    if (status == 1) {
      pesan = RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
          ),
          children: [
            TextSpan(text: 'Permohonan $nama akan '),
            const TextSpan(
                text: 'diterima',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                )),
            const TextSpan(text: ', lanjutkan?'),
          ],
        ),
      );
    } else {
      pesan = SizedBox(
        height: 0.2 * MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Alasan Penolakan'),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: 'Permohonan $nama akan '),
                  const TextSpan(
                    text: 'ditolak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const TextSpan(text: ', lanjutkan?'),
                ],
              ),
            ),
          ],
        ),
      );
    }
    final success = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final List<Widget> actionButton = [
              CupertinoButton(
                child: const Text(
                  'Batal',
                  style: TextStyle(color: CupertinoColors.systemRed),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoButton(
                child: const Text('Lanjutkan'),
                onPressed: () async {
                  setState(
                    () {
                      isUpdating = true;
                    },
                  );

                  final success = await service.updateProses(
                    id,
                    nip,
                    status.toString(),
                    idJenisLayanan,
                    _controller.text,
                  );

                  if (success) {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        setState(
                          () {
                            isUpdating = false;
                            Navigator.of(context).pop(true);
                          },
                        );
                      },
                    );
                  } else {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        setState(
                          () {
                            isUpdating = false;
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ];

            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: pesan,
              actions: isUpdating
                  ? [
                      const Column(
                        children: [
                          Text(
                            'Memproses',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          LinearProgressIndicator(),
                        ],
                      ),
                    ]
                  : actionButton,
            );
          },
        );
      },
    );

    if (success) {
      if (context.mounted) Navigator.of(context).pop(true);
    }
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: const Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Kembali',
        middle: Text(middle),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: getData(),
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
                  )
                ],
              );
            }

            if (kDebugMode) {
              print(snapshot.connectionState);
              print(snapshot.data);
            }

            dataLayanan.clear();

            snapshot.data?.forEach(
              (val) {
                nama = val['nama'];
                id = val['id'].toString();
                idJenisLayanan = val['id_jenis_layanan'].toString();

                final String statusPermohonan = val['status'] == 0
                    ? 'Menunggu Verifikasi'
                    : (val['status'] == 1
                        ? 'Sudah diverifikasi'
                        : 'Permohonan Ditolak');

                final Color statusColor = val['status'] == 0
                    ? CupertinoColors.systemOrange
                    : (val['status'] == 1
                        ? CupertinoColors.systemGreen
                        : CupertinoColors.systemRed);

                final bool isHukdis = val['is_hukdis'];

                final Widget infoHukdis = isHukdis
                    ? Text(val['jenis_hukdis'])
                    : const Text('Tidak dalam masa hukuman disiplin.');

                final Widget tanggalHukdis = isHukdis
                    ? Text(
                        '${val['tanggal_hukuman']} hingga ${val['akhir_tanggal_hukuman']}')
                    : const Text('');

                dataLayanan.add(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            border: Border.all(
                              color: statusColor,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(statusPermohonan),
                          ],
                        ),
                      ),
                      const Header(
                        title: 'Informasi Pemohon',
                        trailing: Text(''),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              CupertinoColors.secondarySystemGroupedBackground,
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                        child: Column(
                          children: [
                            CupertinoListTile(
                              title: const Text('Jenis Permohonan'),
                              subtitle: Text(val['jenis_layanan']),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: const Divider(
                                height: 0.0,
                                color: CupertinoColors.systemFill,
                              ),
                            ),
                            CupertinoListTile(
                              title: const Text('NIP'),
                              subtitle: Text(val['nip']),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: const Divider(
                                height: 0.0,
                                color: CupertinoColors.systemFill,
                              ),
                            ),
                            CupertinoListTile(
                              title: const Text('Nama'),
                              subtitle: Text(val['nama']),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: const Divider(
                                height: 0.0,
                                color: CupertinoColors.systemFill,
                              ),
                            ),
                            CupertinoListTile(
                              title: const Text('Jabatan'),
                              subtitle: Text(val['jabatan_nama']),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: const Divider(
                                height: 0.0,
                                color: CupertinoColors.systemFill,
                              ),
                            ),
                            CupertinoListTile(
                              title: const Text('Tanggal Pengajuan'),
                              subtitle: Text(val['tanggal_pengajuan']),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: const Divider(
                                height: 0.0,
                                color: CupertinoColors.systemFill,
                              ),
                            ),
                            CupertinoListTile(
                              title: const Text('Unit Organisasi'),
                              subtitle: Text(val['perangkat_daerah']),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: const Divider(
                                height: 0.0,
                                color: CupertinoColors.systemFill,
                              ),
                            ),
                            CupertinoListTile(
                              title: const Text('Hukuman Disiplin'),
                              subtitle: infoHukdis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

                if (isHukdis) {
                  dataLayanan.add(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            bottom: 8.0,
                          ),
                          decoration: BoxDecoration(
                              color: CupertinoColors
                                  .secondarySystemGroupedBackground,
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              border: Border.all(color: Colors.orangeAccent)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CupertinoListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('ASN dalam masa hukuman disiplin'),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 20.0,
                                ),
                                child: const Divider(
                                  height: 0.0,
                                  color: CupertinoColors.systemFill,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  top: 16.0,
                                ),
                                child: const Text(
                                  'Jenis Hukuman',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  bottom: 16.0,
                                ),
                                child: infoHukdis,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                ),
                                child: const Text(
                                  'Tanggal Hukuman',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  bottom: 16.0,
                                ),
                                child: tanggalHukdis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }else{
                  dataLayanan.add(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            bottom: 8.0,
                          ),
                          decoration: BoxDecoration(
                              color: CupertinoColors
                                  .secondarySystemGroupedBackground,
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              border: Border.all(color: Colors.greenAccent)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CupertinoListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('ASN tidak dalam masa hukuman disiplin'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                dataLayanan.add(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Header(
                        title: 'Tracking',
                        trailing: Text(''),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              CupertinoColors.secondarySystemGroupedBackground,
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                        child: Column(
                          children: [
                            CupertinoListTile(
                              title: const Text('Status'),
                              subtitle: Text(val['tracking']),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: const Divider(
                                height: 0.0,
                                color: CupertinoColors.systemFill,
                              ),
                            ),
                            CupertinoListTile(
                              title: const Text('Pesan Verifikator'),
                              subtitle: Text(
                                val['disposisi'] ?? '-',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

                listBerkas.clear();

                val['berkas_layanan'].asMap().forEach(
                  (index, value) {
                    late String namaBerkas = '-';
                    late Widget trailing = const Text('');

                    val['berkas_draft'].forEach(
                      (berkas) {
                        if (berkas['id_berkas'] == value['id']) {
                          namaBerkas = berkas['nama_berkas_asli'];
                          trailing = InkWell(
                            onTap: () {
                              _launchUrl(
                                berkas['nip'].toString(),
                                berkas['id_berkas'].toString(),
                                berkas['nama_berkas'],
                              );
                            },
                            child: const Text('Lihat'),
                          );
                        }
                      },
                    );

                    listBerkas.add(
                      CupertinoListTile(
                        title: Text(value['nama_form']),
                        subtitle: Text(namaBerkas),
                        trailing: trailing,
                      ),
                    );

                    if (index != val['berkas_layanan'].length - 1) {
                      listBerkas.add(
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: const Divider(
                            height: 0.0,
                            color: CupertinoColors.systemFill,
                          ),
                        ),
                      );
                    }
                  },
                );

                final berkas = Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: const Header(
                        title: 'Berkas Pemohon',
                        trailing: Text(''),
                      ),
                    ),
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
                        children: listBerkas,
                      ),
                    ),
                  ],
                );

                dataLayanan.add(berkas);

                if (val['status'] == 0) {
                  dataLayanan.add(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              confirm(context, id, nama, 2);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CupertinoColors.systemRed,
                              minimumSize: Size(
                                  (0.4 * MediaQuery.of(context).size.width),
                                  40),
                            ),
                            child: const Text(
                              'Tolak',
                              style: TextStyle(
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              confirm(context, id, nama, 1);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CupertinoColors.activeBlue,
                              minimumSize: Size(
                                  (0.4 * MediaQuery.of(context).size.width),
                                  40),
                            ),
                            child: const Text(
                              'Terima',
                              style: TextStyle(
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            );

            return ListView(
              children: dataLayanan,
            );
          },
        ),
      ),
    );
  }
}
