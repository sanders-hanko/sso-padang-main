import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/core/auth/blocs/permission_state.dart';
import 'package:super_app/features/surat/application/blocs/surat_bloc/surat_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/surat/application/blocs/surat_bloc/surat_state.dart';
import 'package:super_app/features/surat/application/models/list_surat_model/list_surat_model.dart';
import 'package:super_app/features/surat/application/variable.dart';
import 'package:super_app/features/surat/pages/surat_masuk_create.dart';
import 'package:super_app/features/surat/pages/widgets/page_empty.dart';
import 'package:super_app/features/surat/pages/widgets/page_list.dart';
import 'package:super_app/features/surat/pages/widgets/page_loading.dart';
import 'package:super_app/features/surat/pages/widgets/surat_app_bar.dart';

class SuratMasuk extends StatefulWidget {
  const SuratMasuk({super.key});

  @override
  State<SuratMasuk> createState() => StateSuratMasuk();
}

class StateSuratMasuk extends State<SuratMasuk> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  static const FlutterSecureStorage storage = FlutterSecureStorage();
  late List<Widget> listData = [];
  late List<ListSuratModel> surat = [];
  late bool disposisiAccess = false;
  final Utils utils = Utils();
  late String userNip = '';
  late bool inputAccess = false;
  late String jenisKepegawaian = '';
  List<String> filtered = [filters.first];

  Future<void> refresh(BuildContext context) async {
    context.read<SuratBloc>().add(const SuratEvent.fetch());
  }

  Future<void> addNewItem(ListSuratModel response) async {
    await Future.delayed(const Duration(milliseconds: 1200));
    surat.insert(0, response);
    _listKey.currentState
        ?.insertItem(0, duration: const Duration(milliseconds: 180));
  }

  Future<void> setAccessCode() async {
    final state = context.read<PermissionBloc>().state;

    if (state is Permitted) {
      for (var permission in state.permission!) {
        if (permission.accessKode.contains(utils.disposisiSuratAccessCode)) {
          disposisiAccess = true;
        }
      }
    }

    if (state is Permitted) {
      for (var permission in state.permission!) {
        if (permission.accessKode.contains(utils.inputSuratAccessCode)) {
          inputAccess = true;
        }
      }
    }

    setState(() {});
  }

  void setUserNip() async {
    final userStorage = await storage.read(key: 'user');
    final user = jsonDecode(userStorage!);
    userNip = jenisKepegawaian == 'asn' ? user['nip'] : user['USERNAME'];
  }

  void initSuratState() {
    context.read<SuratBloc>().add(const SuratEvent.initial());
  }

  Future<void> fetchPermission() async {
    final storageJenisKepegawaian = await storage.read(key: 'jenisKepegawaian');
    setState(
      () {
        jenisKepegawaian = storageJenisKepegawaian!;
        if (jenisKepegawaian == "nonasn") {
          context.read<PermissionBloc>().add(const PermissionEvent.fetch());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initSuratState();
    refresh(context);
    fetchPermission();
    setUserNip();
    setAccessCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: inputAccess
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final response =
                        await Navigator.of(context, rootNavigator: true).push(
                      CupertinoPageRoute(
                        builder: (context) {
                          return const SuratMasukCreate();
                        },
                      ),
                    );

                    response != null
                        ? (context.mounted ? addNewItem(response) : null)
                        : null;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                const SizedBox(
                  width: 32.0,
                ),
              ],
            )
          : BlocBuilder<PermissionBloc, PermissionState>(
              builder: (context, state) {
              if (state is PermissionLoaded) {
                for (var permission in state.permission!) {
                  if (permission.accessKode
                      .contains(utils.disposisiSuratAccessCode)) {
                    disposisiAccess = true;
                  }
                }
              }

              if (state is PermissionLoaded) {
                for (var permission in state.permission!) {
                  if (permission.accessKode
                      .contains(utils.inputSuratAccessCode)) {
                    inputAccess = true;
                  }
                }
              }

              if (state is Permitted) {
                for (var permission in state.permission!) {
                  if (permission.accessKode
                      .contains(utils.disposisiSuratAccessCode)) {
                    disposisiAccess = true;
                  }
                }
              }

              if (state is Permitted) {
                for (var permission in state.permission!) {
                  if (permission.accessKode
                      .contains(utils.inputSuratAccessCode)) {
                    inputAccess = true;
                  }
                }
              }

              if (inputAccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final response =
                            await Navigator.of(context, rootNavigator: true)
                                .push(
                          CupertinoPageRoute(
                            builder: (context) {
                              return const SuratMasukCreate();
                            },
                          ),
                        );

                        response != null
                            ? (context.mounted ? addNewItem(response) : null)
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.blue.shade800,
                        foregroundColor: Colors.white,
                      ),
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                    const SizedBox(
                      width: 32.0,
                    ),
                  ],
                );
              }

              return SizedBox.shrink();
            }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: suratAppBar(context, jenisKepegawaian),
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<SuratBloc, SuratState>(
          builder: (context, state) {
            late Widget data;
            switch (state) {
              case Initial():
                data = const PageLoading();
                surat.clear();
                break;
              case Loading():
                data = const PageLoading();
                surat.clear();
                break;
              case Loaded():
                for (int i = 0; i < state.listSurat.length; i++) {
                  if (surat.isEmpty ||
                      surat
                          .where((val) => val.id == state.listSurat[i].id)
                          .isEmpty) {
                    surat.add(state.listSurat[i]);
                    _listKey.currentState?.insertItem(
                      i,
                      duration: const Duration(milliseconds: 500),
                    );
                  }
                }

                if (surat.isNotEmpty) {
                  data = AnimatedList(
                      key: _listKey,
                      initialItemCount: surat.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                        Animation<double> animation,
                      ) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: PageList(
                            surat: surat[index],
                            disposisiAccess: disposisiAccess,
                            username: userNip,
                            context: context,
                          ),
                        );
                      });
                } else {
                  data = const PageEmpty();
                }
                break;
              case Error():
                data = const PageEmpty();
                break;
            }

            return RefreshIndicator(
              onRefresh: () async => {refresh(context)},
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      // padding: const EdgeInsets.only(top: 48.0),
                      child: data,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
