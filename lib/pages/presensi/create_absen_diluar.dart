import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../services/cuti_service.dart';

class CreateAbsenDiluar extends StatefulWidget {
  const CreateAbsenDiluar({super.key, required this.path});

  final String path;

  @override
  State<CreateAbsenDiluar> createState() => StateCreateAbsenDiluar();
}

class StateCreateAbsenDiluar extends State<CreateAbsenDiluar> {
  late String path;
  final TextEditingController _controller = TextEditingController();
  final CutiService _cutiService = CutiService();
  late bool disableButton = true;
  late Map<String, dynamic> data;
  late List<DropdownMenuEntry> dataStrukturalMenuList = [];
  late List dataStrukturalList = [];
  late String _selectedAtasan;
  late bool _atasanSelected = false;

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
        setState(() {
          _atasanSelected = true;
          _selectedAtasan = jenis;
        });
        validate();
      },
      dropdownMenuEntries: dataStrukturalMenuList.toList(),
    );
  }

  void setDataStruktural() async {
    final data = await _cutiService.getDataStruktural();
    setState(() {
      dataStrukturalList = data;
    });
  }

  void validate() {
    if(_controller.text != '' && _atasanSelected){
      disableButton = false;
      data = {
        'path': path,
        'alasan' : _controller.text,
        'atasan' : _selectedAtasan,
      };
    }else{
      disableButton = true;
    }
    if (kDebugMode) {
      print(_controller.text);
      print(_selectedAtasan);
    }
  }

  @override
  void initState() {
    path = widget.path;
    setDataStruktural();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = 80 / 100 * (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        automaticallyImplyLeading: false,
        middle: Text('Foto Absen'),
        border: Border.fromBorderSide(
          BorderSide.none,
        ),
      ),
      backgroundColor: CupertinoColors.lightBackgroundGray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.file(
                    File(path),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ],
            ),
            setDropdownDataAtasan(width),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              width: width,
              child: TextField(
                controller: _controller,
                onChanged: (val){
                  validate();
                },
                decoration: const InputDecoration(
                  label: Text('Alasan'),
                  hintText: 'Apa alasan anda absen diluar kantor?',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.4,
                        50.0,
                      ),
                    ),
                    child: const Text('Batal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      disableButton ? null : Navigator.of(context).pop(data);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: disableButton ? Colors.grey : Colors.blueAccent,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.4,
                        50.0,
                      ),
                    ),
                    child: const Text('Kirim'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
