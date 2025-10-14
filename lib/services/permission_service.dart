import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:super_app/Utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  final Utils utils = Utils();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late PermissionStatus permissionStatus = PermissionStatus.denied;

  Future<void> getPermission(String jabatanId) async {
    final String server = utils.simpegIP;
    final String getAccessRights = utils.getAccessRights;

    final url = Uri.http(server, getAccessRights + jabatanId);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      jsonDecode(response.body).forEach((element) async {

        if (element['access_id'] == 1) {
          await storage.write(
            key: 'cutiPegawaiPermission',
            value: "${element['access_status']}",
          );
        }

        if (element['access_id'] == 2) {
          await storage.write(
            key: 'izinPegawaiPermission',
            value: "${element['access_status']}",
          );
        }

        if (element['access_id'] == 7) {
          await storage.write(
            key: 'aktivitasPermission',
            value: "${element['access_status']}",
          );
        }
      });
    }
  }

  Future<bool> checkPermission(String accessName) async {
    late bool isPermitted = false;
    final data = await storage.read(key: accessName);
    if (data != null && data == '1') {
      isPermitted = true;
    }
    return isPermitted;
  }

  Future<PermissionStatus> requestPermission(Permission permission) async {
    final PermissionStatus currentStatus =
    await permission.status;

    if(currentStatus == PermissionStatus.denied || currentStatus == PermissionStatus.permanentlyDenied){
      permissionStatus = await permission.request();
    }else{
      permissionStatus = PermissionStatus.granted;
    }

    return permissionStatus;
  }
}
