import 'package:flutter/material.dart';
import 'package:audit_finance_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    'Welcome, user.',
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.amber,
                  ),
                  height: 200,
                ),
                Widgets().sizedBoxHeight(20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.lightBlue,
                  ),
                  height: 200,
                ),
                Widgets().sizedBoxHeight(20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.lightGreen,
                  ),
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}