import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class States extends ChangeNotifier {
  File? image;
  bool contactPermission = false;
  int screen = 0;

  Future<bool> permissionRequest(Permission permission) async {
    var status = await permission.request();

    if (status == PermissionStatus.denied) {
      return false;
    } else if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
      return status.isGranted;
    } else {
      return true;
    }
  }
}
