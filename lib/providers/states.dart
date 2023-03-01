import 'dart:io';

import 'package:flutter/material.dart';

class States extends ChangeNotifier {
  File? image;
  bool contactPermission = false;
  int screen = 0;
}