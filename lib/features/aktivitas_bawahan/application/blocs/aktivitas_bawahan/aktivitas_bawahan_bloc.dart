import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/aktivitas_bawahan_service.dart';
import 'aktivitas_bawahan_state.dart';

part 'aktivitas_bawahan_event.dart';
part 'aktivitas_bawahan_bloc.freezed.dart';

class AktivitasBawahanBloc
    extends Bloc<AktivitasBawahanEvent, AktivitasBawahanState> {
  AktivitasBawahanBloc() : super(Initial()) {
    on<AktivitasBawahanEvent>((event, emit) async {
      await switch (event) {
        _Fetch() => _handleFetchEvent(event, emit),
        AktivitasBawahanEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleFetchEvent(event, emit) async {
    emit(Loading());
    try {
      final response = await getListAktivitas(event.context);

      if (kDebugMode) {
        print('response: $response');
      }

      if (response.isNotEmpty) {
        emit(Loaded(response));
      } else {
        emit(Empty());
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Status code: ${e.response?.statusCode}');
        print('Error: ${e.response?.data}');
      }
      emit(Error('Terjadi kesalahan'));
    }
  }
}
