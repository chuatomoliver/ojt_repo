import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/states.dart';

class Profile {
  Widget profileBody(BuildContext context, void Function() function) {
    // final imagePicker = ImagePicker();
    final statesData = Provider.of<States>(context, listen: false);

    // Future<void> getImage(ImageSource imageSource) async {
    //   int x = 0;
    //   if (x == 0) {
    //     if (await statesData.permissionChecker(Permission.camera)) {
    //       x++;
    //     }
    //   }

    //   if (x < 2) {
    //     if (await statesData
    //         .permissionChecker(Permission.manageExternalStorage)) {
    //       x++;
    //     }
    //   }

    //   final XFile? image = await imagePicker.pickImage(source: imageSource);
    //   const String folderName = "PROFILE IMAGES";
    //   final dir = Directory('/storage/emulated/0/$folderName');

    //   if (image == null) return;

    //   String fileName = basenameWithoutExtension(image.path);
    //   if (!(await dir.exists())) {
    //     dir.create();
    //   }
    //   final path = join(dir.path, fileName);
    //   await image.saveTo('$path.png');
    //   statesData.image = File('$path.png');
    //   function();
    // }

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
                  backgroundImage: statesData.imageShow == null
                      ? null
                      : FileImage(statesData.imageShow!),
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
                          statesData.getImage(ImageSource.camera).then((value) {
                            statesData
                                .setProfileImage()
                                .then((value) => function());
                          });

                          break;
                        case 1:
                          statesData
                              .getImage(ImageSource.gallery)
                              .then((value) {
                            statesData
                                .setProfileImage()
                                .then((value) => function());
                          });

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
