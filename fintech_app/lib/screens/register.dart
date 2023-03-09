import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fintech_app/constants/colors.dart';
import 'package:fintech_app/firebase/firebase_crud.dart';
import 'package:fintech_app/models/user.dart';
import 'package:fintech_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final numController = TextEditingController();

  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(
              text: 'Create a new',
              color: secondaryColor,
              weight: FontWeight.normal,
            ),
            titleText(
              text: 'account',
              color: tertiaryColor,
              weight: FontWeight.normal,
            ),
            textFormField(
              textEditingController: nameController,
              label: 'Full name',
              icon: Icons.person,
            ),
            textFormField(
              textEditingController: numController,
              keyboardType: TextInputType.number,
              label: 'Mobile number',
              isLimited: true,
              icon: Icons.phone_android_rounded,
            ),
            filledButton(
              context: context,
              text: 'Create Account',
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('users')
                    .where('mobile', isEqualTo: '+63${numController.text}')
                    .get()
                    .then(
                  (value) {
                    if (value.size == 0) {
                      FirebaseFunctions.register(
                        user: User(
                            name: nameController.text,
                            mobile: '+63${numController.text}',
                            token: 'KUNWARI TOKEN TO'),
                      );
                      print('REGISTER SUCCESS');
                    } else {
                      print('existing na');
                    }
                  },
                );
              },
            ),
            Row(
              children: [
                smallText(
                  text: 'Already have an account? ',
                  onTap: () {},
                  weight: FontWeight.normal,
                  color: secondaryColor,
                ),
                smallText(
                  text: 'Sign In.',
                  onTap: () {},
                  weight: FontWeight.bold,
                  color: tertiaryColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
