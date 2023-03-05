import 'dart:io';

import 'package:audit_finance_app/screens/edit_diary_entry.dart';
import 'package:intl/intl.dart';
import 'package:audit_finance_app/firebase/firebase_crud.dart';
import 'package:audit_finance_app/models/journal.dart';
import 'package:audit_finance_app/widgets/diary_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/states.dart';
import '../widgets/login_widgets.dart';

class DiaryEntry extends StatefulWidget {
  const DiaryEntry({super.key});

  @override
  State<DiaryEntry> createState() => _DiaryEntryState();
}

class _DiaryEntryState extends State<DiaryEntry> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    final statesData = Provider.of<States>(context, listen: false);
    statesData.image = null;
    statesData.imageEntry = null;
    statesData.path = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final statesData = Provider.of<States>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add entry'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  diaryTextField(
                    controller: titleController,
                    label: 'Title',
                  ),
                  diaryTextField(
                    controller: contentController,
                    label: 'What\'s on your mind?',
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: statesData.imageEntry == null
                        ? null
                        : Image.file(statesData.imageEntry!),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            statesData
                                .getImage(ImageSource.camera)
                                .then((value) {
                              if (statesData.image == null) return;
                              setState(() {
                                statesData.imageEntry =
                                    File(statesData.image!.path);
                              });
                            });
                          },
                          child: const Icon(Icons.camera_alt),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            statesData
                                .getImage(ImageSource.gallery)
                                .then((value) {
                              if (statesData.image == null) return;
                              setState(() {
                                statesData.imageEntry =
                                    File(statesData.image!.path);
                              });
                            });
                          },
                          child: const Icon(Icons.image),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      filledButton(
                        text: 'Post',
                        onPressed: () {
                          DateTime now = DateTime.now();
                          String formattedDate =
                              DateFormat('MMMM dd, yyyy   hh:mm a').format(now);

                          // ADD ENTRY TO FIREBASE
                          FirebaseCRUD().createEntry(
                            journalEntry: Journal(
                                title: titleController.text,
                                date: formattedDate,
                                content: contentController.text,
                                imgPath: statesData.imageEntry == null
                                    ? ''
                                    : '${statesData.path}.png'),
                          );

                          if (statesData.imageEntry != null) {
                            statesData.image!.saveTo('${statesData.path}.png');
                          }
                          statesData.imageEntry = null;
                          statesData.path = '';

                          Navigator.pop(context);
                        },
                      ),
                      sizedBoxSpacer(height: 10),
                      filledButton(
                        text: 'Back',
                        onPressed: () {
                          statesData.imageEntry = null;
                          statesData.path = '';
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
