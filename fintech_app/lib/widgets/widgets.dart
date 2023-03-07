import 'package:flutter/material.dart';

Widget textField({
  required String label,
  required bool obscureText,
}) {
  return TextFormField();
}

Widget titleText({
  required String text,
  required Color color,
  required FontWeight weight,
}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Visby',
      fontSize: 32,
      fontWeight: weight,
      height: 1.25,
      color: color,
    ),
  );
}

Widget textFormField({
  //required TextEditingController textEditingController,
  required String label,
  required IconData icon,
}) {
  return TextFormField(
    //controller: textEditingController,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      labelText: label,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) =>
        value == null || value.isEmpty ? 'Please enter some text' : null,
  );
}
