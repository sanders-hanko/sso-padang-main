import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/models/core_value_model/core_value_model.dart';
import 'package:super_app/features/aktivitas/application/services/aktivitas_service.dart';

import 'core_value_state.dart';

part 'core_value_event.dart';
part 'core_value_bloc.freezed.dart';

class CoreValueBloc extends Bloc<CoreValueEvent, CoreValueState> {
  CoreValueBloc() : super(Initial()) {
    on<CoreValueEvent>((event, emit) async {
      await switch (event) {
        _Fetch() => _handleFetchEvent(event, emit),
        _Select() => _handleSelectEvent(event, emit),
        CoreValueEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleFetchEvent(event, emit) async {
    emit(Loading());
    try {
      final List<CoreValueModel> data = await getCoreValue();
      emit(Loaded(data));
    } on DioException catch(e) {
      if (kDebugMode) {
        print(e.message);
      }
      emit(Error('Terjadi kesalahan.'));
    }
  }

  Future<void> _handleSelectEvent(event, emit) async {
    emit(Selected(event.coreValue, event.listCoreValue));
  }
}
