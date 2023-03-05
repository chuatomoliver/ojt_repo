import 'package:audit_finance_app/screens/diary_entry.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Diary {
  Widget diaryBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.image,
                  size: 40,
                ),
                title: Text('My Sample Diary Entry'),
                subtitle: Text('On this day, I made a diary entry about...'),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DiaryEntry()),
            );
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
