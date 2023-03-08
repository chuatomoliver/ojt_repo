import 'package:fintech_app/constants/colors.dart';
import 'package:fintech_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText(
          text: 'Verification',
          color: secondaryColor,
          weight: FontWeight.normal,
        ),
        titleText(
          text: 'Code',
          color: secondaryColor,
          weight: FontWeight.bold,
        ),
        filledButton(
          text: 'text',
          onPressed: () {},
          context: context,
        ),
        smallText(
          color: secondaryColor,
          text: 'text',
          onTap: () {},
          weight: FontWeight.normal,
        ),
      ],
    ));
  }
}
