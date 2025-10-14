import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/models/aktivitas_model/aktivitas_model.dart';
import 'package:super_app/features/aktivitas/application/services/aktivitas_service.dart';

import 'aktivitas_validation_state.dart';

part 'aktivitas_validation_event.dart';
part 'aktivitas_validation_bloc.freezed.dart';

class AktivitasValidationBloc
    extends Bloc<AktivitasValidationEvent, AktivitasValidationState> {
  AktivitasValidationBloc() : super(Initial()) {
    on<AktivitasValidationEvent>((event, emit) async {
      await switch (event) {
        _Validate() => _handleValidateEvent(event, emit),
        _Send() => _handleSendEvent(event, emit),
        AktivitasValidationEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleValidateEvent(event, emit) async {
    try {
      late Map<String, dynamic> aktivitas;
      final bool validationStatus = await validate(
        event.atasanController,
        event.tanggalController,
        event.coreValueController,
        event.kegiatanController,
        event.fotoController,
        event.keteranganController,
      );

      if (validationStatus) {
        aktivitas = {
          'nip': event.nipController.text,
          'atasan': event.atasanController.text,
          'tanggal': event.tanggalController.text,
          'coreValue': event.coreValueController.text,
          'kegiatan': event.kegiatanController.text,
          'foto': event.fotoController.text,
          'filename': event.fileNameController.text,
          'keterangan': event.keteranganController.text,
        };
        emit(Validation(validationStatus, AktivitasModel.fromJson(aktivitas)));
      } else {
        emit(Error('Terjadi kesalahan.'));
      }
    } catch (e) {
      emit(Error('Terjadi kesalahan.'));
    }
  }

  Future<void> _handleSendEvent(event, emit) async {
    emit(Sending());
    try {
      final bool postStatus = await postAktivitas(event.aktivitas);
      if (postStatus) {
        emit(Sent());
      } else {
        emit(SentError('Gagal menyimpan aktivitas.', event.aktivitas));
      }
    } on DioException {
      emit(SentError('Gagal menyimpan aktivitas.', event.aktivitas));
    }
  }
}
