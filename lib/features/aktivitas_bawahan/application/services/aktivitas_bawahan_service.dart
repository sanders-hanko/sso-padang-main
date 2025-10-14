import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/auth/blocs/permission_bloc.dart';
import 'package:super_app/core/auth/blocs/permission_state.dart'
    as permission_state;
import 'package:super_app/features/aktivitas_bawahan/application/aktivitas_bawahan_variables.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/aktivitas_bawahan/aktivitas_bawahan_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/blocs/bulan_bloc/bulan_state.dart'
    as bulan_state;
import 'package:super_app/features/aktivitas_bawahan/application/blocs/centang_aktivitas_bloc/centang_aktivitas_bloc.dart';
import 'package:super_app/features/aktivitas_bawahan/application/models/list_nama_aktivitas_bawahan/list_nama_model.dart';
import 'package:super_app/core/global_variables.dart';

List<String?> aktivitasChecked = [];

Future<void> setDefaultBulan(BuildContext context) async {
  context.read<BulanBloc>().add(const BulanEvent.initial());
}

Future<void> startSelecting(BuildContext context) async {
  context
      .read<CentangAktivitasBloc>()
      .add(const CentangAktivitasEvent.started());
}

Future<void> resetSelecting() async {
  aktivitasChecked.clear();
}

Future<void> selecting(BuildContext context, String nip, int id) async {
  context
      .read<CentangAktivitasBloc>()
      .add(CentangAktivitasEvent.select(nip, id));
}

Future<void> sending(
    BuildContext context, String nip, List<String?> id, String status) async {
  context
      .read<CentangAktivitasBloc>()
      .add(CentangAktivitasEvent.sending(nip, id, status));
}

Future<void> selesaiSelecting(BuildContext context, int index) async {
  context
      .read<CentangAktivitasBloc>()
      .add(const CentangAktivitasEvent.selesai());
  context.read<BulanBloc>().add(BulanEvent.select(index));
}

Future<List<String?>> addCheckedAktivitas(String id) async {
  if (aktivitasChecked.contains(id)) {
    aktivitasChecked.removeWhere((val) => val == id);
  } else {
    aktivitasChecked.add(id);
  }

  return aktivitasChecked;
}

Future<bool> verifikasiAktivitas(
  String nip,
  List<String?> id,
  String status,
) async {
  returnStatus = false;
  FormData formData = FormData();
  formData.fields.add(MapEntry('nip', nip));
  formData.fields.add(MapEntry('status', status));
  for (var val in id) {
    formData.fields.add(MapEntry('id[]', val!));
  }

  final response = await dio.post(
    postVerifikasiAktivitas,
    data: formData,
    options: Options(
      headers: {
        'Secret-Key': secretKey,
      },
    ),
  );

  if (response.statusCode == HttpStatus.created) {
    returnStatus = true;
  }

  return returnStatus;
}

Future<void> initAktivitasBawahan(BuildContext context) async {
  context.read<AktivitasBawahanBloc>().add(
        AktivitasBawahanEvent.fetch(context),
      );
}

Future<List<ListNamaModel?>> getListAktivitas(BuildContext context) async {
  if (kDebugMode) {
    print('Requesting data.');
  }
  final permission_state.PermissionState permissionState =
      context.read<PermissionBloc>().state;
  final bulan_state.BulanState bulanState = context.read<BulanBloc>().state;
  late List<ListNamaModel?> listNamaBawahan = [];

  if (permissionState is permission_state.PermissionLoaded) {
    if (bulanState is bulan_state.Selected) {
      final String secretKey = utils.secretKey;
      final String path =
          utils.protokolHttps + utils.tppDomain + utils.getAktivitasAtasan;
      final String? user = await storage.read(key: 'user');
      final String nip = jsonDecode(user!)['nip'];
      final response = await dio.post(
        path,
        data: {
          'nip_atasan': nip,
          'tanggal': bulanState.bulan.tanggal,
        },
        options: Options(
          headers: {
            'Secret-Key': secretKey,
          },
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ),
      );

      response.data['data'].forEach(
        (val) {
          listNamaBawahan.add(
            ListNamaModel.fromJson(val),
          );
        },
      );
      return listNamaBawahan;
    }
  }

  if (permissionState is permission_state.Permitted) {
    if (bulanState is bulan_state.Selected) {
      final String secretKey = utils.secretKey;
      final String path =
          utils.protokolHttps + utils.tppDomain + utils.getAktivitasAtasan;

      final response = await dio.post(
        path,
        data: {
          'nip_atasan': permissionState.user.nip,
          'tanggal': bulanState.bulan.tanggal,
        },
        options: Options(
          headers: {
            'Secret-Key': secretKey,
          },
        ),
      );

      response.data['data'].forEach(
        (val) {
          listNamaBawahan.add(
            ListNamaModel.fromJson(val),
          );
        },
      );
      return listNamaBawahan;
    }
  }

  return [];
}
