import 'package:audit_finance_app/firebase/firebase_crud.dart';
import 'package:audit_finance_app/models/journal.dart';
import 'package:audit_finance_app/screens/diary_entry.dart';
import 'package:audit_finance_app/widgets/diary_widgets.dart';
import 'package:flutter/material.dart';

class Diary {
  Widget diaryBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Moments',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<List<Journal>>(
            stream: FirebaseCRUD().readEntries(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong!');
              } else if (snapshot.hasData) {
                final entries = snapshot.data;

                return snapshot.data!.isEmpty
                    ? const Center(
                        child: Text(
                            'No entries yet.\nGet started by writing about your day or thoughts.',
                            textAlign: TextAlign.center),
                      )
                    : ListView(
                        children: entries!
                            .map((e) => buildEntry(context, e))
                            .toList());
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
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
