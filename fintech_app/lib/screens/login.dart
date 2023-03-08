import 'package:fintech_app/constants/colors.dart';
import 'package:fintech_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText(
            text: 'Sign in to',
            color: secondaryColor,
            weight: FontWeight.normal,
          ),
          titleText(
            text: 'PennyWise.',
            color: tertiaryColor,
            weight: FontWeight.bold,
          ),
          textFormField(
            label: 'Mobile number',
            icon: Icons.phone_android_rounded,
          ),
          filledButton(
            context: context,
            text: 'Login',
            onPressed: () {},
          ),
          Row(
            children: [
              smallText(
                text: 'Dont have an account?',
                onTap: () {},
                weight: FontWeight.normal,
                color: secondaryColor,
              ),
              smallText(
                text: ' Register.',
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
