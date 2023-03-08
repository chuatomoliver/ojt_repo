import 'package:fintech_app/constants/colors.dart';
import 'package:flutter/material.dart';

Widget columnSpacer({required BuildContext context, required double height}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * height,
  );
}

Widget rowSpacer({required BuildContext context, required double width}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
  );
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
      height: 1,
      color: color,
    ),
  );
}

OutlineInputBorder textformBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: const BorderSide(
      color: Colors.transparent,
      width: 0.0,
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
      fillColor: Colors.grey[200],
      border: textformBorder(),
      enabledBorder: textformBorder(),
      focusedBorder: textformBorder(),
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

Widget filledButton({
  required String text,
  required void Function() onPressed,
  required BuildContext context,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .06,
    width: MediaQuery.of(context).size.width * .6,
    child: FilledButton(
      onPressed: () => onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: tertiaryColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Visby',
          fontSize: 20,
        ),
      ),
    ),
  );
}

Widget smallText({
  required Color color,
  required String text,
  required void Function() onTap,
  required FontWeight weight,
}) {
  return GestureDetector(
    onTap: () => onTap,
    child: Text(
      text,
      style: TextStyle(
        fontWeight: weight,
        color: color,
        fontFamily: 'Visby',
      ),
    ),
  );
}

Widget dashboardCard({
  required String text,
  required IconData icon,
  required BuildContext context,
  required void Function() onPressed,
}) {
  return SizedBox(
    height: 160,
    width: 160,
    child: FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: const BorderSide(
            width: 4,
            color: secondaryColor,
            style: BorderStyle.solid,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: secondaryColor,
            size: 32,
          ),
          columnSpacer(
            context: context,
            height: .02,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Visby',
              fontSize: 18,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget bottomContainer() {
  return Container(
    decoration: const BoxDecoration(
      color: primaryColor,
    ),
    height: 500,
    width: 500,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText(
          text: 'Transactions',
          color: secondaryColor,
          weight: FontWeight.bold,
        ),
      ],
    ),
  );
}
