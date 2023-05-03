import 'package:cleaning_service/Screens/homepage.dart';
import 'package:flutter/material.dart';

import '../Screens/ordered.dart';

class BottomNavigationbarPage extends StatelessWidget {
  const BottomNavigationbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: (value) {
        if(value == 0){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),);
        }
        else if(value == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderPlaced(),
              ),);
        }
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
            label: "home"),
        BottomNavigationBarItem(
            icon: Image.asset(
              "asset/icons/receipt.png",
              height: 25,
              width: 25,
            ),
            label: "home"),
        BottomNavigationBarItem(
            icon: Image.asset(
              "asset/icons/user.png",
              height: 25,
              width: 25,
            ),
            label: "home"),
      ],
    );
  }
}
