import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/features/aktivitas/application/models/foto_model/foto_model.dart';
import 'package:super_app/features/aktivitas/application/services/aktivitas_service.dart';
import 'foto_state.dart';

part 'foto_event.dart';
part 'foto_bloc.freezed.dart';

class FotoBloc extends Bloc<FotoEvent, FotoState> {
  FotoBloc() : super(Initial()) {
    on<FotoEvent>((event, emit) async {
      await switch (event) {
        _Initial() => _handleInitialFotoEvent(event, emit),
        _PickFoto() => _handlePickFotoEvent(event, emit),
        FotoEvent() => throw UnimplementedError(),
      };
    });
  }

  Future<void> _handleInitialFotoEvent(event, emit) async {
    emit(Initial());
  }

  Future<void> _handlePickFotoEvent(event, emit) async {
    emit(Loading());
    try {
      final FotoModel file = await pickImage(event.bypassPermission, event.context);
      emit(Selected(file));
    } catch (e) {
      emit(Error('Gagal memilih foto'));
    }
  }
}
