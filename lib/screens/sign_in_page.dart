import 'package:audit_finance_app/constant/theme.dart';
import 'package:audit_finance_app/widgets/widgets.dart';
import 'package:audit_finance_app/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../providers/states.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late List<String> inputPass;
  String defaultPass = '1234';

  @override
  void initState() {
    final statesData = Provider.of<States>(context, listen: false);
    statesData.screen = 0;
    inputPass = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const Align(
            alignment: Alignment.bottomCenter,
            child: Image(
              image: AssetImage('assets/background.png'),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              Widgets().gradientAppBar(
                title: const Text('Sign In'),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Widgets().sizedBoxHeight(80),
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 32.5,
                              backgroundImage:
                                  AssetImage('assets/logo/audit_logo.png'),
                            ),
                            Widgets().sizedBoxHeight(10),
                            const Text(
                              'Ledjoric Vermont',
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                        Widgets().sizedBoxHeight(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            pinIconTest(inputPass.isNotEmpty
                                ? AuditTheme.primaryColor
                                : Colors.grey),
                            pinIconTest(inputPass.length >= 2
                                ? AuditTheme.primaryColor
                                : Colors.grey),
                            pinIconTest(inputPass.length >= 3
                                ? AuditTheme.primaryColor
                                : Colors.grey),
                            pinIconTest(inputPass.length == 4
                                ? AuditTheme.primaryColor
                                : Colors.grey),
                          ],
                        ),
                        Widgets().sizedBoxHeight(25),
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AuditTheme.shadow,
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    numPad(
                                        const Text('1'), () => inputPin('1')),
                                    numPad(
                                        const Text('2'), () => inputPin('2')),
                                    numPad(
                                        const Text('3'), () => inputPin('3')),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    numPad(
                                        const Text('4'), () => inputPin('4')),
                                    numPad(
                                        const Text('5'), () => inputPin('5')),
                                    numPad(
                                        const Text('6'), () => inputPin('6')),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    numPad(
                                        const Text('7'), () => inputPin('7')),
                                    numPad(
                                        const Text('8'), () => inputPin('8')),
                                    numPad(
                                        const Text('9'), () => inputPin('9')),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      height: 100,
                                    ),
                                    numPad(
                                        const Text('0'), () => inputPin('0')),
                                    numPad(
                                      const Icon(Icons.backspace_sharp),
                                      () => deletePin(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pinIconTest(Color color) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Icon(
        Icons.circle,
        size: 35,
        color: color,
      ),
    );
  }

  Widget numPad(Widget widget, void Function() function) {
    return SizedBox(
      width: 100,
      height: 100,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          textStyle: const TextStyle(
            fontSize: 30,
          ),
        ),
        onPressed: function,
        child: widget,
      ),
    );
  }

  void inputPin(String value) {
    setState(() {
      inputPass.length != 4 ? inputPass.add(value) : null;
      inputPass.length == 4 ? checkPass() : null;
    });
    print(inputPass);
  }

  void checkPass() {
    var stringList = inputPass.join('');
    if (stringList == defaultPass) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
    print(stringList);
  }

  void deletePin() {
    setState(() {
      inputPass.isNotEmpty ? inputPass.removeLast() : null;
    });
    print(inputPass);
  }
}
