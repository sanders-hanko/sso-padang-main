import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/core/repositories/asisten_repository.dart';
import 'package:super_app/core/repositories/organisasi_repository.dart';
import 'package:super_app/core/repositories/surat_repository.dart';
import 'package:super_app/features/surat/application/models/asisten_model/asisten_model.dart';
import 'package:super_app/features/surat/application/models/form_surat_model/form_surat_model.dart';
import 'package:super_app/features/surat/application/models/list_surat_model/list_surat_model.dart';
import 'package:super_app/features/surat/application/models/organisasi_model/organisasi_model.dart';
import 'form_input_state.dart';
part 'form_input_event.dart';
part 'form_input_bloc.freezed.dart';

class FormInputBloc extends Bloc<FormInputEvent, FormInputState> {
  //repositori
  final SuratRepository suratRepository;
  final OrganisasiRepository organisasiRepository;
  final AsistenRepository asistenRepository;

  //cache data
  late List<OrganisasiModel?> previousDataOrganisasi = [];
  late List<AsistenModel?> previousDataAsisten = [];

  //cache pilihan user
  late List<OrganisasiModel> previousSelectedDari = [];
  late List<OrganisasiModel?> previousSelectedTujuan = [];
  late List<AsistenModel?> previousSelectedAsisten = [];

  FormInputBloc(
    this.suratRepository,
    this.organisasiRepository,
    this.asistenRepository,
  ) : super(Initial()) {
    on<_FetchOrganisasi>(_handleFetchOrganisasiEvent);
    on<_FetchAsisten>(_handleFetchAsistenEvent);
    on<_SelectOrganisasi>(_handleSelectOrganisasiEvent);
    on<_SelectAsisten>(_handleSelectAsistenEvent);
    on<_Send>(_handleSendEvent);
    on<_Reset>(_handleResetEvent);
  }

  _handleFetchOrganisasiEvent(event, emit) async {
    emit(Loading(event.label));

    try {
      if (previousDataOrganisasi.isEmpty) {
        final List<OrganisasiModel> organisasi =
            await organisasiRepository.getAll();
        if (organisasi.isEmpty) {
          emit(NotFound());
        } else {
          previousDataOrganisasi = organisasi;
          emit(
            Loaded(
              organisasi,
              [],
              previousSelectedDari.isNotEmpty ? previousSelectedDari[0] : null,
              previousSelectedTujuan,
              previousSelectedAsisten.isNotEmpty
                  ? previousSelectedAsisten[0]
                  : null,
              event.label,
            ),
          );
        }
      } else {
        final organisasi = previousDataOrganisasi;
        if (organisasi.isEmpty) {
          emit(NotFound());
        } else {
          emit(
            Loaded(
              organisasi,
              [],
              previousSelectedDari.isNotEmpty ? previousSelectedDari[0] : null,
              previousSelectedTujuan,
              previousSelectedAsisten.isNotEmpty
                  ? previousSelectedAsisten[0]
                  : null,
              event.label,
            ),
          );
        }
      }
    } catch (e) {
      emit(Error('Terjadi Kesalahan'));
    }
  }

  _handleFetchAsistenEvent(event, emit) async {
    emit(Loading(event.label));
    try {
      if (previousDataAsisten.isEmpty) {
        final asisten = await asistenRepository.getAll();

        if (asisten.isEmpty) {
          emit(NotFound());
        } else {
          previousDataAsisten = asisten;
          emit(
            Loaded(
              [],
              asisten,
              previousSelectedDari.isNotEmpty ? previousSelectedDari[0] : null,
              previousSelectedTujuan,
              previousSelectedAsisten.isNotEmpty
                  ? previousSelectedAsisten[0]
                  : null,
              event.label,
            ),
          );
        }
      } else {
        final asisten = previousDataAsisten;
        if (asisten.isEmpty) {
          emit(NotFound());
        } else {
          emit(
            Loaded(
              [],
              asisten,
              previousSelectedDari.isNotEmpty ? previousSelectedDari[0] : null,
              previousSelectedTujuan,
              previousSelectedAsisten.isNotEmpty
                  ? previousSelectedAsisten[0]
                  : null,
              event.label,
            ),
          );
        }
      }
    } catch (e) {
      emit(Error('Terjadi Kesalahan'));
    }
  }

  _handleSelectOrganisasiEvent(event, emit) async {
    final OrganisasiModel organisasi = OrganisasiModel(
      id: event.id,
      namaOrganisasi: event.organisasi,
      type: event.selectedLabel,
    );

    if (event.selectedLabel == 'Dari') {
      if (previousSelectedDari.contains(organisasi)) {
        previousSelectedDari = [];
      } else {
        previousSelectedDari = [organisasi];
      }
    }

    if (event.selectedLabel == 'Tujuan') {
      if (previousSelectedTujuan
          .where((val) => val?.id == organisasi.id)
          .isEmpty) {
        previousSelectedTujuan.add(organisasi);
      } else {
        previousSelectedTujuan.remove(organisasi);
      }
    }

    emit(
      Selected(
        previousDataOrganisasi,
        previousDataAsisten,
        previousSelectedDari.isNotEmpty ? previousSelectedDari[0] : null,
        previousSelectedTujuan,
        previousSelectedAsisten.isNotEmpty ? previousSelectedAsisten[0] : null,
        event.selectedLabel,
      ),
    );
  }

  _handleSelectAsistenEvent(event, emit) async {
    final AsistenModel asisten = AsistenModel(
      nip: event.nip,
      nama: event.nama,
      jabatan: event.jabatan,
    );

    if (previousSelectedAsisten.contains(asisten)) {
      previousSelectedAsisten = [];
    } else {
      previousSelectedAsisten = [asisten];
    }

    emit(Selected(
      previousDataOrganisasi,
      previousDataAsisten,
      previousSelectedDari.isNotEmpty ? previousSelectedDari[0] : null,
      previousSelectedTujuan,
      previousSelectedAsisten.isNotEmpty ? previousSelectedAsisten[0] : null,
      event.selectedLabel,
    ));
  }

  _handleResetEvent(event, emit) async {
    previousSelectedAsisten = [];
    previousSelectedDari = [];
    previousSelectedTujuan = [];
    previousDataOrganisasi = [];
    previousDataAsisten = [];
    emit(Initial());
  }

  _handleSendEvent(event, emit) async {
    emit(Sending());
    try {
      final ListSuratModel surat = await suratRepository.postSurat(event.surat);

      emit(Sent(surat));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response!.statusCode);
        print(e.response!.data);
      }
      emit(Error(e.response?.data['message']));
    }
  }
}
