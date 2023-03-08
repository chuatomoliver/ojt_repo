import 'package:fintech_app/constants/colors.dart';
import 'package:fintech_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../constants/timer.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  int seconds = maxSeconds;

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
            color: tertiaryColor,
            weight: FontWeight.bold,
          ),
          smallText(
            color: secondaryColor,
            text: 'Verify your account by entering the 4-digit code we sent.',
            onTap: () {},
            weight: FontWeight.normal,
          ),
          Pinput(
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: const TextStyle(
                fontFamily: 'Visby',
                fontSize: 26,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          filledButton(
            text: 'Verify',
            onPressed: () {},
            context: context,
          ),
          Row(
            children: [
              smallText(
                color: secondaryColor,
                text: 'Resend code in $seconds',
                onTap: () {},
                weight: FontWeight.normal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
