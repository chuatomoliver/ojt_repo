import 'package:audit_finance_app/dio/dio_requests.dart';
import 'package:audit_finance_app/firebase/firebase_crud.dart';
import 'package:audit_finance_app/models/journal.dart';
import 'package:audit_finance_app/screens/cplus_register.dart';
import 'package:audit_finance_app/screens/homepage.dart';
import 'package:audit_finance_app/widgets/login_widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

var userInfo;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            titleText(),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              //USERNAME GOES HERE
              child: textFormField(
                textEditingController: usernameController,
                hint: 'Enter your username',
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              //PASSWORD GOES HERE
              child: textFormField(
                textEditingController: passwordController,
                hint: 'Enter your password',
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: themedText(
                text: 'Having trouble signing in?',
                textDecor: TextDecoration.underline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              //LOGIN BUTTON
              child: filledButton(
                width: 200,
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                  // DioRequests()
                  //     .checkUserInfo(
                  //         usernameController.text, passwordController.text)
                  //     .then(
                  //   (value) {
                  //     if (value > 0) {
                  //       Navigator.pushAndRemoveUntil(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const Homepage(),
                  //         ),
                  //         ModalRoute.withName('/'),
                  //       );
                  //     } else {
                  //       print('NO DATA');
                  //     }
                  //   },
                  // );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              //REGISTER BUTTON
              child: SizedBox(
                width: 200,
                height: 50,
                child: filledButton(
                  width: 200,
                  text: 'Register',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
