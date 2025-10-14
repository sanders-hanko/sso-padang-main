import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/main.dart';
import 'package:super_app/services/cuti_service.dart';
import 'package:super_app/services/izin_service.dart';

class CreatePresensi extends StatefulWidget {
  const CreatePresensi({
    super.key,
    required this.id,
    required this.inOut,
    required this.tanggal,
    required this.namaBulan,
    required this.tahun,
  });

  final String id;
  final int inOut;
  final String tanggal;
  final String namaBulan;
  final String tahun;

  @override
  State<StatefulWidget> createState() => StateCreatePresensi();
}

class StateCreatePresensi extends State<CreatePresensi> {
  final CutiService _cutiService = CutiService();
  final IzinService _izinService = IzinService();
  final ImagePicker picker = ImagePicker();
  late String id = '';
  late String tanggal = '';
  late String namaBulan = '';
  late String tahun = '';
  late int inOut = 0; //default 0 = In/Telat Masuk, 1 = Out/Cepat Pulang
  late String namaIzin = 'terlambat';
  late List<DropdownMenuEntry> dataStrukturalMenuList = [];
  late List<DropdownMenuEntry> dataJenisIzinTlCpList = [];
  late List dataStrukturalList = [];
  late List jenisIzinTlCpList = [];
  late bool _atasanSelected = false;
  late bool _izinSelected = false;
  late bool _alasanFilled = false;
  late bool _fileSelected = false;
  late String _selectedAtasan;
  late String _selectedJenisIzin;
  late String _filledAlasan;
  late XFile _selectedFile;
  late String _namaFile = '';
  late bool _disabledButton = true;
  late bool _buttonPressed = false;
  late bool _isSuccess = false;
  late String message = '';

  void setData() {
    id = widget.id;
    tanggal = widget.tanggal;
    namaBulan = widget.namaBulan;
    tahun = widget.tahun;
    inOut = widget.inOut;
    namaIzin = inOut == 0 ? 'terlambat' : 'cepat pulang';
    setState(() {});
    if (kDebugMode) {
      print(id);
      print(inOut);
    }
  }

  setDropdownDataAtasan(double width) {
    dataStrukturalMenuList.clear();
    for (var element in dataStrukturalList) {
      dataStrukturalMenuList.add(DropdownMenuEntry(
        value: element['nip_baru'],
        label: element['nama'] + ' - ' + element['jabatan_nama'],
      ));
    }

    return DropdownMenu(
      width: width,
      inputDecorationTheme: const InputDecorationTheme(
        outlineBorder: BorderSide.none,
      ),
      label: const Text('Pilih Atasan'),
      onSelected: (jenis) {
        if (kDebugMode) {
          print('jenis');
          print(jenis);
        }
        setState(() {
          _atasanSelected = true;
          _selectedAtasan = jenis;
        });
        checkField();
      },
      dropdownMenuEntries: dataStrukturalMenuList.toList(),
    );
  }

  setDropdownDataJenisIzin(double width) {
    dataJenisIzinTlCpList.clear();
    for (var element in jenisIzinTlCpList) {
      dataJenisIzinTlCpList.add(DropdownMenuEntry(
        value: element['id'],
        label: element['jenis_izin'],
      ));
    }

    return DropdownMenu(
      width: width,
      inputDecorationTheme: const InputDecorationTheme(
        outlineBorder: BorderSide.none,
      ),
      label: const Text('Pilih Jenis Izin'),
      onSelected: (jenis) {
        if (kDebugMode) {
          print('jenis');
          print(jenis);
        }
        setState(() {
          _izinSelected = true;
          _selectedJenisIzin = jenis.toString();
        });
        checkField();
      },
      dropdownMenuEntries: dataJenisIzinTlCpList.toList(),
    );
  }

  checkField() {
    if (_izinSelected && _atasanSelected && _fileSelected && _alasanFilled) {
      setState(() {
        _disabledButton = false;
      });
    }
  }

  void setDataStruktural() async {
    final data = await _cutiService.getDataStruktural();
    setState(() {
      dataStrukturalList = data;
    });
  }

  void setDataJenisIzinTlCp() async {
    final data = await _izinService.getJenisIzinTlCp();
    setState(() {
      jenisIzinTlCpList = data;
    });
  }

  void setAlasan(String alasan) {
    if (alasan.isNotEmpty) {
      _filledAlasan = alasan;
      _alasanFilled = true;
      setState(() {});
    } else {
      _alasanFilled = false;
      setState(() {});
    }

    checkField();
  }

  Future<void> pickImage() async {
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      _fileSelected = true;
      _selectedFile = response;
      _namaFile = response.name;
      setState(() {});
    }

    if (kDebugMode) {
      print(response?.path);
      print(_namaFile);
    }
    checkField();
  }

  void _submit(context) async {
    setState(() {
      _buttonPressed = true;
    });

    setState(() {});

    bool status = await IzinService().postIzinAbsensi(
      id,
      _selectedAtasan,
      _filledAlasan,
      _selectedJenisIzin,
      _selectedFile,
    );

    if (status) {
      setState(() {
        _isSuccess = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        goBack(context, status);
      });
    } else {
      message = (await storage.read(key: 'message'))!;
      setState(() {
        _buttonPressed = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      message = '';
      setState(() {});
    }
  }

  void goBack(context, status) {
    Navigator.of(context).pop(status);
  }

  @override
  void initState() {
    setData();
    setDataStruktural();
    setDataJenisIzinTlCp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = 80 / 100 * (MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/json_image/animation_sign.json',
                      width: 200.0,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Ajukan izin $namaIzin pada',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$tanggal $namaBulan $tahun',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    setDropdownDataAtasan(width),
                    setDropdownDataJenisIzin(width),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        onChanged: (alasan) {
                          setAlasan(alasan);
                        },
                        decoration: InputDecoration(
                          labelText: 'Alasan',
                          hintText: 'Alasan $namaIzin',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: const Size(
                                double.infinity,
                                50.0,
                              ),
                            ),
                            onPressed: () {
                              pickImage();
                            },
                            child: const Text('Pilih File'),
                          ),
                          Text(_namaFile),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    message,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: CupertinoColors.destructiveRed),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _buttonPressed || _disabledButton
                          ? (_isSuccess ? Colors.greenAccent[700] : Colors.blue[100])
                          : Colors.blue[300],
                      minimumSize: Size(width, 50),
                    ),
                    onPressed: () {
                      if (!_disabledButton) {
                        _buttonPressed ? null : _submit(context);
                      }
                    },
                    icon: _buttonPressed
                        ? (_isSuccess
                            ? Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2.0),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              )
                            : Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2.0),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              ))
                        : const Icon(color: Colors.white, Icons.save),
                    label: _buttonPressed
                        ? (_isSuccess
                            ? const Text('Berhasil disimpan',
                                style: TextStyle(fontSize: 18, color: Colors.white))
                            : const Text(
                                'Menyimpan',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ))
                        : const Text('Simpan',
                            style: TextStyle(fontSize: 18, color: Colors.white)),
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
