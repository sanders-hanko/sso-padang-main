import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/surat/application/blocs/form_input_bloc/form_input_bloc.dart';
import 'package:super_app/features/surat/application/blocs/form_input_bloc/form_input_state.dart';
import 'package:super_app/features/surat/pages/widgets/modal_popup.dart';

class PageInput extends StatelessWidget {
  const PageInput({
    super.key,
    required this.controller,
    required this.label,
    this.useLabel = true,
    this.lines = 1,
    required this.parentContext,
    this.event,
    this.inputVar,
    this.icon = CupertinoIcons.chevron_down,
    this.jumlahTujuan,
    this.focusNode,
    this.expand = false,
  });

  final TextEditingController controller;
  final String label;
  final bool? useLabel;
  final int? lines;
  final BuildContext parentContext;
  final FormInputEvent? event;
  final List<String>? inputVar;
  final IconData? icon;
  final TextEditingController? jumlahTujuan;
  final FocusNode? focusNode;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: useLabel! ? 16.0 : 0.0, vertical: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          useLabel!
              ? Column(
                  children: [
                    Text(label),
                  ],
                )
              : const SizedBox(width: 0.0),
          const Expanded(
            child: SizedBox(
              width: 0.0,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(parentContext).size.width *
                (useLabel! ? 0.70 : 0.99),
            child: GestureDetector(
              onTap: () {
                parentContext.read<FormInputBloc>().add(event!);
              },
              child: AbsorbPointer(
                absorbing: useLabel! ? true : false,
                child: useLabel!
                    ? BlocConsumer<FormInputBloc, FormInputState>(
                        listener: (parentContext, state) {
                          if (state is Selected &&
                              state.label == label &&
                              label == 'Dari' &&
                              state.selectedDari != null) {
                            controller.text =
                                state.selectedDari!.namaOrganisasi;
                            inputVar?.clear();
                            inputVar?.add(state.selectedDari!.id);
                          }

                          if (state is Selected &&
                              state.label == label &&
                              label == 'Dari' &&
                              state.selectedDari == null) {
                            controller.text = '';
                            inputVar?.clear();
                          }

                          if (state is Selected &&
                              state.label == label &&
                              label == 'Tujuan' &&
                              state.selectedTujuan.isNotEmpty) {
                            controller.text =
                                state.selectedTujuan[0]!.namaOrganisasi;
                            inputVar?.clear();
                            for (var value in state.selectedTujuan) {
                              inputVar?.add(value!.id);
                            }
                            jumlahTujuan?.text =
                                state.selectedTujuan.length.toString();
                          }

                          if (state is Selected &&
                              state.label == label &&
                              label == 'Tujuan' &&
                              state.selectedTujuan.isEmpty) {
                            controller.text = '';
                            inputVar?.clear();
                            jumlahTujuan?.text = '';
                          }

                          if (state is Selected &&
                              state.label == label &&
                              label == 'Asisten' &&
                              state.selectedAsisten != null) {
                            controller.text = state.selectedAsisten!.nama;
                            inputVar?.clear();
                            inputVar?.add(state.selectedAsisten!.nip);
                          }

                          if (state is Selected &&
                              state.label == label &&
                              label == 'Asisten' &&
                              state.selectedAsisten == null) {
                            controller.text = '';
                            inputVar?.clear();
                          }

                          if (state is Loading && state.label == label) {
                            showCupertinoModalPopup(
                              barrierDismissible: false,
                              context: parentContext,
                              builder: (parentContext) {
                                return ModalPopup(
                                  parentContext: parentContext,
                                  label: label,
                                );
                              },
                            );
                          }
                        },
                        builder: (parentContext, state) {
                          if (state is Loaded) {
                            return TextField(
                              controller: controller,
                              maxLines: lines,
                              decoration: InputDecoration(
                                hintText: useLabel! ? '...' : label,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            );
                          }

                          return TextField(
                            controller: controller,
                            maxLines: lines,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              hintText: '...',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          );
                        },
                      )
                    : TextField(
                        focusNode: focusNode,
                        onTapOutside: (event) {
                          focusNode?.unfocus();
                        },
                        controller: controller,
                        maxLines: lines,
                        expands: expand,
                      textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: label,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12.0),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          useLabel!
              ? GestureDetector(
                  onTap: () {
                    parentContext.read<FormInputBloc>().add(event!);
                  },
                  child: BlocBuilder<FormInputBloc, FormInputState>(
                    builder: (parentContext, state) {
                      if (jumlahTujuan != null &&
                          jumlahTujuan!.text.isNotEmpty &&
                          int.parse(jumlahTujuan!.text) > 1) {
                        return Container(
                          width: 28.0,
                          margin: const EdgeInsets.only(
                            left: 6.0,
                            right: 4.0,
                          ),
                          child: Text(
                            '+${int.parse(jumlahTujuan!.text) - 1}',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                            width: 38, child: Center(child: Icon(icon)));
                      }
                    },
                  ),
                )
              : const SizedBox(width: 0.0),
        ],
      ),
    );
  }
}
