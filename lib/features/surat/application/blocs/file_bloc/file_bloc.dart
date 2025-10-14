import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/repositories/file_repository.dart';
import 'file_state.dart';

part 'file_event.dart';
part 'file_bloc.freezed.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final FileRepository fileRepository;

  FileBloc(this.fileRepository) : super(Initial()) {
    on<FileEvent>(
      (event, emit) async {
        await switch (event) {
          _PickFile() => _handlePickFile(emit),
          _Reset() => _handleReset(emit),
          FileEvent() => throw UnimplementedError(),
        };
      },
    );
  }

  Future<void> _handlePickFile(Emitter<FileState> emit) async {
    emit(Loading());
    try {
      final success = await fileRepository.pickFile();
      if (success?.paths.toString() == null) {
        emit(Error('File tidak dipilih.'));
      } else {
        emit(Loaded(success!));
      }
    } catch (e) {
      emit(Error('Terjadi Kesalahan.'));
    }
  }

  Future<void> _handleReset(Emitter<FileState> emit) async {
    emit(Initial());
  }
}
