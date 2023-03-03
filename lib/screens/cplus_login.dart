import 'dart:convert';

import 'package:audit_finance_app/models/user_information.dart';
import 'package:audit_finance_app/screens/cplus_register.dart';
import 'package:audit_finance_app/screens/homepage.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.red,
                      Colors.purple,
                      //add more color here.
                    ],
                  ).createShader(
                    const Rect.fromLTWH(
                      0.0,
                      0.0,
                      400.0,
                      100.0,
                    ),
                  ),
              ),
              'Contacts+',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              //USERNAME GOES HERE
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Enter your username',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              //PASSWORD GOES HERE
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Enter your password',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              //LOGIN BUTTON
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
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
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red,
                          Colors.purple,
                        ],
                      ),
                    ),
                    child: Container(
                      height: 50,
                      width: 300,
                      alignment: Alignment.center,
                      child: const Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        'Login',
                      ),
                    ),
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
                child: OutlinedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red,
                          Colors.purple,
                        ],
                      ),
                    ),
                    child: Container(
                      height: 50,
                      width: 300,
                      alignment: Alignment.center,
                      child: const Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        'Register',
                      ),
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
