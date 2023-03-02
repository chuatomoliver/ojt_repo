import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _dio = Dio();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Future<void> registerUser(RegistrationInfo registrationInfo) async {
  //   // print(registrationInfo.first_name);
  //   // print(registrationInfo.last_name);
  //   // print(registrationInfo.birthday);
  //   // print(registrationInfo.gender);
  //   // print(registrationInfo.mobile);
  //   debugPrint(jsonEncode(registrationInfo.toJson()));
  //   debugPrint(registrationInfo.toJson().toString());
  //   try {
  //     final response = await dio.post(
  //       'http://localhost/api/v1/index.php/registration',
  //       data: json.encode(registrationInfo.toJson()),
  //     );
  //     debugPrint(response.data.toString());
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<User?> registerUser({required User user}) async {
    User? retrievedUser;

    try {
      Response response = await _dio.post(
        'http://localhost/api/v1/index.php/registration',
        data: user.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = User.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    //ENTER USERNAME
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter some text'
                          : null,
                      controller: firstNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your first name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    //ENTER PASSWORD
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter some text'
                          : null,
                      controller: lastNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your last name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    //REENTER PASSWORD
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter some text'
                          : null,
                      controller: birthdayController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your birthday',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    //REENTER PASSWORD
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter some text'
                          : null,
                      controller: genderController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Enter your gender',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    //REENTER PASSWORD
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter some text'
                          : null,
                      controller: mobileController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your mobile number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
              //CONFIRM REGISTER BUTTON
              child: SizedBox(
                width: 300,
                height: 50,
                child: FilledButton(
                  onPressed: () async {
                    User userInfo = User(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      birthday: birthdayController.text,
                      gender: genderController.text,
                      mobile: mobileController.text,
                    );

                    User? retrievedUser = await registerUser(user: userInfo);

                    print(retrievedUser);
                    // if (_formKey.currentState!.validate()) {

                    // }

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const Login(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    'Register',
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
