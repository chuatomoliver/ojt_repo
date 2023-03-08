import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SMSAuth extends StatefulWidget {
  const SMSAuth({super.key});

  @override
  State<SMSAuth> createState() => _SMSAuthState();
}

class _SMSAuthState extends State<SMSAuth> {
  String authStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Status: $authStatus',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              onCompleted: (pin) => print(pin),
            ),
            const SizedBox(
              height: 30,
            ),
            FilledButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '+639297888742',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {},
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              },
              child: const Text('Send SMS'),
            )
          ],
        ),
      ),
    );
  }
}
