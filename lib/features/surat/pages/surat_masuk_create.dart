import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/surat/application/blocs/file_bloc/file_bloc.dart';
import 'package:super_app/features/surat/application/blocs/file_bloc/file_state.dart';
import 'package:super_app/features/surat/application/blocs/file_bloc/file_state.dart'
    as file_state;
import 'package:super_app/features/surat/application/blocs/form_input_bloc/form_input_bloc.dart';
import 'package:super_app/features/surat/application/blocs/form_input_bloc/form_input_state.dart';
import 'package:super_app/features/surat/application/blocs/form_input_bloc/form_input_state.dart'
    as form_input_state;
import 'package:super_app/features/surat/application/models/form_surat_model/form_surat_model.dart';
import 'package:super_app/features/surat/pages/widgets/ellipsis_menu.dart';
import 'package:super_app/features/surat/pages/widgets/page_input.dart';

class SuratMasukCreate extends StatefulWidget {
  const SuratMasukCreate({super.key});

  @override
  State<SuratMasukCreate> createState() => _SuratMasukCreateState();
}

class _SuratMasukCreateState extends State<SuratMasukCreate> {
  final TextEditingController controllerTujuan = TextEditingController();
  final TextEditingController controllerDari = TextEditingController();
  final TextEditingController controllerNamaPengirim = TextEditingController();
  final TextEditingController controllerJenis = TextEditingController();
  final TextEditingController controllerPerihal = TextEditingController();
  final TextEditingController controllerAsisten = TextEditingController();
  late List<String> selectedDariId = [];
  late List<String> selectedTujuanId = [];
  late List<String> selectedAsistenId = [];
  final TextEditingController jumlahTujuan = TextEditingController();
  late String fileName = '';
  late String filePath = '';
  late FilePickerResult? file;
  final FocusNode _focusNodeJenis = FocusNode();
  final FocusNode _focusNodePerihal = FocusNode();
  final FocusNode _focusNodePengirim = FocusNode();

