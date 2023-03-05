import 'package:audit_finance_app/screens/cplus_login.dart';
import 'package:audit_finance_app/screens/diary.dart';
import 'package:audit_finance_app/screens/homepage.dart';
import 'package:audit_finance_app/widgets/diary_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/login_widgets.dart';

class DiaryEntry extends StatefulWidget {
  const DiaryEntry({super.key});

  @override
  State<DiaryEntry> createState() => _DiaryEntryState();
}

class _DiaryEntryState extends State<DiaryEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(child: diaryTextField(label: 'Title')),
              diaryTextField(label: 'Date'),
              diaryTextField(label: 'What\'s on your mind?'),
              Column(
                children: [
                  filledButton(text: 'Post', onPressed: () {}),
                  sizedBoxSpacer(height: 10),
                  filledButton(
                    text: 'Back',
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Homepage(),
                      //   ),
                      // );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
