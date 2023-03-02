import 'package:audit_finance_app/screens/cplus_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constants.dart';
import '../providers/states.dart';

class Permissions extends StatefulWidget {
  const Permissions({super.key});

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  late SharedPreferences preferences;
  int x = 0;

  void increment() {
    setState(() {
      x++;
    });
  }

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
    final statesData = Provider.of<States>(context, listen: false);
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            style: TextStyle(fontSize: 20),
            'Allow this permission?',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
              'In order to have a better experience, we will need permission for your ${permissionName[x]}.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              width: 300,
              height: 50,
              //ALLOW PERMISSION
              child: FilledButton(
                onPressed: () {
                  statesData.permissionRequest(permissions[x]).then((value) {
                    if (value) {
                      if (x < permissions.length - 1) {
                        increment();
                      } else {
                        preferences.setInt('perm', x);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            //only the final ask_permission leads to login()
                            builder: (context) => const Login(),
                          ),
                          ModalRoute.withName('/'),
                        );
                      }
                    }
                  });
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
