import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/kamera/application/blocs/kamera_bloc/kamera_bloc.dart';
import 'package:super_app/features/kamera/application/blocs/kamera_bloc/kamera_state.dart';
import 'package:super_app/features/kamera/application/kamera_variables.dart';
import 'package:super_app/features/kamera/application/services/kamera_service.dart';

class Kamera extends StatefulWidget {
  const Kamera({super.key});

  @override
  State<Kamera> createState() => _KameraState();
}

class _KameraState extends State<Kamera> {
  @override
  void initState() {
    load(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        toolbarHeight: 0.0,
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * widthMultiplier,
        child: BlocConsumer<KameraBloc, KameraState>(
          builder: (context, state) {
            if (state is KameraLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: CupertinoColors.white, width: 3),
                      ),
                    ),
                    child: FloatingActionButton(
                      hoverElevation: 50.0,
                      backgroundColor: Colors.white,
                      hoverColor: Colors.white38,
                      shape: const CircleBorder(),
                      onPressed: () {
                        final state = context.read<KameraBloc>().state;

                        if (state is KameraLoaded) {
                          context.read<KameraBloc>().add(
                                KameraEvent.takePicture(state.controller),
                              );
                        }
                      },
                      child: const Icon(
                        CupertinoIcons.camera,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.05),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CupertinoColors.darkBackgroundGray),
                    child: IconButton(
                      onPressed: () {
                        final state = context.read<KameraBloc>().state;
                        if (state is KameraLoaded) {
                          switchCameraEvent(context, state.controller);
                        }
                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }

            if (state is KameraPictureTaken) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.darkBackgroundGray,
                    ),
                    child: IconButton(
                      onPressed: () {
                        load(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.xmark,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.darkBackgroundGray,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(state.file);
                      },
                      icon: const Icon(
                        CupertinoIcons.check_mark,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ],
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: CupertinoColors.white, width: 3),
                    ),
                  ),
                  child: FloatingActionButton(
                    hoverElevation: 50.0,
                    backgroundColor: Colors.white,
                    hoverColor: Colors.white38,
                    shape: const CircleBorder(),
                    onPressed: () {
                      final state = context.read<KameraBloc>().state;

                      if (state is KameraLoaded) {
                        context.read<KameraBloc>().add(
                              KameraEvent.takePicture(state.controller),
                            );
                      }
                    },
                    child: const Icon(
                      CupertinoIcons.camera,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CupertinoColors.darkBackgroundGray,
                  ),
                  child: IconButton(
                    onPressed: () {
                      final state = context.read<KameraBloc>().state;
                      if (state is KameraLoaded) {
                        switchCameraEvent(context, state.controller);
                      }
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_2_circlepath,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
          listener: (BuildContext context, KameraState state) {
            if (state is KameraLoaded) {
              setState(() {
                widthMultiplier = 0.536;
              });
            }

            if (state is KameraPictureTaken) {
              setState(() {
                widthMultiplier = 0.9;
              });
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: CupertinoColors.black,
      body: BlocBuilder<KameraBloc, KameraState>(
        builder: (context, state) {
          if (state is KameraLoaded) {
            state.controller.setFlashMode(FlashMode.off);

            return SafeArea(
              bottom: false,
              child: Container(
                decoration: const BoxDecoration(color: CupertinoColors.black),
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1,
                        ),
                        child: CameraPreview(state.controller)),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  state.controller.dispose();
                                  context.read<KameraBloc>().add(
                                        const KameraEvent.initial(),
                                      );
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor:
                                      CupertinoColors.darkBackgroundGray,
                                  foregroundColor: CupertinoColors.white,
                                ),
                                child: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is KameraPictureTaken) {
            return SafeArea(
              bottom: false,
              child: Container(
                decoration: const BoxDecoration(color: CupertinoColors.black),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1,
                      ),
                      child: Image.file(
                        File(state.file.path),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is KameraError) {
            return SafeArea(
              bottom: false,
              child: Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    color: CupertinoColors.white,
                  ),
                ),
              ),
            );
          }

          return const SafeArea(
            bottom: false,
            child: Center(
              child: CupertinoActivityIndicator(
                color: CupertinoColors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
