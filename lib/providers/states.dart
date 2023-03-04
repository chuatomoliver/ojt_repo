import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class States extends ChangeNotifier {
  File? image;
  bool contactPermission = false;
  int screen = 0;

  // Future<bool> permissionRequest(Permission permission) async {
  //   var status = await permission.request();

  //   if (status == PermissionStatus.denied) {
  //     return false;
  //   } else if (status == PermissionStatus.permanentlyDenied) {
  //     openAppSettings();
  //     return status.isGranted;
  //   } else {
  //     return true;
  //   }
  // }

  Future<bool> permissionChecker(Permission permission) async {
    if (await permission.status.isDenied) {
      var status = await permission.request();

      if (status == PermissionStatus.denied) {
        return false;
      } else {
        return true;
      }
    } else if (await permission.status.isPermanentlyDenied) {
      openAppSettings();
      return permission.status.isGranted;
    } else {
      return true;
    }
  }
}
