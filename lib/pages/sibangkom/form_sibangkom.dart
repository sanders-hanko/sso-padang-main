import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/services/berkas_service.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

class FormSibangkom extends StatefulWidget {
  const FormSibangkom({
    super.key,
    required this.files,
    required this.namaLayanan,
    required this.idJenisLayanan,
  });

  final List<dynamic>? files;
  final String idJenisLayanan;
  final String namaLayanan;

  @override
  State<FormSibangkom> createState() => StateFormSibangkom();
}

class StateFormSibangkom extends State<FormSibangkom> {
  final BerkasService _service = BerkasService();
  late List<Widget> fileTile = [];
  late int jumlah = 0;
  final Queue<dynamic> _indexQueue = Queue();
  final Queue<dynamic> _fileQueue = Queue();
  late List<Widget?> pilih = [];
  late List<Widget?> subtitle = [];
  List<FilePickerResult?> filePickers = [];
  bool isUploading = false;
  late String draftCode;
  late String draftCodeLama;
  late List draftBerkas;
  late bool draftFound = false;
  late String nipPegawai;
  late int draftId;
  late bool disabled = true;
  late bool isSending = false;

  String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
        ),
      );

  Future<void> pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      filePickers[index] = result;
      pilih[index] = const Text(
        'Menunggu',
        style: TextStyle(
          color: CupertinoColors.activeOrange,
        ),
      );
      _indexQueue.add(index);
      _fileQueue.add(result);
      if (!isUploading) {
        startUpload(index);
      }
      setState(() {});
    }
  }

  Future<void> uploadFile(index, file) async {
    isUploading = true;
    disabled = true;

    setState(
      () {
        pilih[index] = const Text(
          'Uploading',
          style: TextStyle(
            color: CupertinoColors.activeBlue,
          ),
        );
      },
    );

    final uploadResult = await _service.doUpload(
      nipPegawai,
      index,
      file,
      draftCode,
      widget.files?[index]['id'],
      widget.idJenisLayanan,
    );

    if (kDebugMode) {
      print(uploadResult.length);
      print(uploadResult);
    }

    if (uploadResult.isNotEmpty && uploadResult[0]['success']) {
      pilih[index] = const Icon(
        Icons.check,
        color: CupertinoColors.activeGreen,
      );
      subtitle[index] = Text('${file.names[0]}');
      disabled = false;
    } else {
      pilih[index] = InkWell(
        child: const Text(
          'Coba lagi',
          style: TextStyle(
            color: CupertinoColors.destructiveRed,
          ),
        ),
        onTap: () {
          pickFile(index);
        },
      );
    }

    if (kDebugMode) {
      print(uploadResult);
      print('Berkas No ${index + 1} selesai');
    }

    isUploading = false;
    setState(() {});
  }

  Future<void> startUpload(index) async {
    if (_indexQueue.isEmpty) return;
    while (_indexQueue.isNotEmpty) {
      final currentIndex = _indexQueue.removeFirst();
      final currentFile = _fileQueue.removeFirst();
      await uploadFile(currentIndex, currentFile);
    }
  }

  void addFilePicker() {
    for (int i = 0; i < widget.files!.length; i++) {
      setState(
        () {
          filePickers.add(null);
          subtitle.add(null);
          pilih.add(
            InkWell(
              child: const Text('Pilih'),
              onTap: () {
                pickFile(i);
              },
            ),
          );
        },
      );
    }
  }

  Future<void> cekDraft() async {
    const storage = FlutterSecureStorage();

    final user = await storage.read(key: 'user');

    final String nip = jsonDecode(user!)['nip'];

    setState(() {
      nipPegawai = nip;
      draftCode = getRandomString(15);
    });

    final draft = await _service.getDraft(
        nip.toString(), widget.idJenisLayanan.toString());

    if (draft.isNotEmpty) {
      if (draft['timeout'] != null) {
      } else {
        draftFound = true;
        draftCodeLama = draft['kode_draft'];
        draftBerkas = draft['berkas_draft'];
        draftId = draft['id'];
        setState(() {});
      }
    }
  }

  Future<void> lanjutkanDraft(bool lanjutkan) async {
    if (lanjutkan) {
      draftCode = draftCodeLama;
      draftFound = false;
      for (var (index, files) in widget.files!.indexed) {
        for (var berkas in draftBerkas) {
          if (files['id'] == berkas['id_berkas']) {
            pilih[index] = const Icon(
              Icons.check,
              color: CupertinoColors.activeGreen,
            );
            subtitle[index] = Text('${berkas['nama_berkas_asli']}');
            disabled = false;
            setState(() {});
          }
        }
      }
      if (kDebugMode) {
        print('berkas : $draftBerkas');
      }
      setState(() {});
    } else {
      draftFound = false;
      await _service.hapusDraft(draftId.toString());
      setState(() {});
    }
  }

  Future<void> kirimLayanan(context) async {
    isSending = true;
    disabled = true;
    setState(() {});
    final bool status = await _service.kirimLayanan(nipPegawai, draftCode, 0);
    if (status) {
      Navigator.of(context).pop(true);
    } else {
      isSending = false;
      disabled = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    addFilePicker();
    cekDraft();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fileTile.clear();

    for (var (index, data) in widget.files!.indexed) {
      var ext = data['ekstensi'];
      var ukuran = data['ukuran_maksimal'];
      var format = Text('Format $ext, maksimal $ukuran KB');
      var picker = CupertinoListTile(
          title: Text('${index + 1}. ${data['nama_form']}'),
          subtitle: subtitle.isEmpty ? format : (subtitle[index] ?? format),
          trailing: pilih[index]);

      fileTile.add(picker);
      fileTile.add(
        Container(
          margin: const EdgeInsets.only(left: 24.0),
          child: const Divider(
            height: 0.0,
            color: CupertinoColors.systemFill,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        previousPageTitle: 'Kembali',
        middle: Text('Permohonan Baru'),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 8.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengajuan Permohonan Pengembangan Kompetensi ASN melalui ${widget.namaLayanan}.',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.label,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: const Text(
                          'Silakan lengkapi persyaratan berikut dengan melakukan tap pada tombol Pilih',
                          style: TextStyle(
                            color: CupertinoColors.label,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                draftFound
                    ? Container(
                        margin: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          top: 8.0,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 16.0),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Lanjutkan draft sebelumnya?',
                                    style: TextStyle(
                                      color: CupertinoColors.label,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    lanjutkanDraft(false);
                                  },
                                  child: const Text(
                                    'Tidak',
                                    style: TextStyle(
                                      color: CupertinoColors.systemRed,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    lanjutkanDraft(true);
                                  },
                                  child: const Text(
                                    'Ya',
                                    style: TextStyle(
                                      color: CupertinoColors.activeBlue,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : const Row(
                        children: [],
                      ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 8.0,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: fileTile,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      disabled ? null : kirimLayanan(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: disabled
                          ? CupertinoColors.inactiveGray
                          : Colors.blue[500],
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                    ),
                    child: Text(
                      isSending ? 'Mengirim ...' : 'Kirim',
                      style: const TextStyle(
                        color: CupertinoColors.white,
                      ),
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
}
