import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/services/aktivitas_service.dart';
import 'package:super_app/features/aktivitas_bawahan/application/models/bulan_model/bulan_model.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_state.dart';

part 'bulan_event.dart';
part 'bulan_bloc.freezed.dart';

class BulanBloc extends Bloc<BulanEvent, BulanState> {
  BulanBloc() : super(Initial()) {
    on<BulanEvent>((event, emit) async {
      await switch (event) {
        _Initial() => _handleInitialEvent(emit),
        _Select() => _handleSelectEvent(event, emit),
        BulanEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleInitialEvent(emit) async {
    final BulanModel bulan = BulanModel.fromJson(await defaultBulan());
    emit(Selected(bulan));
  }

  Future<void> _handleSelectEvent(event, emit) async {
    try {
      final Map<String, dynamic> data = await setTanggal(event.index);

      emit(Selected(BulanModel.fromJson(data)));
    } catch (e) {
      emit(Error('Terjadi kesalahan.'));
    }
  }
}
