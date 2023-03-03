import 'dart:convert';

import 'package:audit_finance_app/models/user_information.dart';
import 'package:audit_finance_app/screens/cplus_register.dart';
import 'package:audit_finance_app/screens/homepage.dart';
import 'package:audit_finance_app/widgets/login_widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

var userInfo;

class _LoginState extends State<Login> {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost/api/v1/index.php',
    ),
  );
  Future<int?> checkUserInfo(String firstName, String lastName) async {
    final response = await dio.get(
      '/checkUserExist',
      queryParameters: {'first_name': firstName, 'last_name': lastName},
    );
    userInfo = UserInfo.fromJson(response.data);
    // debugPrint(userInfo.error.toString());

    return response.statusCode;
  }

  @override
  void initState() {
    // checkUserInfo('test', 'test');
    super.initState();
  }

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
                textEditingController: usernameController,
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
                text: 'Login',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                    ModalRoute.withName('/'),
                  );
                  // checkUserInfo('test', 'test');
                  // checkUserInfo(
                  //   usernameController.text,
                  //   passwordController.text,
                  // ).then(
                  //   (value) {
                  //     debugPrint(value.toString());
                  //     if (value == 200) {
                  //       if (!userInfo.error) {
                  //         Navigator.pushAndRemoveUntil(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const Homepage(),
                  //           ),
                  //           ModalRoute.withName('/'),
                  //         );
                  //       } else {
                  //         debugPrint('NO DATA');
                  //       }
                  //     } else {
                  //       debugPrint(
                  //           'Failed to get user info. Status code: $value');
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
                width: 300,
                height: 50,
                child: filledButton(
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
