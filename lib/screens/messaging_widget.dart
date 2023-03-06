import 'dart:convert';
import 'dart:io';

import 'package:audit_finance_app/api/notification_api.dart';
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
  final name = TextEditingController();
  final title = TextEditingController();
  final body = TextEditingController();

  @override
  void initState() {
    super.initState();
    NotificationApi().requestPermission();
    NotificationApi().getToken();
    NotificationApi().initInfo();
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

                NotificationApi().sendPushMessage(token, bodyText, titleText);
              }
            },
          ),
        ]),
      ),
    );
  }
}
