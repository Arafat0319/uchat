import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/pages/calls_page.dart';
import 'package:uchat/pages/contacts_page.dart';
import 'package:uchat/pages/massages_page.dart';
import 'package:uchat/pages/notifications_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MassagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,

        children: const [
          _NavigationBarItem(
            lable: 'Messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
          ),
          _NavigationBarItem(
            lable: 'Notifications',
            icon: CupertinoIcons.bell_solid,
          ),
          _NavigationBarItem(
            lable: 'Calls',
            icon: CupertinoIcons.phone_fill,
          ),
          _NavigationBarItem(
            lable: 'Contacts',
            icon: CupertinoIcons.person_2_fill,
          ),
        ],
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({Key? key, required this.lable, required this.icon})
      : super(key: key);

  final IconData icon;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(
            height: 8,
          ),
          Text(
            lable,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
