import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/blocs/bulan_blocs/bulan_state.dart';
import '../../services/aktivitas_service.dart';

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
    try {
      final Map<String, dynamic> data = await defaultBulan();
      emit(Selected(data['bulan'], data['namaBulan'], data['tahun']));
    } catch (e) {
      emit(Error('Terjadi Kesalahan'));
    }
  }

  Future<void> _handleSelectEvent(event, emit) async {
    try {
      if (kDebugMode) {
        print('setTanggal');
        print(event.index);
      }
      final Map<String, dynamic> data = await setTanggal(event.index);
      emit(Selected(data['bulan'], data['namaBulan'], data['tahun']));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
