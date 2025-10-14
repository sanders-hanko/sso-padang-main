import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/etpp/application/models/etpp_model.dart';
import 'package:super_app/features/etpp/application/services/etpp_service.dart';

import 'etpp_state.dart';

part 'etpp_event.dart';
part 'etpp_bloc.freezed.dart';

class EtppBloc extends Bloc<EtppEvent, EtppState> {
  EtppBloc() : super(Initial()) {
    on<EtppEvent>((event, emit) async {
      await switch (event) {
        _Fetch() => _handleFetchEvent(event, emit),
        EtppEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleFetchEvent(event, emit) async {
    emit(Loading());
    try {
      final EtppModel data = await fetchData(event.tahun, event.bulan);
      emit(Loaded(data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response!.data);
      }
      emit(Error(e.response!.data['message']));
    }
  }
}
