import 'dart:io';

import 'package:audit_finance_app/firebase/firebase_crud.dart';
import 'package:audit_finance_app/models/journal.dart';
import 'package:audit_finance_app/widgets/diary_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/states.dart';
import '../widgets/login_widgets.dart';

class EditDiaryEntry extends StatefulWidget {
  final Journal entry;
  const EditDiaryEntry({super.key, required this.entry});

  @override
  State<EditDiaryEntry> createState() => _DiaryEntryState();
}

class _DiaryEntryState extends State<EditDiaryEntry> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    final statesData = Provider.of<States>(context, listen: false);
    statesData.path = widget.entry.imgPath;
    titleController.text = widget.entry.title;
    contentController.text = widget.entry.content;
    statesData.imageEntry =
        widget.entry.imgPath == '' ? null : File(widget.entry.imgPath);
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
      body: SingleChildScrollView(
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
                        statesData.getImage(ImageSource.camera).then((value) {
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
                        statesData.getImage(ImageSource.gallery).then((value) {
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
                      // ADD ENTRY TO FIREBASE
                      FirebaseCRUD().updateEntry(
                        entry: Journal(
                            id: widget.entry.id,
                            title: titleController.text,
                            date: widget.entry.date,
                            content: contentController.text,
                            imgPath: statesData.path != ''
                                ? statesData.path
                                : statesData.imageEntry == null
                                    ? ''
                                    : '${statesData.path}.png'),
                      );

                      if (statesData.path != widget.entry.imgPath) {
                        if (statesData.imageEntry != null) {
                          statesData.image!.saveTo('${statesData.path}.png');
                        }
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
    );
  }
}
