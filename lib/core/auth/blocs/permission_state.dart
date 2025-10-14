import 'package:super_app/core/auth/models/permission_model.dart';
import 'package:super_app/core/auth/models/user_model.dart';

sealed class PermissionState {}

class Forbidden extends PermissionState {}

class Permitted extends PermissionState {
  final List<PermissionModel>? permission;
  final UserModel user;
  Permitted(this.permission, this.user);
}

class PermissionLoaded extends PermissionState {
  final List<PermissionModel>? permission;
  // final UserModel user;
  PermissionLoaded(this.permission);
}

class PermissionLoadError extends PermissionState {
  final String message;
  PermissionLoadError(this.message);
}
