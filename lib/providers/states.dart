import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class States extends ChangeNotifier {
  bool contactPermission = false;
  int screen = 0;

  File? imageShow;
  File? imageEntry;
  final imagePicker = ImagePicker();

  XFile? image;
  String path = '';

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

  Future<void> getImage(ImageSource imageSource) async {
    int x = 0;
    if (x == 0) {
      if (await permissionChecker(Permission.camera)) {
        x++;
      }
    }

    if (x < 2) {
      if (await permissionChecker(Permission.manageExternalStorage)) {
        x++;
      }
    }

    image = await imagePicker.pickImage(source: imageSource);
    const String folderName = "PROFILE IMAGES";
    final dir = Directory('/storage/emulated/0/$folderName');

    if (image == null) return;

    String fileName = basenameWithoutExtension(image!.path);
    if (!(await dir.exists())) {
      dir.create();
    }
    path = join(dir.path, fileName);
  }

  Future<void> setProfileImage() async {
    await image!.saveTo('$path.png');
    imageShow = File('$path.png');
    image = null;
    notifyListeners();
  }
}
