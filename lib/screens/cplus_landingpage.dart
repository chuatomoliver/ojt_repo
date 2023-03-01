import 'package:audit_finance_app/screens/cplus_login.dart';
import 'package:audit_finance_app/screens/cplus_register.dart';
import 'package:audit_finance_app/screens/permissions.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            style: TextStyle(fontSize: 20),
            'Welcome to Contacts+ !',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SizedBox(
              width: 300,
              height: 50,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Permissions(),
                    ),
                  );
                },
                //PROCEED TO PERMISSIONS
                child: const Text(
                  'Proceed',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
