import 'package:audit_finance_app/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

Widget diaryTextField({required String label}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        labelText: label,
        fillColor: Colors.black.withOpacity(0.1),
      ),
    ),
  );
}

Widget sizedBoxSpacer({required double height}) {
  return SizedBox(
    height: height,
  );
}
