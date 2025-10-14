import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:super_app/Utils/sso_ui.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/models/profile_pegawai_model.dart';
import 'package:super_app/services/profile_pegawai_service.dart';

class ProfilPegawai extends StatefulWidget {
  const ProfilPegawai({super.key});

  @override
  State<ProfilPegawai> createState() => ProfilPegawaiState();
}

class ProfilPegawaiState extends State<ProfilPegawai> {
  final ProfilePegawaiService _service = ProfilePegawaiService();

  late Future<ProfilePegawai> _pegawai;

  final String profilUrlL =
      'https://static.vecteezy.com/system/resources/previews/001/840/612/non_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg';

  final String profilUrlP =
      'https://thumbs.dreamstime.com/b/hijab-avatar-profile-vector-female-muslim-icon-illustration-portrait-hijab-avatar-profile-vector-female-muslim-icon-illustration-175897228.jpg';

  @override
  void initState() {
    super.initState();
    _pegawai = _service.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: Border(bottom: BorderSide.none),
        previousPageTitle: 'Pegawai',
        middle: Text('Profil Pegawai'),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: _pegawai,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Memuat data pegawai...'),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              if (kDebugMode) {
                print(snapshot.error);
              }
              return RefreshIndicator(
                onRefresh: () {
                  _pegawai = _service.getUsers();
                  setState(() {});
                  return _pegawai;
                },
                child: ListView(
                  reverse: true,
                  children: [
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Terjadi Kesalahan!',
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              ProfilePegawai? pegawai = snapshot.data;

              return RefreshIndicator(
                onRefresh: () {
                  _pegawai = _service.getUsers();
                  setState(() {});
                  return _pegawai;
                },
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          // Card(
                          //   shadowColor: Colors.black54,
                          //   elevation: 8.0,
                          //   surfaceTintColor: CupertinoColors.white,
                          //   child: StaggeredGrid.count(
                          //     crossAxisCount: 5,
                          //     // mainAxisSpacing: 6.0,
                          //     // crossAxisSpacing: 8.0,
                          //     children: [
                          //       StaggeredGridTile.count(
                          //         crossAxisCellCount: 4,
                          //         mainAxisCellCount: 1,
                          //         child: Container(
                          //           padding: const EdgeInsets.all(16),
                          //           child: Row(
                          //             children: [
                          //               Column(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.center,
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 children: [
                          //                   InkWell(
                          //                     child: const Text(
                          //                         'Ubah Foto Profil'),
                          //                     onTap: () {
                          //                       if (kDebugMode) {
                          //                         print('tap ubah');
                          //                       }
                          //                     },
                          //                   ),
                          //                   Row(
                          //                     children: [
                          //                       InkWell(
                          //                         child: const Text(
                          //                           'Tap untuk mengubah foto.',
                          //                           style: TextStyle(
                          //                             fontStyle:
                          //                                 FontStyle.italic,
                          //                             color: Colors.black38,
                          //                           ),
                          //                         ),
                          //                         onTap: () {
                          //                           if (kDebugMode) {
                          //                             print('tab ubah');
                          //                           }
                          //                         },
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //       StaggeredGridTile.count(
                          //         crossAxisCellCount: 1,
                          //         mainAxisCellCount: 1,
                          //         child: Container(
                          //           padding: const EdgeInsets.all(8),
                          //           child: ClipRRect(
                          //             borderRadius: BorderRadius.circular(50.0),
                          //             child: FadeInImage.assetNetwork(
                          //               fit: BoxFit.cover,
                          //               placeholder:
                          //                   'assets/gif_image/circle_menu_3.gif',
                          //               image: pegawai?.jenisKelamin == 'M'
                          //                   ? profilUrlL
                          //                   : profilUrlP,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Container(margin: const EdgeInsets.only(top: 16.0)),
                          PdgCard(
                              header: const Header(
                                title: 'Informasi Pribadi',
                                trailing: Text(''),
                              ),
                              body: [
                                Info(
                                  title: 'NIK',
                                  value: pegawai!.nik,
                                ),
                                Info(
                                  title: 'Nama',
                                  value: pegawai.nama,
                                ),
                                Info(
                                  title: 'Alamat',
                                  value: pegawai.alamat,
                                ),
                                Info(
                                  title: 'Tempat/Tanggal Lahir',
                                  value:
                                      '${pegawai.tempatLahir}/${Utils().formatIndonesia(pegawai.tanggalLahir)}',
                                ),
                                Info(
                                  title: 'Jenis Kelamin',
                                  value: pegawai.jenisKelamin == 'M'
                                      ? 'Laki-laki'
                                      : 'Perempuan',
                                ),
                                Info(
                                  title: 'No HP',
                                  value: pegawai.hp,
                                ),
                              ]),
                          PdgCard(
                              header: const Header(
                                title: 'Informasi Kepegawaian',
                                trailing: Text(''),
                              ),
                              body: [
                                Info(
                                  title: 'NIP Baru',
                                  value: pegawai.nipBaru,
                                ),
                                Info(
                                  title: 'Jabatan',
                                  value: pegawai.jabatanNama,
                                ),
                                Info(
                                  title: 'Jenis Jabatan',
                                  value: pegawai.jenisJabatan,
                                ),
                                Info(
                                  title: 'Eselon',
                                  value: pegawai.eselon,
                                ),
                                Info(
                                  title: 'TMT Jabatan',
                                  value: Utils()
                                      .formatIndonesia(pegawai.tmtJabatan),
                                ),
                                Info(
                                  title: 'Golongan',
                                  value: pegawai.golNama,
                                ),
                                Info(
                                  title: 'TMT Golongan',
                                  value: Utils()
                                      .formatIndonesia(pegawai.tmtGolongan),
                                ),
                                Info(
                                  title: 'Unit Organisasi',
                                  value: pegawai.unorNama,
                                ),
                                Info(
                                  title: 'Unit Organisasi Induk',
                                  value: pegawai.unorIndukNama,
                                ),
                              ]),
                          Container(margin: const EdgeInsets.only(top: 16.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
