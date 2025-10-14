import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/kamera/application/services/kamera_service.dart';

import 'kamera_state.dart';

part 'kamera_event.dart';
part 'kamera_bloc.freezed.dart';

class KameraBloc extends Bloc<KameraEvent, KameraState> {
  KameraBloc() : super(KameraInitial()) {
    on<KameraEvent>((event, emit) async {
      await switch (event) {
        _Initial() => _handleInitialEvent(event, emit),
        _Load() => _handleLoadEvent(event, emit),
        _SwitchCamera() => _handleSwitchCameraEvent(event, emit),
        _TakePicture() => _handleTakePictureEvent(event, emit),
        KameraEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleInitialEvent(event, emit) async {
    emit(KameraInitial());
  }

  Future<void> _handleLoadEvent(event, emit) async {
    emit(KameraInitial());
    try {
      await event.controller.initialize();
      emit(KameraLoaded(event.controller));
    } catch (e) {
      emit(KameraError('Gagal memuat kamera'));
    }
  }

  Future<void> _handleSwitchCameraEvent(event, emit) async {
    emit(KameraInitial());
    try {
      final CameraController controller = await switchCamera(event.controller);
      await controller.initialize();
      emit(KameraLoaded(controller));
    } catch (e) {
      emit(KameraError('Gagal memuat kamera'));
    }
  }

  Future<void> _handleTakePictureEvent(event, emit) async {
    try {
      final XFile file = await takePicture(event.controller);
      event.controller.dispose();
      emit(KameraPictureTaken(file));
    } catch (e) {
      emit(KameraError('Gagal mengambil gambar'));
    }
  }
}
