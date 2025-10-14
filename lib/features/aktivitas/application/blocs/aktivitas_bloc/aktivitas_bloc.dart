import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/services/aktivitas_service.dart';
import 'aktivitas_state.dart';

part 'aktivitas_event.dart';
part 'aktivitas_bloc.freezed.dart';

class AktivitasBloc extends Bloc<AktivitasEvent, AktivitasState> {
  AktivitasBloc() : super(Initial()) {
    on<AktivitasEvent>((event, emit) async {
      await switch (event) {
        _Initial() => _handleInitialEvent(),
        _Fetch() => _handleFetchEvent(event, emit),
        AktivitasEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleInitialEvent() async {}

  Future<void> _handleFetchEvent(event, emit) async {
    emit(Loading());
    try {
      final Map<String, dynamic> aktivitas = await getAktivitas(
        event.nip,
        event.tanggal,
      );
      emit(Loaded(aktivitas['poin'], aktivitas['aktivitas']));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response);
      }
      emit(Error('Terjadi kesalahan.'));
    }
  }
}
