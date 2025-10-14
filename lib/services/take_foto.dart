import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:super_app/pages/presensi/create_absen_diluar.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late CameraDescription _cameraDescription;
  late bool _cameraLoaded = false;

  Future<void> ambilFoto(
      BuildContext context, Function(XFile) onSuccess) async {
    final file = await takePicture();
    onSuccess(file!);
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initCamera() async {
    await availableCameras().then((cameras) {
      final camera = cameras
          .where((camera) => camera.lensDirection == CameraLensDirection.front)
          .toList()
          .first;

      setState(() {
        _cameraDescription = camera;

        _controller = CameraController(
          _cameraDescription,
          ResolutionPreset.medium,
          enableAudio: false,
        );

        _initializeControllerFuture = _controller.initialize();
        _cameraLoaded = true;
      });
    }).catchError((err) {
      if (kDebugMode) {
        print('err');
        print(err);
      }
    });
  }

  Future<XFile?> takePicture() async {
    if (_controller.value.isTakingPicture) {
      return null;
    }

    try {
      XFile file = await _controller.takePicture();
      return file;
    } on CameraException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        toolbarHeight: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        hoverElevation: 50.0,
        backgroundColor: Colors.white,
        hoverColor: Colors.white38,
        shape: const CircleBorder(),
        onPressed: () => ambilFoto(
          context,
          (file) async {
            final Map<String, dynamic> data = await Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) {
                  return CreateAbsenDiluar(path: file.path);
                },
              ),
            );

            if (context.mounted) Navigator.of(context).pop(data);
          },
        ),
        child: const Icon(
          Icons.camera_alt,
          color: Colors.black54,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _cameraLoaded
          ? SafeArea(
              bottom: false,
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Stack(
                        children: [
                          Center(
                            child: CameraPreview(_controller),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          backgroundColor:
                                              CupertinoColors.inactiveGray,
                                          foregroundColor:
                                              CupertinoColors.white,
                                        ),
                                        child: const Icon(Icons.close)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            ),
    );
  }
}
