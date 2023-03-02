import 'dart:ui';

import 'package:audit_finance_app/screens/cplus_login.dart';
import 'package:audit_finance_app/screens/cplus_register.dart';
import 'package:audit_finance_app/screens/login.dart';
import 'package:audit_finance_app/screens/permissions.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.red,
              Colors.purple,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/white_icon.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Welcome to\n',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                  ),
                  children: [
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                      ),
                      text: 'Contacts+',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: 300,
                height: 50,
                child: Hero(
                  tag: 'transition-1',
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      int? x = preferences.getInt('perm');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              x == 3 ? const Login() : const Permissions(),
                        ),
                      );
                    },
                    //PROCEED TO PERMISSIONS
                    child: const Text(
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      'Proceed',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
