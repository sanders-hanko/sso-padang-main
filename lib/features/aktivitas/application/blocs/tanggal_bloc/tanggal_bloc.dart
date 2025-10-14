import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/blocs/tanggal_bloc/tanggal_state.dart';
import 'package:super_app/features/aktivitas/application/models/tanggal_model/tanggal_model.dart';

import '../../services/aktivitas_service.dart';

part 'tanggal_event.dart';
part 'tanggal_bloc.freezed.dart';

class TanggalBloc extends Bloc<TanggalEvent, TanggalState> {
  TanggalBloc() : super(Initial()) {
    on<TanggalEvent>((event, emit) async {
      await switch (event) {
        _SetDefault() => _handleSetDefaultEvent(event, emit),
        _Select() => _handleSelectEvent(event, emit),
        TanggalEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleSetDefaultEvent(event, emit) async {
    try {
      final TanggalModel? data = await defaultTanggal();
      emit(
        TanggalDefault(
          data!.tahun,
          data.bulan,
          data.namaBulan,
          data.tanggal,
          data.listTanggal,
        ),
      );
    } catch (e) {
      emit(Error('Terjadi Kesalahan'));
    }
  }

  Future<void> _handleSelectEvent(event, emit) async {
    try {
      final String? tanggal = event.tanggal;
      late TanggalModel? data;

      if (tanggal != null) {
        data = await setListTanggal(
          int.parse(event.tahun),
          int.parse(event.bulan),
          int.parse(event.tanggal),
        );
      } else {
        data = await setListTanggal(
          int.parse(event.tahun),
          int.parse(event.bulan),
          null,
        );
      }

      emit(
        Selected(
          data!.tahun,
          data.bulan,
          data.namaBulan,
          data.tanggal,
          data.listTanggal,
        ),
      );
    } catch (e) {
      emit(Error('Terjadi Kesalahan'));
    }
  }
}
