import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/core/repositories/surat_repository.dart';
import 'package:super_app/features/surat/application/blocs/surat_bloc/surat_state.dart';
import 'package:super_app/features/surat/application/models/list_surat_model/list_surat_model.dart';

part 'surat_event.dart';
part 'surat_bloc.freezed.dart';

class SuratBloc extends Bloc<SuratEvent, SuratState> {
  final SuratRepository suratRepository;

  late List<ListSuratModel> previousListSurat = [];

  SuratBloc(this.suratRepository) : super(Initial()) {
    on<SuratEvent>(
      (event, emit) async {
        await switch (event) {
          _Initial() => _handleInitialEvent(emit),
          _Fetch() => _handleFetchEvent(emit),
          SuratEvent() => throw UnimplementedError(),
        };
      },
    );
  }

  Future<void> _handleInitialEvent(Emitter<SuratState> emit) async {
    emit(Initial());
  }

  Future<void> _handleFetchEvent(Emitter<SuratState> emit) async {
    emit(Loading());
    previousListSurat.clear();
    try {

      final List<dynamic> surat = await suratRepository.fetchSurat();

      emit(Loaded(surat));
    } on DioException catch (e) {
      emit(Error('Terjadi Kesalahan.'));
    }
  }
}
