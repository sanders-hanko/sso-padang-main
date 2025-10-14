import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app/core/auth/blocs/permission_state.dart';
import 'package:super_app/core/auth/models/permission_model.dart';
import 'package:super_app/core/auth/models/user_model.dart';
import 'package:super_app/core/auth/repositories/permission_repository.dart';
import 'package:super_app/main.dart';

part 'permission_event.dart';
part 'permission_bloc.freezed.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final PermissionRepository permissionRepository;
  final FlutterSecureStorage flutterSecureStorage;

  PermissionBloc(this.permissionRepository, this.flutterSecureStorage)
      : super(Forbidden()) {
    on<PermissionEvent>(
      (event, emit) async {
        await switch (event) {
          _Fetch() => _handleFetchEvent(event, emit),
          _Read() => _handleReadEvent(event, emit),
          _Reset() => _handleResetEvent(event, emit),
          PermissionEvent() => throw UnimplementedError(),
        };
      },
    );
  }

  Future<void> _handleFetchEvent(PermissionEvent event, emit) async {
    try {
      final List<PermissionModel>? permission =
          await permissionRepository.fetch();
      emit(PermissionLoaded(permission));
    } on DioException catch (e) {
      debugPrint(e.toString());
      emit(PermissionLoadError('Beberapa data gagal dimuat.'));
    }
  }

  Future<void> _handleReadEvent(PermissionEvent event, emit) async {
    try {
      late List<PermissionModel> permission = [];
      final String? permissionData = await storage.read(key: 'permissions');

      final decodedPermission = jsonDecode(permissionData!);

      for (var val in decodedPermission) {
        permission.add(PermissionModel.fromJson(val));
      }

      final user = await storage.read(key: 'user');
      final nip = jsonDecode(user!)['nip'];
      final String nama = jsonDecode(user)['nama'];
      final String jabatanId = jsonDecode(user)['jabatanId'];
      final String jabatanNama = jsonDecode(user)['jabatan'];
      final String unorIndukId = jsonDecode(user)['unorIndukId'];
      final UserModel userModel = UserModel.fromJson({
        'nip': nip,
        'nama': nama,
        'jabatanId': jabatanId,
        'jabatanNama': jabatanNama,
        'unorIndukId': unorIndukId,
      });
      emit(Permitted(permission, userModel));
    } catch (e) {
      emit(Forbidden());
    }
  }

  Future<void> _handleResetEvent(PermissionEvent event, emit) async {
    emit(Forbidden());
  }
}
