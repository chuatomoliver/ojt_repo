import 'dart:convert';

import 'package:audit_finance_app/widgets/registration_widgets.dart';
import 'package:audit_finance_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '/models/user_info.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // RegistrationInfo regiSstrationInformation = RegistrationInfo();

  void registerUser(RegistrationInfo registrationInfo) async {
    final url = Uri.parse('http://localhost/api/v1/index.php/registration');
    try {
      final response = await http.post(
        url,
        // headers: {'Content-Type': 'application/json'},
        body: registrationInfo.toJson(),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint('User registered successfully!');
      } else {
        debugPrint(
            'Failed to register user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void loginUser(int id) async {
    final url =
        Uri.parse('http://localhost/api/v1/index.php/getUserInfo?id=$id');
    try {
      final response = await http.get(url);

      var userInfo = jsonDecode(response.body);

      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint('get info successfully!');

        if (userInfo['payload'] == null) {
          debugPrint('NO DATA');
        } else {
          userInfo['payload']!.forEach((e) {
            final info = RegistrationInfo.fromJson(e);
            debugPrint(info.firstName);
          });
        }
      } else {
        debugPrint(
            'Failed to get user info. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTRATION'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Widgets().sizedBoxHeight(15),
                  RegistrationWidgets().label(text: 'First Name'),
                  Widgets().sizedBoxHeight(5),
                  RegistrationWidgets().textField(
                    textEditingController: firstNameController,
                    hint: 'Please enter your first name',
                  ),
                  Widgets().sizedBoxHeight(15),
                  RegistrationWidgets().label(text: 'Last Name'),
                  Widgets().sizedBoxHeight(5),
                  RegistrationWidgets().textField(
                    textEditingController: lastNameController,
                    hint: 'Please enter your last name',
                  ),
                  Widgets().sizedBoxHeight(15),
                  RegistrationWidgets().label(text: 'Birthday'),
                  Widgets().sizedBoxHeight(5),
                  RegistrationWidgets().textField(
                    textEditingController: birthdayController,
                    hint: 'Please enter your birthday',
                  ),
                  Widgets().sizedBoxHeight(15),
                  RegistrationWidgets().label(text: 'Gender'),
                  Widgets().sizedBoxHeight(5),
                  RegistrationWidgets().textField(
                    textEditingController: genderController,
                    hint: 'Please enter your gender',
                  ),
                  Widgets().sizedBoxHeight(15),
                  RegistrationWidgets().label(text: 'Mobile Number'),
                  Widgets().sizedBoxHeight(5),
                  RegistrationWidgets().textField(
                    textEditingController: mobileController,
                    hint: 'Please enter you mobile number',
                  ),
                ],
              ),
            ),
            Widgets().sizedBoxHeight(20),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // do something
                  // Navigator.pop(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const LogIn(),
                  //   ),
                  // );
                  // registerUser(RegistrationInfo(
                  //   first_name: firstNameController.text,
                  //   last_name: lastNameController.text,
                  //   birthday: birthdayController.text,
                  //   gender: genderController.text,
                  //   mobile: mobileController.text,
                  // ));
                  loginUser(19);
                  Fluttertoast.showToast(
                    toastLength: Toast.LENGTH_SHORT,
                    msg: 'Registration complete',
                    gravity: ToastGravity.BOTTOM_LEFT,
                    backgroundColor: Colors.grey,
                  );
                  // print('YOU ARE REGISTERED');
                }
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
