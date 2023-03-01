import 'package:audit_finance_app/screens/cplus_login.dart';
import 'package:flutter/material.dart';

class Permissions extends StatefulWidget {
  const Permissions({super.key});

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            style: TextStyle(fontSize: 20),
            'Allow this permission?',
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
              'In order to have a better experience, we will need permission for your <>.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              width: 300,
              height: 50,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      //only the final ask_permission leads to login()
                      builder: (context) => const Login(),
                    ),
                  );
                },
                child: const Text(
                  'Allow',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
