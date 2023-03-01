import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audit_finance_app/screens/homescreen.dart';
import 'package:audit_finance_app/screens/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/logo/audit_splash.png',
      nextScreen: const SignInPage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}