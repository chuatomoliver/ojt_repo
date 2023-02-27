import 'package:audit_finance_app/screens/forgot_password.dart';
import 'package:audit_finance_app/screens/home_screen.dart';
import 'package:audit_finance_app/screens/registration.dart';
import 'package:audit_finance_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_info.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var userInfo;

  Future<int> checkUser(String firstName, String lastName) async {
    final url = Uri.parse(
        'http://localhost/api/v1/index.php/checkUserExist?first_name=$firstName&last_name=$lastName');
    try {
      final response = await http.get(url);

      userInfo = jsonDecode(response.body);
      return response.statusCode;
    } catch (e) {
      debugPrint(e.toString());
      return 400;
    }
  }

  @override
  void initState() {
    // checkUser('test', 'test');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Username'),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your username",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter some text'
                    : null,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Password'),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your password",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter some text'
                    : null,
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    checkUser(usernameController.text, passwordController.text)
                        .then((value) {
                      if (value == 200) {
                        if (!userInfo['error']) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        } else {
                          debugPrint('NO DATA');
                        }
                      } else {
                        debugPrint(
                            'Failed to get user info. Status code: $value');
                      }
                    });
                  }
                },
                child: const Text('Login'),
              ),
              Widgets().sizedBoxHeight(10),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registration(),
                    ),
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
