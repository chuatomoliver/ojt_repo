import 'package:audit_finance_app/screens/login.dart';
import 'package:audit_finance_app/widgets/registration_widgets.dart';
import 'package:audit_finance_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                  RegistrationWidgets().label(text: 'Email'),
                  Widgets().sizedBoxHeight(5),
                  RegistrationWidgets().textField(
                    textEditingController: emailController,
                    hint: 'Please enter your email',
                  ),
                  Widgets().sizedBoxHeight(15),
                  RegistrationWidgets().label(text: 'Password'),
                  Widgets().sizedBoxHeight(5),
                  RegistrationWidgets().textField(
                    textEditingController: passwordController,
                    hint: 'Please enter your password',
                  ),
                  Widgets().sizedBoxHeight(15),
                  RegistrationWidgets().label(text: 'Confirm Password'),
                  Widgets().sizedBoxHeight(5),
                  RegistrationWidgets().textField(
                    textEditingController: confirmPasswordController,
                    hint: 'Please confirm your password',
                  ),
                ],
              ),
            ),
            Widgets().sizedBoxHeight(20),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // do something
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogIn(),
                    ),
                  );

                  Fluttertoast.showToast(
                    toastLength: Toast.LENGTH_SHORT,
                    msg: 'Registration complete',
                    gravity: ToastGravity.BOTTOM_LEFT,
                    backgroundColor: Colors.grey,
                  );
                  print('YOU ARE REGISTERED');
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