  @override
  void initState() {
    context.read<FormInputBloc>().add(const FormInputEvent.reset());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              context.read<FileBloc>().add(const FileEvent.reset());
              return Navigator.pop(context);
            },
            child: const Icon(Icons.clear)),
        actions: [
          GestureDetector(
              onTap: () async {
                context.read<FileBloc>().add(const FileEvent.pickFile());
              },
              child: const Icon(Icons.attachment)),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 32.0,
            child: BlocConsumer<FormInputBloc, FormInputState>(
              listener: (context, state) {
                if (state is Sent) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Center(
                        child: Text(
                          'Sukses',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.green.shade600,
                    ),
                  );
                  Future.delayed(const Duration(seconds: 2)).then((val) {
                    context.mounted
                        ? Navigator.of(context).pop(state.surat)
                        : null;
                  });
                }

                if (state is form_input_state.Error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.red.shade600,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is Sending || state is Sent) {
                  return const SizedBox(
                    width: 32.0,
                    child: Center(child: CupertinoActivityIndicator()),
                  );
                }

                return GestureDetector(
                  onTap: () {
                    context.read<FormInputBloc>().add(
                          FormInputEvent.send(
                            FormSuratModel(
                              pengirimId: selectedDariId.isNotEmpty
                                  ? selectedDariId[0]
                                  : '',
                              pengirimNama: selectedDariId.isNotEmpty
                                  ? (selectedDariId[0] == '0'
                                      ? controllerNamaPengirim.text
                                      : controllerDari.text)
                                  : '',
                              tujuanId: selectedTujuanId,
                              asisten: selectedAsistenId.isNotEmpty
                                  ? selectedAsistenId[0]
                                  : '',
                              jenis: controllerJenis.text,
                              perihal: controllerPerihal.text,
                              filePath: filePath,
                            ),
                          ),
                        );
                  },
                  child: const Icon(Icons.send),
                );
              },
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          GestureDetector(
              onTap: () async {
                final response = await showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return const EllipsisMenu();
                    });
                if (response != null) {
                  context.mounted
                      ? context.read<FileBloc>().add(const FileEvent.reset())
                      : null;
                  context.mounted ? Navigator.pop(context) : null;
                }
              },
              child: const Icon(CupertinoIcons.ellipsis)),
          const SizedBox(
            width: 16,
          ),
        ],
        backgroundColor: CupertinoColors.white,
        // border: const Border.fromBorderSide(BorderSide.none),
      ),
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.84) - MediaQuery.of(context).viewInsets.bottom,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<FormInputBloc, FormInputState>(
                          builder: (context, state) {
                            return PageInput(
                              controller: controllerDari,
                              label: 'Dari',
                              parentContext: context,
                              event: const FormInputEvent.fetchOrganisasi(
                                  'Dari'),
                              inputVar: selectedDariId,
                            );
                          },
                        ),
                        const Divider(),
                        PageInput(
                          controller: controllerTujuan,
                          label: 'Tujuan',
                          parentContext: context,
                          event:
                              const FormInputEvent.fetchOrganisasi('Tujuan'),
                          inputVar: selectedTujuanId,
                          icon: CupertinoIcons.add_circled,
                          jumlahTujuan: jumlahTujuan,
                        ),
                        const Divider(),
                        PageInput(
                          controller: controllerAsisten,
                          label: 'Asisten',
                          parentContext: context,
                          event: const FormInputEvent.fetchAsisten('Asisten'),
                          inputVar: selectedAsistenId,
                        ),
                        const Divider(),
                        BlocBuilder<FormInputBloc, FormInputState>(
                            builder: (context, state) {
                          if (selectedDariId.isNotEmpty &&
                              selectedDariId.contains('0')) {
                            return PageInput(
                              controller: controllerNamaPengirim,
                              label: 'Nama Pengirim/Nama Organisasi',
                              useLabel: false,
                              parentContext: context,
                              focusNode: _focusNodePengirim,
                            );
                          }
                          return const SizedBox(width: 0, height: 0);
                        }),
                        BlocBuilder<FormInputBloc, FormInputState>(
                            builder: (context, state) {
                          if (selectedDariId.isNotEmpty &&
                              selectedDariId.contains('0')) {
                            return const Divider();
                          }
                          return const SizedBox(width: 0, height: 0);
                        }),
                        PageInput(
                          controller: controllerJenis,
                          label: 'Jenis',
                          useLabel: false,
                          parentContext: context,
                          focusNode: _focusNodeJenis,
                        ),
                        const Divider(),
                        SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.only(top: 8),
                            height: (MediaQuery.of(context).size.height * 0.35) - (MediaQuery.of(context).viewInsets.bottom - (MediaQuery.of(context).size.height * 0.1)),
                            child: PageInput(
                              controller: controllerPerihal,
                              label: 'Perihal',
                              useLabel: false,
                              lines: null,
                              parentContext: context,
                              focusNode: _focusNodePerihal,
                              expand: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 120),
                      curve: Curves.linear,
                      alignment: Alignment.bottomCenter,
                      // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: BlocConsumer<FileBloc, FileState>(
                        builder: (context, state) {
                          late String text = '';

                          if (state is file_state.Loaded &&
                              state.file.count > 0) {
                            final name = state.file.names[0].toString();
                            text = name.length > 32
                                ? '${text.substring(0, 32)}...'
                                : name;
                            file = state.file;
                            filePath = state.file.paths[0]!;
                          }

                          if (state is file_state.Error) {
                            file = null;
                            filePath = '';
                          }

                          return text == ''
                              ? const Text('')
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: Text('File: $text'),
                                );
                        },
                        listener: (context, state) {
                          if (state is file_state.Error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Center(
                                  child: Text(
                                    'File tidak dipilih!',
                                    style: TextStyle(
                                        color: CupertinoColors.white),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
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
