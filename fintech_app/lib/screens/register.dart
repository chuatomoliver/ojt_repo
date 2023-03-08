import 'package:fintech_app/constants/colors.dart';
import 'package:fintech_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText(
            text: 'Create a new',
            color: secondaryColor,
            weight: FontWeight.normal,
          ),
          titleText(
            text: 'account',
            color: tertiaryColor,
            weight: FontWeight.normal,
          ),
          textFormField(
            label: 'Full name',
            icon: Icons.person,
          ),
          textFormField(
            label: 'Mobile number',
            icon: Icons.phone_android_rounded,
          ),
          filledButton(
            context: context,
            text: 'Create Account',
            onPressed: () {},
          ),
          Row(
            children: [
              smallText(
                text: 'Already have an account?',
                onTap: () {},
                weight: FontWeight.normal,
                color: secondaryColor,
              ),
              rowSpacer(
                width: 2,
              ),
              smallText(
                text: 'Login.',
                onTap: () {},
                weight: FontWeight.bold,
                color: tertiaryColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
