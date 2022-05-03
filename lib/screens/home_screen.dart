// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/helper.dart';
import 'package:uchat/pages/calls_page.dart';
import 'package:uchat/pages/contacts_page.dart';
import 'package:uchat/pages/massages_page.dart';
import 'package:uchat/pages/notifications_page.dart';
import 'package:uchat/theme.dart';

import 'package:uchat/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [
    MassagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage()
  ];
  final pageTitles = const ['Messages', 'Notifications', 'Calls', 'Contacts'];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    // pageIndex.addListener(() {});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //上一行把状态栏弄成了透明的但初始值里有阴影（类似于状态栏比其他页面高）所以把Z轴设置成0
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            );
          },
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search,
            onTap: () {
              print('TODO search');
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: Helpers.randonPictureUrl()),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          print(value);
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSeleted: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSeleted})
      : super(key: key);

  final ValueChanged<int> onItemSeleted;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectdIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectdIndex = index;
    });
    widget.onItemSeleted(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          _NavigationBarItem(
            index: 0,
            lable: 'Messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            isSelected: (selectdIndex == 0),
            onTap: handleItemSelected,
          ),
          _NavigationBarItem(
            index: 1,
            lable: 'Notifications',
            icon: CupertinoIcons.bell_solid,
            isSelected: (selectdIndex == 1),
            onTap: handleItemSelected,
          ),
          _NavigationBarItem(
            index: 2,
            lable: 'Calls',
            icon: CupertinoIcons.phone_fill,
            isSelected: (selectdIndex == 2),
            onTap: handleItemSelected,
          ),
          _NavigationBarItem(
            index: 3,
            lable: 'Contacts',
            icon: CupertinoIcons.person_2_fill,
            isSelected: (selectdIndex == 3),
            onTap: handleItemSelected,
          ),
        ],
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {Key? key,
      required this.lable,
      required this.icon,
      required this.index,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  final ValueChanged<int> onTap;
  final IconData icon;
  final String lable;
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              lable,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary)
                  : const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
