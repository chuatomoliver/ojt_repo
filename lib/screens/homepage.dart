import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_activity_1/screens/contacts.dart';
import 'package:flutter_activity_1/screens/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0 ? Contacts().contactBody() : index == 1 ? homepageBody() : Profile().profileBody(),
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