import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audit_finance_app/api/notification_api.dart';
import 'package:audit_finance_app/widgets/diary_widgets.dart';
import 'package:audit_finance_app/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/states.dart';
import '../widgets/login_widgets.dart';

class Profile {
  TimeOfDay time = TimeOfDay.now();
  Widget profileBody(BuildContext context, void Function() function) {
    // final imagePicker = ImagePicker();
    final statesData = Provider.of<States>(context, listen: false);
    //PLACEHOLDER TIME

    return Scaffold(
      appBar: AppBar(
        title: appBarText(text: 'My Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.lightGreen[800],
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
                              statesData
                                  .getImage(ImageSource.camera)
                                  .then((value) {
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
                  style: TextStyle(fontSize: 20),
                  'Firstname Lastname',
                ),
              ),
              heightSpacer(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Alarm is set\n${time.hour}:${time.minute}',
                  ),
                  widthSpacer(width: 100),
                  //TIMER GOES HERE
                  timer(),
                ],
              ),
              heightSpacer(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  filledButton(
                    width: 150,
                    text: 'Set Alarm',
                    onPressed: () async {
                      showTimePicker(
                        context: context,
                        initialTime: time,
                      ).then((value) {
                        DateTime now = DateTime.now();
                        DateTime alarm = DateTime(
                          now.year,
                          now.month,
                          now.day,
                          value!.hour,
                          value.minute,
                          00,
                        );
                        print(value);
                        AndroidAlarmManager.oneShotAt(
                          alarm,
                          0,
                          alarmNotif,
                        );
                      });
                    },
                  ),
                  widthSpacer(width: 20),
                  filledButton(
                    width: 150,
                    text: 'Set Timer',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void alarmNotif() {
  print('EYYYYY');
  NotificationApi.showNotificaiton(
    title: 'ALARM',
    body: 'Reminder: it is ${DateFormat.jm().format(DateTime.now())}',
  );
}
