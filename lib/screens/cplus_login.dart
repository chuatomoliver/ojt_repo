import 'dart:convert';

import 'package:audit_finance_app/models/user_information.dart';
import 'package:audit_finance_app/screens/cplus_register.dart';
import 'package:audit_finance_app/screens/homepage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

var userInfo;

class _LoginState extends State<Login> {
  final dio = Dio();
  Future<int?> checkUserInfo(String firstName, String lastName) async {
    final response = await dio.get(
      'http://localhost/api/v1/index.php/checkUserExist',
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
            Padding(
              padding: const EdgeInsets.only(top: 30),
              //USERNAME GOES HERE
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              //PASSWORD GOES HERE
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              //LOGIN BUTTON
              child: SizedBox(
                width: 300,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    // checkUserInfo('test', 'test');
                    checkUserInfo(
                      usernameController.text,
                      passwordController.text,
                    ).then(
                      (value) {
                        debugPrint(value.toString());
                        if (value == 200) {
                          if (!userInfo.error) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Homepage(),
                              ),
                              ModalRoute.withName('/'),
                            );
                          } else {
                            debugPrint('NO DATA');
                          }
                        } else {
                          debugPrint(
                              'Failed to get user info. Status code: $value');
                        }
                      },
                    );
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              //REGISTER BUTTON
              child: SizedBox(
                width: 300,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: const Text(
                    'Don\'t have an account? Register',
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
