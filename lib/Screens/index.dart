import 'package:cleaning_service/Screens/ordered.dart';
import 'package:cleaning_service/Screens/payment.dart';
import 'package:cleaning_service/Screens/profile.dart';
import 'package:cleaning_service/components/cardtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';
import 'inbox.dart';


class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List pages = [HomePage(), Inbox(), Profile()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,

        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                selectedIndex == 0 ? "asset/icons/home-filled.png" :"asset/icons/home.png",
                height: 25,
                width: 25,
                color: Colors.black,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                selectedIndex == 1 ? "asset/icons/inbox-filled.png" : "asset/icons/inbox.png",
                height: 25,
                width: 25,
              ),
              label: "Inbox"),
          BottomNavigationBarItem(
              icon: Image.asset(
                selectedIndex == 2 ? "asset/icons/user-filled.png" : "asset/icons/user.png",
                height: 25,
                width: 25,
              ),
              label: "Profile"),
          // BottomNavigationBarItem(
          //     icon: Image.asset(
          //       "asset/icons/user.png",
          //       height: 25,
          //       width: 25,
          //     ),
          //     label: "home",
          // ),
        ],
      ),
    );
  }
}