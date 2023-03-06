import 'package:flutter/material.dart';

Widget textFormField({
  required TextEditingController textEditingController,
  required String hint,
  required bool obscureText,
}) {
  return TextFormField(
    obscureText: obscureText,
    controller: textEditingController,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.black.withOpacity(0.1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      hintText: hint,
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

Widget filledButton({
  required String text,
  required void Function() onPressed,
  required double width,
}) {
  return FilledButton(
    style: FilledButton.styleFrom(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    onPressed: onPressed,
    child: Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightGreen,
            Colors.green,
          ],
        ),
      ),
      child: Container(
        height: 50,
        width: width,
        alignment: Alignment.center,
        child: Text(
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
          text,
        ),
      ),
    ),
  );
}

Widget titleText() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 42,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.lightGreen,
              Colors.green,
              //add more color here.
            ],
          ).createShader(
            const Rect.fromLTWH(
              0.0,
              0.0,
              400.0,
              100.0,
            ),
          ),
      ),
      text: 'Contacts+',
      children: const [
        TextSpan(
          text: '\nStay connected with ease.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

Widget themedText({required text, required TextDecoration textDecor}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 18,
      decoration: textDecor,
      foreground: Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.lightGreen,
            Colors.green,
            //add more color here.
          ],
        ).createShader(
          const Rect.fromLTWH(
            0.0,
            0.0,
            400.0,
            100.0,
          ),
        ),
    ),
  );
}
