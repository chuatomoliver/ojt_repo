import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../providers/states.dart';
import '../screens/contacts.dart';
import '../screens/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Contact>? contacts;
  var index = 1;

  Future<bool> permissionRequest(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  void cameraPermission() async {
    if(!await Permission.camera.status.isGranted) {
      permissionRequest(Permission.camera);
      if (!await permissionRequest(Permission.manageExternalStorage)) {
        permissionRequest(Permission.manageExternalStorage);
      }
    }
  }

  Future<bool> getPhoneContacts() async {
    if (!await Permission.contacts.status.isGranted) {
      if (await permissionRequest(Permission.contacts)) {
        contacts = await FlutterContacts.getContacts(
            withProperties: true, withPhoto: true);
        setState(() {});
        return true;
      } else {
        return false;
      }
    } else {
      contacts = await FlutterContacts.getContacts(
            withProperties: true, withPhoto: true);
        setState(() {});
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    getPhoneContacts().then((value) {
      if (value) {
        final statesData = Provider.of<States>(context, listen: false);
        statesData.contactPermission = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final statesData = Provider.of<States>(context, listen: false);
    return Scaffold(
      body: index == 0
          ? Contacts().contactBody(contacts, statesData.contactPermission)
          : index == 1
              ? homepageBody()
              : Profile().profileBody(cameraPermission, context, () {
                setState(() { });
              }),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: index,
        onTap: (int val) {
          setState(
            () {
              switch (val) {
                case 0:
                  index = 0;
                  break;
                case 1:
                  index = 1;
                  break;
                case 2:
                  index = 2;
                  break;
              }
            },
          );
        },
        items: [
          FloatingNavbarItem(icon: Icons.contacts),
          FloatingNavbarItem(icon: Icons.home),
          FloatingNavbarItem(icon: Icons.person),
        ],
      ),
    );
  }
}

Widget homepageBody() {
  return const Center(
    child: Text('Homepage'),
  );
}
