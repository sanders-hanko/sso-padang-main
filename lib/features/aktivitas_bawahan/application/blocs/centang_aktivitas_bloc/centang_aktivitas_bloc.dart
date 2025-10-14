import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas_bawahan/application/services/aktivitas_bawahan_service.dart';

import 'centang_aktivitas_state.dart';

part 'centang_aktivitas_event.dart';
part 'centang_aktivitas_bloc.freezed.dart';

class CentangAktivitasBloc
    extends Bloc<CentangAktivitasEvent, CentangAktivitasState> {
  CentangAktivitasBloc() : super(Initial()) {
    on<CentangAktivitasEvent>((event, emit) async {
      await switch (event) {
        _Started() => _handleStartedEvent(emit),
        _Selesai() => _handleSelesaiEvent(emit),
        _Select() => _handleSelectEvent(event, emit),
        _Sending() => _handleSendingEvent(event, emit),
        CentangAktivitasEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleStartedEvent(emit) async {
    emit(Selecting());
  }

  Future<void> _handleSelesaiEvent(emit) async {
    resetSelecting();
    emit(Done());
  }

  Future<void> _handleSelectEvent(event, emit) async {
    try {
      final List<String?> data = await addCheckedAktivitas(event.id.toString());
      if (kDebugMode) {
        print(data);
      }
      emit(Selected(event.nip, data));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<void> _handleSendingEvent(event, emit) async {
    emit(Sending());
    try {
      final bool status = await verifikasiAktivitas(
        event.nip,
        event.id,
        event.statusAktivitas,
      );

      if (status) {
        emit(Sent());
      } else {
        emit(Error('Permintaan gagal diproses'));
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response);
      }
      emit(Error(e.toString()));
    }
  }
}
