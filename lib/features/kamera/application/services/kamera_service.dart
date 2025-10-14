import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/features/kamera/application/blocs/kamera_bloc/kamera_bloc.dart';

Future<void> init(context) async {
  context.read<KameraBloc>().add(const KameraEvent.initial());
}

Future<void> load(BuildContext context) async {
  CameraController controller = await initCamera();
  context.mounted
      ? context.read<KameraBloc>().add(KameraEvent.load(controller))
      : null;
}

Future<void> switchCameraEvent(
  BuildContext context,
  CameraController controller,
) async {
  context.read<KameraBloc>().add(KameraEvent.switchCamera(controller));
}

Future<CameraController> initCamera() async {
  late CameraController controller;
  await availableCameras().then(
    (cameras) {
      final CameraDescription cameraDescription = cameras
          .where((camera) => camera.lensDirection == CameraLensDirection.front)
          .toList()
          .first;

      controller = CameraController(
        cameraDescription,
        ResolutionPreset.medium,
        enableAudio: false,
      );
    },
  );

  return controller;
}

Future<CameraController> switchCamera(CameraController controller) async {
  late CameraController cameraController;
  if (controller.description.lensDirection == CameraLensDirection.front) {
    await availableCameras().then(
      (cameras) {
        final CameraDescription cameraDescription = cameras
            .where((camera) => camera.lensDirection == CameraLensDirection.back)
            .toList()
            .first;

        cameraController = CameraController(
          cameraDescription,
          ResolutionPreset.medium,
          enableAudio: false,
        );
      },
    );
  } else {
    await availableCameras().then(
      (cameras) {
        final CameraDescription cameraDescription = cameras
            .where(
                (camera) => camera.lensDirection == CameraLensDirection.front)
            .toList()
            .first;

        cameraController = CameraController(
          cameraDescription,
          ResolutionPreset.medium,
          enableAudio: false,
        );
      },
    );
  }

  return cameraController;
}

Future<XFile> takePicture(CameraController controller) async {
  late XFile file;
  file = await controller.takePicture();
  return file;
}
