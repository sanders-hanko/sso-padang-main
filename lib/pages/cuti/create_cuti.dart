import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:super_app/services/cuti_service.dart';

class CreateCuti extends StatefulWidget {
  const CreateCuti({super.key});

  @override
  State<CreateCuti> createState() => CreateCutiState();
}

class CreateCutiState extends State<CreateCuti> {
  final CutiService _service = CutiService();
  final TextEditingController _cutiController = TextEditingController();
  final TextEditingController _atasanController = TextEditingController();
  final TextEditingController _perihalController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController =
      TextEditingController();
  late List<DropdownMenuEntry> jenisCutiList = [];
  late List<DropdownMenuEntry> dataStrukturalMenuList = [];
  late List dataStrukturalList = [];
  late String _selectedAtasan;
  late int _selectedJenis;
  late String _tanggalMulai;
  late String _tanggalSelesai;

  late bool _buttonPressed = false;
  late bool _jenisLoaded = false;
  late bool _disabledButton = true;

  late bool _atasanSelected = false;
  late bool _jenisSelected = false;
  late bool _perihalFilled = false;
  late bool _tanggalMulaiFilled = false;
  late bool _tanggalSelesaiFilled = false;
  late bool _isSuccess = false;

  String selectedDate = "dd/mm/yyyy";

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
      controller: _atasanController,
      label: const Text('Pilih Atasan'),
      onSelected: (atasan) {
        if (kDebugMode) {
          print('atasan');
          print(atasan);
        }
        setState(() {
          _atasanSelected = true;
          _selectedAtasan = atasan;
        });
        checkField();
      },
      dropdownMenuEntries: dataStrukturalMenuList.toList(),
    );
  }

  setDropdownData(List? list, double width) {
    jenisCutiList.clear();
    list?.forEach((element) {
      jenisCutiList.add(DropdownMenuEntry(
        value: element['id_jenis_cuti'],
        label: element['jenis_cuti'],
      ));
    });

    return DropdownMenu(
      width: width,
      inputDecorationTheme: const InputDecorationTheme(
        outlineBorder: BorderSide.none,
      ),
      controller: _cutiController,
      label: const Text('Pilih Jenis Cuti'),
      onSelected: (jenis) {
        setState(() {
          _jenisSelected = true;
          _selectedJenis = jenis;
        });
        checkField();
      },
      dropdownMenuEntries: jenisCutiList.toList(),
    );
  }

  checkField() {
    if (_jenisSelected &&
        _atasanSelected &&
        _tanggalMulaiFilled &&
        _tanggalSelesaiFilled &&
        _perihalFilled) {
      setState(() {
        _disabledButton = false;
      });
    }
  }

  Future<void> _selectDate(BuildContext context, int status) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked.toString() != selectedDate) {
      setState(() {
        if (status == 0) {
          _tanggalMulaiController.text =
              '${picked.day}/${picked.month}/${picked.year}';
          setState(() {
            _tanggalMulai = '${picked.year}-${picked.month}-${picked.day}';
            _tanggalMulaiFilled = true;
          });
          checkField();
        } else {
          _tanggalSelesaiController.text =
              '${picked.day}/${picked.month}/${picked.year}';
          setState(() {
            _tanggalSelesai = '${picked.year}-${picked.month}-${picked.day}';
            _tanggalSelesaiFilled = true;
          });
          checkField();
        }
      });
    }
  }

  void _submit(context) async {
    setState(() {
      _buttonPressed = true;
    });

    final id = _selectedJenis;

    final atasan = _selectedAtasan;

    final perihal = _perihalController.text;

    final jenis = _selectedJenis;

    final tanggalMulai = _tanggalMulai;

    final tanggalSelesai = _tanggalSelesai;

    bool status = await CutiService()
        .postCuti(id, atasan, perihal, jenis, tanggalMulai, tanggalSelesai);

    if (status) {
      setState(() {
        _isSuccess = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        goBack(context, status);
      });
    } else {
      setState(() {
        _buttonPressed = false;
      });
    }
  }

  void goBack(context, status) {
    Navigator.of(context).pop(status);
  }

  void setDataStruktural() async {
    final data = await _service.getDataStruktural();
    setState(() {
      dataStrukturalList = data;
    });
  }

  @override
  void initState() {
    setDataStruktural();
    super.initState();
  }

  @override
  void dispose() {
    _tanggalMulaiController.dispose();
    _tanggalSelesaiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: FutureBuilder(
            future: _service.getJenisCuti(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done &&
                  !_jenisLoaded) {
                _jenisLoaded = true;
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                );
              } else {
                final width = 80 / 100 * (MediaQuery.of(context).size.width);

                return Container(
                  decoration: const BoxDecoration(color: Colors.blueAccent),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 16.0,
                        ),
                        Lottie.asset(
                          'assets/json_image/animation_kalender.json',
                          width: 200,
                          height: 200,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 32.0),
                              decoration: const BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.48,
                                child: ListView(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            setDropdownDataAtasan(width),
                                            Container(
                                              margin: const EdgeInsets.symmetric(
                                                vertical: 16.0,
                                              ),
                                              width: width,
                                              child: TextFormField(
                                                onTapOutside: (event) => FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus(),
                                                textInputAction: TextInputAction.next,
                                                onChanged: (value) {
                                                  if (value == '') {
                                                    setState(() {
                                                      _perihalFilled = false;
                                                    });
                                                    checkField();
                                                  } else {
                                                    setState(() {
                                                      _perihalFilled = true;
                                                    });
                                                    checkField();
                                                  }
                                                },
                                                controller: _perihalController,
                                                decoration: const InputDecoration(
                                                  // border: OutlineInputBorder(),
                                                  hintText: "Perihal Cuti",
                                                  label: Text("Perihal Cuti"),
                                                ),
                                              ),
                                            ),
                                            setDropdownData(snapshot.data, width),
                                            Container(
                                              margin: const EdgeInsets.symmetric(
                                                vertical: 16.0,
                                              ),
                                              width: width,
                                              child: InkWell(
                                                onTap: () {
                                                  _selectDate(context, 0);
                                                },
                                                child: IgnorePointer(
                                                  child: TextFormField(
                                                    controller:
                                                        _tanggalMulaiController,
                                                    decoration: const InputDecoration(
                                                      // border: OutlineInputBorder(),
                                                      hintText: "Tanggal Mulai",
                                                      label: Text("Tanggal Mulai"),
                                                    ),
                                                    keyboardType: TextInputType.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(bottom: 32.0),
                                              width: width,
                                              child: InkWell(
                                                onTap: () {
                                                  _selectDate(context, 1);
                                                },
                                                child: IgnorePointer(
                                                  child: TextFormField(
                                                    controller:
                                                        _tanggalSelesaiController,
                                                    decoration: const InputDecoration(
                                                      // border: OutlineInputBorder(),
                                                      hintText: "Tanggal Selesai",
                                                      label: Text("Tanggal Selesai"),
                                                    ),
                                                    keyboardType: TextInputType.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            _disabledButton
                                                ? IgnorePointer(
                                                    child: ElevatedButton.icon(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            _buttonPressed ||
                                                                    _disabledButton
                                                                ? Colors.blue[100]
                                                                : Colors.blue[300],
                                                        minimumSize: Size(width, 50),
                                                      ),
                                                      onPressed: () {
                                                        if (!_disabledButton) {
                                                          setState(() {
                                                            _buttonPressed =
                                                                !_buttonPressed;
                                                          });
                                                        }
                                                      },
                                                      icon: _buttonPressed
                                                          ? Container(
                                                              width: 24,
                                                              height: 24,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child:
                                                                  const CircularProgressIndicator(
                                                                color: Colors.white,
                                                                strokeWidth: 3,
                                                              ),
                                                            )
                                                          : const Icon(
                                                              color: Colors.white,
                                                              Icons.save),
                                                      label: _buttonPressed
                                                          ? const Text(
                                                              'Mengajukan',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color:
                                                                      Colors.white),
                                                            )
                                                          : const Text(
                                                              'Ajukan',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color:
                                                                      Colors.white),
                                                            ),
                                                    ),
                                                  )
                                                : ElevatedButton.icon(
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          _buttonPressed ||
                                                                  _disabledButton
                                                              ? (_isSuccess
                                                                  ? Colors
                                                                      .greenAccent[700]
                                                                  : Colors.blue[100])
                                                              : Colors.blue[300],
                                                      minimumSize: Size(width, 50),
                                                    ),
                                                    onPressed: () {
                                                      _buttonPressed
                                                          ? null
                                                          : _submit(context);
                                                    },
                                                    icon: _buttonPressed
                                                        ? (_isSuccess
                                                            ? Container(
                                                                width: 24,
                                                                height: 24,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(2.0),
                                                                child: const Icon(
                                                                  Icons.check,
                                                                  color: Colors.white,
                                                                ),
                                                              )
                                                            : Container(
                                                                width: 24,
                                                                height: 24,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(2.0),
                                                                child:
                                                                    const CircularProgressIndicator(
                                                                  color: Colors.white,
                                                                  strokeWidth: 3,
                                                                ),
                                                              ))
                                                        : const Icon(
                                                            color: Colors.white,
                                                            Icons.save),
                                                    label: _buttonPressed
                                                        ? (_isSuccess
                                                            ? const Text(
                                                                'Berhasil diajukan',
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color:
                                                                        Colors.white))
                                                            : const Text(
                                                                'Mengajukan',
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color:
                                                                        Colors.white),
                                                              ))
                                                        : const Text('Ajukan',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors.white)),
                                                  ),
                                            const SizedBox(
                                              height: 32.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
