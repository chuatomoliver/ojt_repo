import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../providers/states.dart';
import '../screens/contacts.dart';
import '../screens/profile.dart';
import 'package:location/location.dart' as loc;

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
    if (!await Permission.camera.status.isGranted) {
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

  Future<void> getLocation() async {
    if (!await Permission.location.status.isGranted) {
      if (!await permissionRequest(Permission.location)) {
        return;
      }
    }

    loc.Location location = loc.Location();
    // var currentLocation = location.getLocation().;
    loc.LocationData whereYou;
    whereYou = await location.getLocation();
    // print('-------------------------------------------------------------');
    // print('Latitude: ${whereYou.latitude} | Longitude: ${whereYou.longitude}');
    // print('-------------------------------------------------------------');
    // var loc = location.Location
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
    // getLocation();
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
                  setState(() {});
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
          FloatingNavbarItem(icon: Icons.location_on),
          FloatingNavbarItem(icon: Icons.person),
        ],
      ),
    );
  }
}

const LatLng sourceLocation = LatLng(14.485120, 121.230820);
const LatLng destination = LatLng(14.885120, 121.430820);

Widget homepageBody() {
  return Center(
    child: GoogleMap(
      initialCameraPosition:
          const CameraPosition(target: sourceLocation, zoom: 14.5),
      markers: {
        const Marker(
          markerId: MarkerId("source"),
          position: sourceLocation,
        ),
      },
    ),
  );
}
