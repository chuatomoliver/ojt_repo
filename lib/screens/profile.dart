import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Profile {
  Widget profileBody(Function cameraPermission, File? imageView) {
    final imagePicker = ImagePicker();

    Future<void> getImage(ImageSource imageSource) async {
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
      imageView = File(image.path);
    }

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 100,
                  // child: imageView == null ? const Text('O') : Image.file(imageView!),
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
