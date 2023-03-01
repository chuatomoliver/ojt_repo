import 'package:audit_finance_app/screens/cplus_login.dart';
import 'package:audit_finance_app/screens/cplus_register.dart';
import 'package:audit_finance_app/screens/login.dart';
import 'package:audit_finance_app/screens/permissions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

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
                  int? x = preferences.getInt('perm');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          x == 3 ? const LogIn() : const Permissions(),
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
