import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/core/repositories/surat_repository.dart';
import 'package:super_app/features/surat/application/services/surat_service.dart';

import 'disposisi_state.dart';

part 'disposisi_event.dart';
part 'disposisi_bloc.freezed.dart';

class DisposisiBloc extends Bloc<DisposisiEvent, DisposisiState> {
  final SuratRepository suratRepository;

  DisposisiBloc(this.suratRepository) : super(Initial()) {
    on<DisposisiEvent>(
      (event, emit) async {
        await switch (event) {
          _Fetch() => _handleFetchEvent(event, emit),
          _Send() => _handleSendEvent(event, emit),
          DisposisiEvent() => throw UnimplementedError(),
        };
      },
    );
  }

  Future<void> _handleFetchEvent(dynamic event, emit) async {
    emit(Loading());
    try {
      final Map<String, dynamic> data =
          await suratRepository.fetchDisposisiBerikutnya(event.id);
      emit(Loaded(data));
    } on DioException catch (e) {
      emit(Error(e.response.toString()));
    }
  }

  Future<void> _handleSendEvent(dynamic event, dynamic emit) async {
    emit(Sending());
    try {
      await kirimDisposisi(
        event.suratId,
        event.fromNip,
        event.telitiSaran,
        event.toNip,
      );

      emit(Sent());
    } on DioException catch (e) {
      emit(SendError(e.response?.data['message']));
    }
  }
}
