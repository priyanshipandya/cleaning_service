import 'package:cleaning_service/Screens/ordered.dart';
import 'package:cleaning_service/Screens/payment.dart';
import 'package:cleaning_service/components/cardtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';


class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List pages = [HomePage(), OrderPlaced(), Payment()];
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
                "asset/icons/home.png",
                height: 25,
                width: 25,
                color: Colors.black,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "asset/icons/inbox.png",
                height: 25,
                width: 25,
              ),
              label: "Inbox"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "asset/icons/receipt.png",
                height: 25,
                width: 25,
              ),
              label: "Receipt"),
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