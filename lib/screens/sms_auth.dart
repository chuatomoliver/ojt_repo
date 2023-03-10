import 'package:audit_finance_app/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SMSAuth extends StatefulWidget {
  const SMSAuth({super.key});

  // STRING HOLDER FOR THE SMS CODE
  static String verify = '';

  @override
  State<SMSAuth> createState() => _SMSAuthState();
}

class _SMSAuthState extends State<SMSAuth> {
  String authStatus = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  // SMS FROM PIN INPUT
  var code = '';

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
              length: 6,
              onChanged: (pin) => code = pin,
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
                  codeSent: (String verificationId, int? resendToken) {
                    authStatus = 'Code sent';

                    // VERIFICATION ID = YUNG CODE SA SMS NA MATATANGGAP
                    SMSAuth.verify = verificationId;
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              },
              child: const Text('Send SMS'),
            ),
            OutlinedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: SMSAuth.verify,
                    smsCode: code,
                  );
                  await auth.signInWithCredential(credential);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Verify phone number'),
            ),
          ],
        ),
      ),
    );
  }
}
