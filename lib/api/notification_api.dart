import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  final Dio dio = Dio();

  String? mToken = '';
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future showNotificaiton({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

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
      mToken = token;
      print('My token is $mToken');

      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection('userTokens').doc('user1').set({
      'token': token,
    });
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
        'channel id',
        'channel name',
        importance: Importance.max,
        styleInformation: bigTextStyleInformation,
        // priority: Priority.max,
        // playSound: false,
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

  void sendPushMessage(String token, String body, String title) async {
    try {
      await dio.post('https://fcm.googleapis.com/fcm/send',
          data: jsonEncode(
            {
              'priority': 'high',
              // 'data': <String, dynamic>{
              //   'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              //   'status': 'done',
              //   'title': title,
              //   'body': body,
              // },
              'notification': <String, dynamic>{
                'title': title,
                'body': body,
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
}
