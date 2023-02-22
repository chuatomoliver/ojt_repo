import 'package:flutter/material.dart';

class RegistrationWidgets {
  Widget label({required String text}) {
    return Text(text);
  }

  Widget textField(
      {required TextEditingController textEditingController,
      required String hint}) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value == null || value.isEmpty ? 'Please enter some text' : null,
    );
  }
}
