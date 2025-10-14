import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_app/services/aktivitas_service.dart';
import 'package:super_app/services/cuti_service.dart';
import 'package:super_app/services/tpp_service.dart';

const double _kItemExtent = 32.0;

class CreateAktivitas extends StatefulWidget {
  const CreateAktivitas({super.key});

  @override
  State<CreateAktivitas> createState() => StateCreateAktivitas();
}

class StateCreateAktivitas extends State<CreateAktivitas> {
  final TextEditingController _controller = TextEditingController();
  final AktivitasService _service = AktivitasService();
  final CutiService _cutiService = CutiService();
  final TppService _tppService = TppService();
  final ImagePicker picker = ImagePicker();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late List<String> dataNamaStrukturalList = [];
  late List<String> dataNamaCoreValueList = [];
  late List<String> dataNamaKegiatanList = [];
  late List<String> dataNipStrukturalList = [];
  late List<String> dataIdCoreValueList = [];
  late List<String> dataIdKegiatanList = [];
  late List dataStrukturalList = [];
  late String _selectedAtasanNama = 'Atasan belum dipilih.';
  late String _selectedCoreValueNama = 'Core value belum dipilih.';
  late String _selectedKegiatanNama = 'Kegiatan belum dipilih.';
  late String _selectedAtasanNip = '';
  late String _selectedKegiatanId = '';
  late bool _atasanSelected = false;
  late bool _coreValueSelected = false;
  late bool _kegiatanSelected = false;
  late String _tanggal = '';
  late String _selectedTanggal = 'dd/mm/yyyy';
  late bool _tanggalSelected = false;
  late String _selectedFileName = 'Foto kegiatan belum dipilih.';
  late bool _fileSelected = false;
  late XFile _selectedFile;
  late Color buttonColor = Colors.blueGrey.shade200;
  late int _currentItem = 0;
  late int _currentCoreValueItem = 0;
  late int _currentKegiatanItem = 0;
  late String? message = '';
  late List<Widget> _tombolSimpan = [
    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 40.0),
        backgroundColor: Colors.grey.shade400,
        foregroundColor: CupertinoColors.white,
      ),
      child: const Text('Simpan'),
    ),
  ];

  void checkField() {
    if (_tanggalSelected &&
        _atasanSelected &&
        _fileSelected &&
        _controller.text.isNotEmpty) {
      setState(() {
        _tombolSimpan = [
          ElevatedButton(
            onPressed: () {
              submit(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 40.0),
              backgroundColor: Colors.blueAccent.shade700,
              foregroundColor: CupertinoColors.white,
            ),
            child: const Text('Simpan'),
          ),
        ];
      });
    } else {
      setState(() {
        _tombolSimpan = [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 40.0),
              backgroundColor: Colors.grey.shade400,
              foregroundColor: CupertinoColors.white,
            ),
            child: const Text('Simpan'),
          ),
        ];
      });
    }
  }

  void setDataStruktural() async {
    final data = await _cutiService.getDataStruktural();
    for (var element in data) {
      var nama = element['nama'].length > 20
          ? '${element['nama'].substring(0, 20)}..'
          : element['nama'];
      var jabatan = element['jabatan_nama'].length > 30
          ? '${element['jabatan_nama'].substring(0, 30)}..'
          : element['jabatan_nama'];
      var nip = "${element['nip_baru']}";
      dataNamaStrukturalList.add('$nama - $jabatan');
      dataNipStrukturalList.add(nip);
    }
    setState(() {});
  }

  void setDataCoreValue() async {
    final data = await _tppService.getDataCoreValue();
    for (var element in data) {
      var nama = element['nama'].length > 110
          ? '${element['nama'].substring(0, 110)}..'
          : element['nama'];
      var id = "${element['id']}";
      dataNamaCoreValueList.add(nama);
      dataIdCoreValueList.add(id);
    }
    setState(() {});
  }

  Future<void> setDataKegiatan(String id) async {
    dataNamaKegiatanList.clear();
    dataIdKegiatanList.clear();
    final data = await _tppService.getDataKegiatan(id);
    for (var element in data) {
      var nama = element['nama_kegiatan'].length > 37
          ? '${element['nama_kegiatan'].substring(0, 37)}..'
          : element['nama_kegiatan'];
      var id = "${element['id']}";
      dataNamaKegiatanList.add(nama);
      dataIdKegiatanList.add(id);
    }
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context, int status) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked.toString() != _selectedTanggal) {
      final hari = '${picked.day}'.length == 1 ? '0${picked.day}' : '${picked.day}';
      final bulan = '${picked.month}'.length == 1 ? '0${picked.month}' : '${picked.month}';
      setState(() {
        _selectedTanggal = '${picked.day}/${picked.month}/${picked.year}';
        _tanggalSelected = true;
        _tanggal = '${picked.year}-$bulan-$hari';
      });
      checkField();
    }
  }

  Future<void> pickImage() async {
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      _fileSelected = true;
      _selectedFile = response;
      _selectedFileName = response.name;
      setState(() {});
    }

    if (kDebugMode) {
      print(response?.path);
      print(_selectedFileName);
    }
    checkField();
  }

  void _showDialog(Widget child, BuildContext context) {
    if (!_atasanSelected) {
      if (kDebugMode) {
        print('atasan tapped');
      }
      setState(() {
        _selectedAtasanNip = dataNipStrukturalList[0];
        _atasanSelected = true;
        _selectedAtasanNama = dataNamaStrukturalList[0].toString();
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

  void _showCoreValueDialog(Widget child, BuildContext context) {
    if (!_coreValueSelected) {
      if (kDebugMode) {
        print('core value tapped');
      }
      setState(() {
        _coreValueSelected = true;
        _selectedCoreValueNama = dataNamaCoreValueList[0].toString();
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

  void _showKegiatanDialog(Widget child, BuildContext context) {
    if (!_kegiatanSelected) {
      if (kDebugMode) {
        print('kegiatan tapped');
      }
      setState(() {
        _selectedKegiatanId = dataIdKegiatanList[0];
        _kegiatanSelected = true;
        _selectedKegiatanNama = dataNamaKegiatanList[0].toString();
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

  Future<void> submit(BuildContext context) async {
    setState(() {
      _tombolSimpan = [
        const CupertinoActivityIndicator(),
      ];
    });

    final bool status = await _service.storeAktivitas(
      _selectedAtasanNip,
      _tanggal,
      _selectedFile,
      _controller.text,
      _selectedKegiatanId
    );

    if (status) {
      setState(() {
        _tombolSimpan = [
          const Icon(
            CupertinoIcons.check_mark_circled,
            color: Colors.green,
          ),
          const Text(
            ' Berhasil',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ];
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          Navigator.of(context).pop(true);
        });
      });
    } else {
      setState(() {
        buttonColor = Colors.red;
        _tombolSimpan = [
          const Icon(
            CupertinoIcons.xmark_circle,
            color: CupertinoColors.destructiveRed,
          ),
          const Text(
            ' Gagal',
            style: TextStyle(
              color: CupertinoColors.destructiveRed,
            ),
          ),
        ];
      });
      Future.delayed(const Duration(seconds: 2), () {
        setMessage();
        setState(() {
          _tombolSimpan = [
            Text(
              message!,
              style: const TextStyle(
                color: CupertinoColors.destructiveRed,
              ),
            ),
          ];
        });
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            buttonColor = Colors.blueAccent.shade700;
            _tombolSimpan = [
              ElevatedButton(
                onPressed: () {
                  submit(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 40.0),
                  backgroundColor: Colors.blueAccent.shade700,
                  foregroundColor: CupertinoColors.white,
                ),
                child: const Text('Simpan'),
              ),
            ];
          });
        });
      });
    }
  }

  void setMessage() async {
    final String? messageFromStorage = await storage.read(key: 'message');
    setState(() {
      message = messageFromStorage;
    });
  }

  @override
  void initState() {
    setDataStruktural();
    setDataCoreValue();
    setDataKegiatan('1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('Aktivitas Harian'),
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
      ),
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text.rich(
                      textAlign: TextAlign.justify,
                      TextSpan(
                        style: TextStyle(),
                        children: [
                          TextSpan(
                            text: 'Aktivitas Harian digunakan sebagai komponen '
                                'penilaian capaian kinerja sebesar 15% pada e-TPP.'
                                ' Aktivitas Harian pada bulan berjalan dinilai oleh '
                                'atasan pada tanggal 1 hingga tanggal 10 dibulan berikutnya.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text.rich(
                      textAlign: TextAlign.justify,
                      TextSpan(
                        style: TextStyle(),
                        children: [
                          TextSpan(
                            text: ' Tap pada tombol ',
                            style: TextStyle(
                                // fontStyle: FontStyle.italic,
                                ),
                          ),
                          TextSpan(
                            text: '"Pilih" ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'untuk memilih atasan, tanggal dan foto aktivitas/kegiatan.',
                            style: TextStyle(
                                // fontStyle: FontStyle.italic,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text.rich(
                      textAlign: TextAlign.justify,
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Tombol simpan akan aktif apabila semua form sudah diisi.',
                            style: TextStyle(
                                // fontStyle: FontStyle.italic,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: const BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  CupertinoListTile(
                    title: const Text.rich(
                      TextSpan(
                        text: 'Atasan',
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(_selectedAtasanNama),
                    trailing: InkWell(
                      onTap: () => _showDialog(
                        CupertinoPicker(
                          magnification: 1.22,
                          squeeze: 1.2,
                          useMagnifier: true,
                          itemExtent: _kItemExtent,
                          scrollController: FixedExtentScrollController(
                            initialItem: _currentItem,
                          ),
                          onSelectedItemChanged: (int selectedItem) {
                            setState(
                              () {
                                _selectedAtasanNama =
                                    dataNamaStrukturalList[selectedItem];
                                _atasanSelected = true;
                                _selectedAtasanNip =
                                    dataNipStrukturalList[selectedItem];
                                _currentItem = selectedItem;
                              },
                            );
                            checkField();
                          },
                          children: List<Widget>.generate(
                            dataNamaStrukturalList.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  dataNamaStrukturalList[index].length > 28
                                      ? '${dataNamaStrukturalList[index].substring(0, 28)}...'
                                      : dataNamaStrukturalList[index],
                                ),
                              );
                            },
                          ),
                        ),
                        context,
                      ),
                      child: const Text('Pilih'),
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
                  CupertinoListTile(
                    title: const Text.rich(
                      TextSpan(
                        text: 'Tanggal',
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(_selectedTanggal),
                    trailing: InkWell(
                      onTap: () => _selectDate(context, 0),
                      child: const Text('Pilih'),
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
                  CupertinoListTile(
                    title: const Text.rich(
                      TextSpan(
                        text: 'Core Value ASN',
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(_selectedCoreValueNama),
                    trailing: InkWell(
                      onTap: () => _showCoreValueDialog(
                        CupertinoPicker(
                          magnification: 1.22,
                          squeeze: 1.2,
                          useMagnifier: true,
                          itemExtent: _kItemExtent,
                          scrollController: FixedExtentScrollController(
                            initialItem: _currentCoreValueItem,
                          ),
                          onSelectedItemChanged: (int selectedItem) {
                            setDataKegiatan(dataIdCoreValueList[selectedItem]);
                            setState(
                                  () {
                                _selectedCoreValueNama =
                                dataNamaCoreValueList[selectedItem];
                                _coreValueSelected = true;
                                _currentCoreValueItem = selectedItem;
                              },
                            );
                            checkField();
                          },
                          children: List<Widget>.generate(
                            dataNamaCoreValueList.length,
                                (int index) {
                              return Center(
                                child: Text(
                                  dataNamaCoreValueList[index].length > 50
                                      ? '${dataNamaCoreValueList[index].substring(0, 50)}...'
                                      : dataNamaCoreValueList[index],
                                ),
                              );
                            },
                          ),
                        ),
                        context,
                      ),
                      child: const Text('Pilih'),
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
                  CupertinoListTile(
                    title: const Text.rich(
                      TextSpan(
                        text: 'Kegiatan',
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(_selectedKegiatanNama),
                    trailing: InkWell(
                      onTap: () => _showKegiatanDialog(
                        CupertinoPicker(
                          magnification: 1.22,
                          squeeze: 1.2,
                          useMagnifier: true,
                          itemExtent: _kItemExtent,
                          scrollController: FixedExtentScrollController(
                            initialItem: _currentKegiatanItem,
                          ),
                          onSelectedItemChanged: (int selectedItem) {
                            if (kDebugMode) {
                              print(selectedItem);
                            }
                            setState(
                                  () {
                                _selectedKegiatanNama =
                                dataNamaKegiatanList[selectedItem];
                                _kegiatanSelected = true;
                                _selectedKegiatanId =
                                dataIdKegiatanList[selectedItem];
                                _currentKegiatanItem = selectedItem;
                              },
                            );
                            checkField();
                          },
                          children: List<Widget>.generate(
                            dataNamaKegiatanList.length,
                                (int index) {
                              return Center(
                                child: Text(
                                  dataNamaKegiatanList[index].length > 50
                                      ? '${dataNamaKegiatanList[index].substring(0, 50)}...'
                                      : dataNamaKegiatanList[index],
                                ),
                              );
                            },
                          ),
                        ),
                        context,
                      ),
                      child: const Text('Pilih'),
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
                  CupertinoListTile(
                    title: const Text.rich(
                      TextSpan(
                        text: 'Foto Aktivitas',
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(_selectedFileName),
                    trailing: InkWell(
                      onTap: pickImage,
                      child: const Text('Pilih'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: const BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Text.rich(
                      TextSpan(
                        text: 'Aktivitas',
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _controller,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      hintText:
                          'Jelaskan apa aktivitas/kegiatan yang anda lakukan.',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      // label: Text('Aktivitas Harian'),
                    ),
                    onChanged: (text) {
                      checkField();
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _tombolSimpan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
