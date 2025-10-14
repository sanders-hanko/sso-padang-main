import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/core/auth/blocs/permission_state.dart';
import 'package:super_app/core/global_variables.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_validation_bloc/aktivitas_validation_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/aktivitas_validation_bloc/aktivitas_validation_state.dart'
    as aktivitas_validation_state;
import 'package:super_app/features/aktivitas/application/blocs/atasan_bloc/atasan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/atasan_bloc/atasan_state.dart';
import 'package:super_app/features/aktivitas/application/blocs/core_value_bloc/core_value_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/core_value_bloc/core_value_state.dart'
    as core_value_state;
import 'package:super_app/features/aktivitas/application/blocs/foto_bloc/foto_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/foto_bloc/foto_state.dart'
    as foto_state;
import 'package:super_app/features/aktivitas/application/blocs/kegiatan_bloc/kegiatan_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/kegiatan_bloc/kegiatan_state.dart'
    as kegiatan_state;
import 'package:super_app/features/aktivitas/application/blocs/tanggal_bloc/tanggal_bloc.dart';
import 'package:super_app/features/aktivitas/application/blocs/tanggal_bloc/tanggal_state.dart'
    as tanggal_state;
import 'package:super_app/features/aktivitas/application/lokal_variables.dart';
import 'package:super_app/features/aktivitas/application/services/aktivitas_service.dart';
import 'package:super_app/features/aktivitas/pages/pilih_atasan.dart';
import 'package:super_app/features/aktivitas/pages/pilih_core_value.dart';
import 'package:super_app/features/aktivitas/pages/pilih_kegiatan.dart';
import 'package:super_app/features/aktivitas/pages/pilih_tanggal.dart';

class AktivitasCreate extends StatefulWidget {
  const AktivitasCreate({super.key});

  @override
  State<AktivitasCreate> createState() => _AktivitasCreateState();
}

