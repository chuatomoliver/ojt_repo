import 'package:flutter/material.dart';

class Profile {
  Widget profileBody() {
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
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: PopupMenuButton(
                    icon: const Icon(Icons.camera_alt),
                    itemBuilder: (BuildContext context) {
                      return const [
                        PopupMenuItem(
                          child: Text('Take photo'),
                        ),
                        PopupMenuItem(
                          value: null,
                          child: Text('Choose image..'),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(style: TextStyle(fontSize: 26), 'Firstname Lastname',),
          )
        ],
      ),
    );
  }
}
