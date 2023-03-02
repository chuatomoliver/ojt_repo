import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../providers/states.dart';

class Profile {
  Widget profileBody(
      Function cameraPermission, BuildContext context, Function function) {
    final imagePicker = ImagePicker();
    final statesData = Provider.of<States>(context, listen: false);

    Future<void> getImage(
      ImageSource imageSource,
    ) async {
      cameraPermission();

      final XFile? image = await imagePicker.pickImage(source: imageSource);
      const String folderName = "CONTACT IMAGES";
      final dir = Directory('/storage/emulated/0/$folderName');

      if (image == null) return;

      String fileName = basenameWithoutExtension(image.path);
      if (!(await dir.exists())) {
        dir.create();
      }
      final path = join(dir.path, fileName);
      await image.saveTo('$path.png');
      statesData.image = File('$path.png');
      function();
    }

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: statesData.image == null
                      ? null
                      : FileImage(statesData.image!),
                  // child: statesData.image == null ? const Text('O') : Image.file(statesData.image!),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: PopupMenuButton(
                    icon: const Icon(Icons.camera_alt),
                    itemBuilder: (BuildContext context) {
                      return const [
                        PopupMenuItem(
                          value: 0,
                          child: Text('Take photo'),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Text('Choose image..'),
                        ),
                      ];
                    },
                    onSelected: (value) {
                      switch (value) {
                        case 0:
                          getImage(ImageSource.camera);
                          break;
                        case 1:
                          getImage(ImageSource.gallery);
                          break;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              style: TextStyle(fontSize: 26),
              'Firstname Lastname',
            ),
          )
        ],
      ),
    );
  }
}
