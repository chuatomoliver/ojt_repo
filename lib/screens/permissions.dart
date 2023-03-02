import 'package:audit_finance_app/screens/cplus_login.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
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
      child: Hero(
        tag: 'transition-1',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 20),
            //   child: Container(
            //     width: 80,
            //     height: 80,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(
            //           'assets/black_icon.png',
            //         ),
            //         fit: BoxFit.contain,
            //       ),
            //     ),
            //   ),
            // ),
            const Text(
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
              'Allow Permissions?',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Text(
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
                'For a better experience, we will need permission to access your ${permissionName[x]}.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  statesData.permissionRequest(permissions[x]).then(
                    (value) {
                      if (value) {
                        if (x < permissions.length - 1) {
                          increment();
                        } else {
                          print(x);
                          preferences.setInt('perm', x);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //only the final ask_permission leads to login()
                              builder: (context) => const Login(),
                            ),
                          );
                        }
                      }
                    },
                  );
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.red,
                        Colors.pink,
                      ],
                    ),
                  ),
                  child: Container(
                    height: 50,
                    width: 300,
                    alignment: Alignment.center,
                    child: const Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      'Allow',
                    ),
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
