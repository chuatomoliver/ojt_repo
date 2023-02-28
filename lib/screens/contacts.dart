import 'package:flutter/material.dart';

class Contacts {
  Widget contactBody() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          'Contacts',
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                //open contacts
              },
              child: SizedBox(
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Profile 1',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
