import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

class Contacts {
  Widget contactBody(List<Contact>? contacts, bool contactPermission) {
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
      body: !contactPermission
          ? const Center(
              child: Text('PLEASE ALLOW CONTACT PERMISSION FIRST'),
            )
          : ListView.builder(
              itemCount: contacts!.length,
              itemBuilder: (context, index) {
                Uint8List? image = contacts[index].photo;
                String number = contacts[index].phones.isNotEmpty
                    ? contacts[index].phones.first.number
                    : '---';
                return Card(
                  child: ListTile(
                    leading: image == null
                        ? CircleAvatar(
                            child: Text(
                              contacts[index].displayName.substring(0, 1),
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: MemoryImage(image),
                          ),
                    title: Text(contacts[index].displayName),
                    subtitle: Text(number),
                  ),
                );
              },
            ),
    );
  }
}
