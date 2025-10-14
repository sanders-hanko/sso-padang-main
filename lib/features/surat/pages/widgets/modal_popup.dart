import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../application/blocs/form_input_bloc/form_input_bloc.dart';
import '../../application/blocs/form_input_bloc/form_input_state.dart';

class ModalPopup extends StatelessWidget {
  const ModalPopup({
    super.key,
    required this.parentContext,
    required this.label,
  });

  final BuildContext parentContext;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(parentContext).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: BlocBuilder<FormInputBloc, FormInputState>(
        builder: (parentContext, state) {
          if (state is Loaded &&
              ['Tujuan', 'Dari'].contains(state.label) &&
              state.organisasi.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: state.organisasi
                          .map(
                            (value) => CupertinoListTile(
                              backgroundColor: label == 'Dari'
                                  ? (state.previousSelectedDari?.id == value?.id
                                      ? Colors.black12
                                      : CupertinoColors.white)
                                  : (state.previousSelectedTujuan
                                          .where((val) => val?.id == value?.id)
                                          .isNotEmpty
                                      ? Colors.black12
                                      : CupertinoColors.white),
                              onTap: () {
                                parentContext.read<FormInputBloc>().add(
                                      FormInputEvent.selectOrganisasi(
                                        value.id,
                                        value.namaOrganisasi,
                                        label,
                                      ),
                                    );
                              },
                              leading: value?.type == 'Publik'
                                  ? SvgPicture.asset(
                                      'assets/svg_image/humanpictos.svg')
                                  : SvgPicture.asset(
                                      'assets/svg_image/worker.svg'),
                              title: Text(value!.namaOrganisasi),
                              subtitle: Text(value.type),
                              trailing: label == 'Dari'
                                  ? (state.previousSelectedDari?.id == value.id
                                      ? const Icon(
                                          Icons.remove,
                                          color: CupertinoColors.destructiveRed,
                                        )
                                      : const Icon(
                                          CupertinoIcons.add,
                                          color: CupertinoColors.activeBlue,
                                        ))
                                  : (state.previousSelectedTujuan
                                          .where((val) => val?.id == value.id)
                                          .isNotEmpty
                                      ? const Icon(
                                          Icons.remove,
                                          color: CupertinoColors.destructiveRed,
                                        )
                                      : const Icon(
                                          CupertinoIcons.add,
                                          color: CupertinoColors.activeBlue,
                                        )),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        minimumSize: const Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: const Text(
                      'Selesai',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is Selected &&
              ['Tujuan', 'Dari'].contains(state.label) &&
              state.organisasi.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: state.organisasi
                          .map(
                            (value) => CupertinoListTile(
                              backgroundColor: label == 'Dari'
                                  ? (state.selectedDari?.id == value?.id
                                      ? Colors.black12
                                      : CupertinoColors.white)
                                  : (state.selectedTujuan
                                          .where((val) => val?.id == value?.id)
                                          .isNotEmpty
                                      ? Colors.black12
                                      : CupertinoColors.white),
                              onTap: () {
                                parentContext.read<FormInputBloc>().add(
                                      FormInputEvent.selectOrganisasi(
                                        value.id,
                                        value.namaOrganisasi,
                                        label,
                                      ),
                                    );
                              },
                              leading: value?.type == 'Publik'
                                  ? SvgPicture.asset(
                                      'assets/svg_image/humanpictos.svg')
                                  : SvgPicture.asset(
                                      'assets/svg_image/worker.svg'),
                              title: Text(value!.namaOrganisasi),
                              subtitle: Text(value.type),
                              trailing: label == 'Dari'
                                  ? (state.selectedDari?.id == value.id
                                      ? const Icon(
                                          Icons.remove,
                                          color: CupertinoColors.destructiveRed,
                                        )
                                      : const Icon(
                                          CupertinoIcons.add,
                                          color: CupertinoColors.activeBlue,
                                        ))
                                  : (state.selectedTujuan
                                          .where((val) => val?.id == value.id)
                                          .isNotEmpty
                                      ? const Icon(
                                          Icons.remove,
                                          color: CupertinoColors.destructiveRed,
                                        )
                                      : const Icon(
                                          CupertinoIcons.add,
                                          color: CupertinoColors.activeBlue,
                                        )),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        minimumSize: const Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: const Text(
                      'Selesai',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is Loaded &&
              ['Asisten'].contains(state.label) &&
              state.asisten.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: state.asisten
                          .map(
                            (value) => CupertinoListTile(
                              backgroundColor:
                                  state.previousSelectedAsisten == value
                                      ? Colors.black12
                                      : CupertinoColors.white,
                              onTap: () {
                                parentContext.read<FormInputBloc>().add(
                                      FormInputEvent.selectAsisten(
                                        value.nip,
                                        value.nama,
                                        value.jabatan,
                                        label,
                                      ),
                                    );
                              },
                              title: Text(value!.nama),
                              subtitle: Text(value.jabatan),
                              leading: SvgPicture.asset(
                                  'assets/svg_image/smartphone_iphone.svg'),
                              trailing: state.previousSelectedAsisten == value
                                  ? const Icon(
                                      Icons.remove,
                                      color: CupertinoColors.destructiveRed,
                                    )
                                  : const Icon(
                                      Icons.add,
                                      color: CupertinoColors.activeBlue,
                                    ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        minimumSize: const Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: const Text(
                      'Selesai',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is Selected &&
              ['Asisten'].contains(state.label) &&
              state.asisten.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: state.asisten
                          .map(
                            (value) => CupertinoListTile(
                              backgroundColor: state.selectedAsisten == value
                                  ? Colors.black12
                                  : CupertinoColors.white,
                              onTap: () {
                                parentContext.read<FormInputBloc>().add(
                                      FormInputEvent.selectAsisten(
                                        value.nip,
                                        value.nama,
                                        value.jabatan,
                                        label,
                                      ),
                                    );
                              },
                              title: Text(value!.nama),
                              subtitle: Text(value.jabatan),
                              leading: SvgPicture.asset(
                                  'assets/svg_image/smartphone_iphone.svg'),
                              trailing: state.selectedAsisten == value
                                  ? const Icon(
                                      Icons.remove,
                                      color: CupertinoColors.destructiveRed,
                                    )
                                  : const Icon(
                                      Icons.add,
                                      color: CupertinoColors.activeBlue,
                                    ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        minimumSize: const Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: const Text(
                      'Selesai',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is Error) {
            return Container(
              padding: const EdgeInsets.all(98.0),
              child:
                  Lottie.asset('assets/json_image/animation_not_found_2.json'),
            );
          }

          return const CupertinoActivityIndicator();
        },
      ),
    );
  }
}