class _AktivitasCreateState extends State<AktivitasCreate> {
  final FocusNode _keteranganFocus = FocusNode();
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _atasanController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _coreValueController = TextEditingController();
  final TextEditingController _kegiatanController = TextEditingController();
  final TextEditingController _fotoController = TextEditingController();
  final TextEditingController _fileNameController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    fetchAtasan(context);
    fetchCoreValue(context);
    initialKegiatan(context);
    initialFoto(context);
    setDefaultTanggal(context);
    setDefaultAtasan(context, _nipController, _atasanController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.chevron_left,
            size: 36,
            color: CupertinoColors.activeBlue,
          ),
        ),
        title: const Text('Buat Aktivitas'),
        backgroundColor: CupertinoColors.white,
        surfaceTintColor: CupertinoColors.white,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'INFO',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Text(
                    '$buatAktivitasInfo\n\n$buatAktivitasInfo2',
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                BlocBuilder<PermissionBloc, PermissionState>(
                  builder: (context, state) {
                    late bool bypassPermission = false;

                    if (state is PermissionLoaded) {
                      state.permission?.forEach((val) {
                        if (val.accessKode == utils.bypassAktivitasAccessCode) {
                          bypassPermission = true;
                        }
                      });
                    }

                    if (state is Permitted) {
                      state.permission?.forEach((val) {
                        if (val.accessKode == utils.bypassAktivitasAccessCode) {
                          bypassPermission = true;
                        }
                      });
                    }

                    return Visibility(
                      visible: !bypassPermission,
                      child: BlocBuilder<AtasanBloc, AtasanState>(
                        builder: (context, state) {
                          if (state is Loading) {
                            pilihAtasanSubtitle = 'Atasan belum dipilih.';
                            leadingAtasan = const Text('');
                            namaAtasan = const CupertinoActivityIndicator();
                          }

                          if (state is Loaded) {
                            pilihAtasanSubtitle = 'Atasan belum dipilih.';
                            leadingAtasan = const Text('');
                            namaAtasan = GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return const PilihAtasan();
                                    },
                                  ),
                                );
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    'Pilih',
                                    style: TextStyle(
                                        color: CupertinoColors.activeBlue),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: CupertinoColors.activeBlue,
                                  )
                                ],
                              ),
                            );
                          }

                          if (state is Selected) {
                            _atasanController.text = state.atasan.nip;
                            pilihAtasanSubtitle = 'Atasan dipilih.';
                            leadingAtasan = const Icon(
                              CupertinoIcons.checkmark,
                              color: CupertinoColors.activeBlue,
                            );
                            namaAtasan = GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return const PilihAtasan();
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    state.atasan.nama,
                                    style: const TextStyle(
                                        color: CupertinoColors.activeBlue),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: CupertinoColors.activeBlue,
                                  ),
                                ],
                              ),
                            );
                            context.read<AktivitasValidationBloc>().add(
                                  AktivitasValidationEvent.validate(
                                    _nipController,
                                    _atasanController,
                                    _tanggalController,
                                    _coreValueController,
                                    _kegiatanController,
                                    _fotoController,
                                    _fileNameController,
                                    _keteranganController,
                                  ),
                                );
                          }

                          return CupertinoListTile(
                            leading: leadingAtasan,
                            title: const Text('Pilih atasan'),
                            subtitle: Text(pilihAtasanSubtitle),
                            trailing: namaAtasan,
                          );
                        },
                      ),
                    );
                  },
                ),
                BlocBuilder<TanggalBloc, tanggal_state.TanggalState>(
                  builder: (context, state) {
                    late String tgl = 'dd/mm/yyyy';
                    late String pilihTgl = 'Pilih';

                    if (state is tanggal_state.TanggalDefault) {
                      if (state.tanggal != null) {
                        _tanggalController.text =
                            '${state.tahun}-${state.bulan}-${state.tanggal}';
                        tgl = '${state.tanggal}/${state.bulan}/${state.tahun}';
                        leadingTanggal = const Icon(
                          CupertinoIcons.checkmark,
                          color: CupertinoColors.activeBlue,
                        );
                        pilihTgl =
                            '${state.tanggal} ${listNamaBulan[int.parse(state.bulan) - 1]} ${state.tahun}';
                        context.read<AktivitasValidationBloc>().add(
                              AktivitasValidationEvent.validate(
                                _nipController,
                                _atasanController,
                                _tanggalController,
                                _coreValueController,
                                _kegiatanController,
                                _fotoController,
                                _fileNameController,
                                _keteranganController,
                              ),
                            );
                      }
                    }

                    if (state is tanggal_state.Selected) {
                      if (state.tanggal != null) {
                        _tanggalController.text =
                            '${state.tahun}-${state.bulan}-${state.tanggal}';
                        tgl = '${state.tanggal}/${state.bulan}/${state.tahun}';
                        leadingTanggal = const Icon(
                          CupertinoIcons.checkmark,
                          color: CupertinoColors.activeBlue,
                        );
                        pilihTgl =
                            '${state.tanggal} ${listNamaBulan[int.parse(state.bulan) - 1]} ${state.tahun}';
                        context.read<AktivitasValidationBloc>().add(
                              AktivitasValidationEvent.validate(
                                _nipController,
                                _atasanController,
                                _tanggalController,
                                _coreValueController,
                                _kegiatanController,
                                _fotoController,
                                _fileNameController,
                                _keteranganController,
                              ),
                            );
                      } else {
                        _tanggalController.text = '';
                        leadingTanggal = const Text('');
                        context.read<AktivitasValidationBloc>().add(
                              AktivitasValidationEvent.validate(
                                _nipController,
                                _atasanController,
                                _tanggalController,
                                _coreValueController,
                                _kegiatanController,
                                _fotoController,
                                _fileNameController,
                                _keteranganController,
                              ),
                            );
                      }
                    }

                    return CupertinoListTile(
                      title: const Text('Tanggal'),
                      leading: leadingTanggal,
                      subtitle: Text(tgl),
                      trailing: BlocBuilder<PermissionBloc, PermissionState>(
                        builder: (context, state) {
                          late bool bypassPermission = false;

                          if (state is PermissionLoaded) {
                            state.permission?.forEach((val) {
                              if (val.accessKode ==
                                  utils.bypassAktivitasAccessCode) {
                                bypassPermission = true;
                              }
                            });
                          }

                          if (state is Permitted) {
                            state.permission?.forEach((val) {
                              if (val.accessKode ==
                                  utils.bypassAktivitasAccessCode) {
                                bypassPermission = true;
                              }
                            });
                          }

                          if (bypassPermission) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return const PilihTanggal();
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    pilihTgl,
                                    style: const TextStyle(
                                        color: CupertinoColors.activeBlue),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: CupertinoColors.activeBlue,
                                  ),
                                ],
                              ),
                            );
                          }

                          return Row(
                            children: [
                              Text(
                                pilihTgl,
                                style: const TextStyle(
                                    color: CupertinoColors.black),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                BlocBuilder<CoreValueBloc, core_value_state.CoreValueState>(
                  builder: (context, state) {
                    if (state is core_value_state.Loading) {
                      pilihCoreValueSubtitle = 'Core value belum dipilih.';
                      namaCoreValue = const CupertinoActivityIndicator();
                      leadingCoreValue = const Text('');
                    }

                    if (state is core_value_state.Loaded) {
                      pilihCoreValueSubtitle = 'Core value belum dipilih.';
                      leadingCoreValue = const Text('');
                      namaCoreValue = GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return const PilihCoreValue();
                              },
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              'Pilih',
                              style:
                                  TextStyle(color: CupertinoColors.activeBlue),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: CupertinoColors.activeBlue,
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is core_value_state.Selected) {
                      _coreValueController.text = state.coreValue.id;
                      _kegiatanController.text = '';
                      pilihCoreValueSubtitle = 'Core value dipilih.';
                      leadingCoreValue = const Icon(
                        CupertinoIcons.checkmark,
                        color: CupertinoColors.activeBlue,
                      );
                      namaCoreValue = GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return const PilihCoreValue();
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              state.coreValue.nama,
                              style: const TextStyle(
                                  color: CupertinoColors.activeBlue),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: CupertinoColors.activeBlue,
                            ),
                          ],
                        ),
                      );
                      context.read<AktivitasValidationBloc>().add(
                            AktivitasValidationEvent.validate(
                              _nipController,
                              _atasanController,
                              _tanggalController,
                              _coreValueController,
                              _kegiatanController,
                              _fotoController,
                              _fileNameController,
                              _keteranganController,
                            ),
                          );
                    }

                    return CupertinoListTile(
                      title: const Text('Core Value'),
                      leading: leadingCoreValue,
                      subtitle: Text(pilihCoreValueSubtitle),
                      trailing: GestureDetector(
                        child: namaCoreValue,
                      ),
                    );
                  },
                ),
                BlocBuilder<KegiatanBloc, kegiatan_state.KegiatanState>(
                  builder: (context, state) {
                    if (state is kegiatan_state.Initial) {
                      pilihKegiatanSubtitle = 'Kegiatan belum dipilih.';
                      leadingKegiatan = const Text('');
                      namaKegiatan = const Row(
                        children: [
                          Text(
                            'Pilih',
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: CupertinoColors.inactiveGray,
                          ),
                        ],
                      );
                    }

                    if (state is kegiatan_state.Loading) {
                      pilihKegiatanSubtitle = 'Kegiatan belum dipilih.';
                      leadingKegiatan = const Text('');
                      namaKegiatan = const CupertinoActivityIndicator();
                    }

                    if (state is kegiatan_state.Loaded) {
                      _kegiatanController.text = '';
                      pilihKegiatanSubtitle = 'Kegiatan belum dipilih.';
                      leadingKegiatan = const Text('');
                      namaKegiatan = GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return PilihKegiatan(
                                    coreValue: state.coreValue);
                              },
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              'Pilih',
                              style:
                                  TextStyle(color: CupertinoColors.activeBlue),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: CupertinoColors.activeBlue,
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is kegiatan_state.Selected) {
                      _kegiatanController.text = state.kegiatan.id;
                      pilihKegiatanSubtitle = 'Kegiatan dipilih.';
                      leadingKegiatan = const Icon(
                        CupertinoIcons.checkmark,
                        color: CupertinoColors.activeBlue,
                      );
                      namaKegiatan = GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return PilihKegiatan(
                                    coreValue: state.coreValue);
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                state.kegiatan.nama,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    color: CupertinoColors.activeBlue),
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: CupertinoColors.activeBlue,
                            ),
                          ],
                        ),
                      );
                      context.read<AktivitasValidationBloc>().add(
                            AktivitasValidationEvent.validate(
                              _nipController,
                              _atasanController,
                              _tanggalController,
                              _coreValueController,
                              _kegiatanController,
                              _fotoController,
                              _fileNameController,
                              _keteranganController,
                            ),
                          );
                    }

                    return CupertinoListTile(
                      title: const Text('Kegiatan'),
                      leading: leadingKegiatan,
                      subtitle: Text(pilihKegiatanSubtitle),
                      trailing: namaKegiatan,
                    );
                  },
                ),
                BlocBuilder<FotoBloc, foto_state.FotoState>(
                  builder: (context, state) {
                    if (state is foto_state.Selected) {
                      _fotoController.text = state.foto.path;
                      _fileNameController.text = state.foto.filename;
                      context.read<AktivitasValidationBloc>().add(
                            AktivitasValidationEvent.validate(
                              _nipController,
                              _atasanController,
                              _tanggalController,
                              _coreValueController,
                              _kegiatanController,
                              _fotoController,
                              _fileNameController,
                              _keteranganController,
                            ),
                          );

                      leadingFotoKegiatan = const Icon(
                        CupertinoIcons.checkmark,
                        color: CupertinoColors.activeBlue,
                      );

                      subtitleFotoKegiatan = Text(state.foto.filename);
                    }

                    if (state is foto_state.Initial) {
                      _fotoController.text = '';
                      _fileNameController.text = '';

                      leadingFotoKegiatan = const Text('');

                      subtitleFotoKegiatan =
                          const Text('Foto kegiatan belum dipilih.');
                    }

                    return CupertinoListTile(
                      title: const Text('Foto Kegiatan'),
                      leading: leadingFotoKegiatan,
                      subtitle: subtitleFotoKegiatan,
                      trailing: BlocBuilder<PermissionBloc, PermissionState>(
                        builder: (context, state) {
                          late bool bypassPermission = false;

                          if (state is PermissionLoaded) {
                            state.permission?.forEach((val) {
                              if (val.accessKode ==
                                  utils.bypassAktivitasAccessCode) {
                                bypassPermission = true;
                              }
                            });
                          }

                          if (state is Permitted) {
                            state.permission?.forEach((val) {
                              if (val.accessKode ==
                                  utils.bypassAktivitasAccessCode) {
                                bypassPermission = true;
                              }
                            });
                          }

                          return GestureDetector(
                            onTap: () => pickFoto(context, bypassPermission),
                            child: const Row(
                              children: [
                                Text(
                                  'Pilih',
                                  style: TextStyle(
                                      color: CupertinoColors.activeBlue),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: CupertinoColors.activeBlue,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'KETERANGAN',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextField(
                    controller: _keteranganController,
                    minLines: 5,
                    maxLines: null,
                    focusNode: _keteranganFocus,
                    onTapOutside: (event) {
                      _keteranganFocus.unfocus();
                    },
                    onChanged: (val) {
                      context.read<AktivitasValidationBloc>().add(
                            AktivitasValidationEvent.validate(
                              _nipController,
                              _atasanController,
                              _tanggalController,
                              _coreValueController,
                              _kegiatanController,
                              _fotoController,
                              _fileNameController,
                              _keteranganController,
                            ),
                          );
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText:
                          'Penjelasan singkat tentang kegiatan yang dilakukan.',
                    ),
                  ),
                ),
              ],
            ),
            BlocConsumer<AktivitasValidationBloc,
                aktivitas_validation_state.AktivitasValidationState>(
              builder: (context, state) {
                late Color buttonColor = Colors.grey;
                late Function() onPressed = () {};

                if (state is aktivitas_validation_state.Validation) {
                  if (state.success) {
                    buttonColor = Colors.blue.shade900;
                    onPressed = () {
                      context.read<AktivitasValidationBloc>().add(
                            AktivitasValidationEvent.send(state.aktivitas),
                          );
                    };
                  }
                }

                if (state is aktivitas_validation_state.SentError) {
                  buttonColor = Colors.blue.shade900;
                  onPressed = () {
                    context.read<AktivitasValidationBloc>().add(
                          AktivitasValidationEvent.send(state.aktivitas),
                        );
                  };
                }

                if (state is aktivitas_validation_state.Sending) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                      bottom: 32,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoActivityIndicator(),
                      ],
                    ),
                  );
                }

                if (state is aktivitas_validation_state.Sent) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                      bottom: 32,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: CupertinoColors.activeGreen,
                        ),
                        Text(
                          'berhasil',
                          style: TextStyle(color: CupertinoColors.activeGreen),
                        ),
                      ],
                    ),
                  );
                }

                return Container(
                  margin: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'SIMPAN',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                );
              },
              listener: (context, state) {
                if (state is aktivitas_validation_state.SentError) {
                  final snackBar = SnackBar(
                    content: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: CupertinoColors.white),
                    ),
                    backgroundColor: CupertinoColors.destructiveRed,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                if (state is aktivitas_validation_state.Sent) {
                  Future.delayed(const Duration(seconds: 2)).then((val) {
                    context.mounted ? Navigator.of(context).pop(true) : null;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
