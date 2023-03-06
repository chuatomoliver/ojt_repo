import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MessagingWidget extends StatefulWidget {
  const MessagingWidget({super.key});

  @override
  State<MessagingWidget> createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final Dio dio = Dio();

  String? mToken = '';
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final name = TextEditingController();
  final title = TextEditingController();
  final body = TextEditingController();

  @override
  void initState() {
    super.initState();
    requestPermission();
    getToken();
    initInfo();
  }

  initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/test_icon');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        try {
          if (details.payload != null && details.payload!.isNotEmpty) {
          } else {}
        } catch (e) {}
        return;
      },
      //   onSelectNotification: (String? payload) async {
      // try {
      //   if (payload != null && payload.isNotEmpty) {
      //   } else {}
      // } catch (e) {}
      // return;
    );

    FirebaseMessaging.onMessage.listen((message) async {
      print('------------------------');
      print(
          'onMessage: ${message.notification?.title}/${message.notification?.body}');

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatformCHannelSpecifics =
          AndroidNotificationDetails(
        'something',
        'something',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: false,
      );
      NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformCHannelSpecifics,
          iOS: const DarwinNotificationDetails());
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title,
        message.notification?.body,
        platformChannelSpecifics,
        payload: message.data['title'],
      );
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      carPlay: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mToken = token;
        print('My token is $mToken');
      });

      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection('userTokens').doc('user1').set({
      'token': token,
    });
  }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await dio.post('https://fcm.googleapis.com/fcm/send',
          data: jsonEncode(
            {
              'priority': 'high',
              'data': <String, dynamic>{
                'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                'status': 'done',
                'body': body,
                'title': title,
              },
              'notification': <String, dynamic>{
                'title': title,
                'body': body,
                'android_channel_id': 'contactsplus'
              },
              'to': token,
            },
          ),
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              'Authorization':
                  'key=AAAAhHrpO8c:APA91bHK-fqXV6a1lmNvcCK6bPUnROouhcRNwDltA8vfX4TDaHctFMFWe5_gCgdLQYBLxdaZimBYHlBHa_SJAtrEtt5WHo7B2kxcRZ9nIwt8wDkUNCY94B_cDViy0VKoZVMY6s_ZkrNH'
            },
          ));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: name,
          ),
          TextField(
            controller: title,
          ),
          TextField(
            controller: body,
          ),
          FilledButton(
            child: const Text('Button'),
            onPressed: () async {
              String nameText = name.text.trim();
              String titleText = title.text.trim();
              String bodyText = body.text.trim();

              if (nameText != '') {
                DocumentSnapshot snap = await FirebaseFirestore.instance
                    .collection('userTokens')
                    .doc(nameText)
                    .get();

                String token = snap['token'];
                print(token);

                sendPushMessage(token, bodyText, titleText);
              }
            },
          ),
        ]),
      ),
    );
  }
}
