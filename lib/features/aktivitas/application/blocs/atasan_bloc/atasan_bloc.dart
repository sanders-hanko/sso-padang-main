import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/models/atasan_model/atasan_model.dart';
import 'package:super_app/features/aktivitas/application/services/aktivitas_service.dart';
import 'atasan_state.dart';

part 'atasan_event.dart';
part 'atasan_bloc.freezed.dart';

class AtasanBloc extends Bloc<AtasanEvent, AtasanState> {
  AtasanBloc() : super(Initial()) {
    on<AtasanEvent>((event, emit) async {
      await switch (event) {
        _Fetch() => _handleFetchEvent(event, emit),
        _Select() => _handleSelectEvent(event, emit),
        AtasanEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleFetchEvent(event, emit) async {
    emit(Loading());
    try {
      final List<AtasanModel> data = await getAtasan();
      emit(Loaded(data));
    } on DioException {
      emit(Error('Terjadi kesalahan.'));
    }
  }

  Future<void> _handleSelectEvent(event, emit) async {
    emit(Selected(event.atasan, event.listAtasan));
  }
}
