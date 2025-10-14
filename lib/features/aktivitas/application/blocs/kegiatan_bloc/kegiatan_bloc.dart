import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/models/kegiatan_model/kegiatan_model.dart';
import 'package:super_app/features/aktivitas/application/services/aktivitas_service.dart';

import 'kegiatan_state.dart';

part 'kegiatan_event.dart';
part 'kegiatan_bloc.freezed.dart';

class KegiatanBloc extends Bloc<KegiatanEvent, KegiatanState> {
  KegiatanBloc() : super(Initial()) {
    on<KegiatanEvent>((event, emit) async {
      await switch (event) {
        _Initial() => _handleInitialEvent(emit),
        _Fetch() => _handleFetchEvent(event, emit),
        _Select() => _handleSelectEvent(event, emit),
        KegiatanEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleFetchEvent(event, emit) async {
    emit(Loading());
    try {
      final List<KegiatanModel> data = await getKegiatan(event.id);
      emit(Loaded(event.coreValue, data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      emit(Error('Terjadi kesalahan.'));
    }
  }

  Future<void> _handleSelectEvent(event, emit) async {
    emit(Selected(event.coreValue, event.kegiatan, event.listKegiatan));
  }

  Future<void> _handleInitialEvent(emit) async {
    emit(Initial());
  }
}
