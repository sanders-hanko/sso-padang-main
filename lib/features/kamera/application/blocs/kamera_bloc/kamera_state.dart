import 'package:camera/camera.dart';

class KameraState {}

class KameraInitial extends KameraState {}

class KameraLoaded extends KameraState {
  CameraController controller;
  KameraLoaded(this.controller);
}

class KameraError extends KameraState {
  final String message;
  KameraError(this.message);
}

class KameraPictureTaken extends KameraState {
  final XFile file;
  KameraPictureTaken(this.file);
}
