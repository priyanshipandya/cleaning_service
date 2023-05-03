import 'package:cleaning_service/Screens/ordered.dart';
import 'package:cleaning_service/components/cardtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../navigation/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DropdownMenuItem> dropDownItems = [
    const DropdownMenuItem(
        value: "Batununggal, Indonesia", child: Text("Batununggal, Indonesia")),
    const DropdownMenuItem(
        value: "Batununggal, Indonesia", child: Text("Batununggal, Indonesia")),
    const DropdownMenuItem(
        value: "Batununggal, Indonesia", child: Text("Batununggal, Indonesia")),
    const DropdownMenuItem(
        value: "Batununggal, Indonesia", child: Text("Batununggal, Indonesia")),
  ];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: ListTile(
                  title: const Text(
                    "My Location",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  dense: true,
                  subtitle: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.orangeAccent,
                      ),
                      isDense: true,
                      hint: const Text(
                        "Batununggal, Indonesia",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                      items: dropDownItems,
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.orangeAccent,
                    child: Image.asset(
                      "asset/images/map.png",
                      height: 25,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.orangeAccent,
                    child: SvgPicture.asset(
                      "asset/vectors/avatar.svg",
                      height: 40,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 35, right: 40),
                child: Text(
                  "What services do you need?",
                  style: TextStyle(
                    letterSpacing: -1,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Services",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                    filled: true,
                    fillColor: const Color(0xfff3f5f6),
                    suffixIcon: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.black38)),
                      ),
                      height: 15,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Image.asset(
                          "asset/icons/sort.png",
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Image.asset("asset/icons/search.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("asset/images/juice.png", height: 22),
                        const Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Text(
                            "Service category",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "See more",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    SizedBox(
                      width: 30,
                    ),
                    CardTile(),
                    SizedBox(
                      width: 10,
                    ),
                    CardTile(),
                    SizedBox(
                      width: 10,
                    ),
                    CardTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationbarPage(),
    );
  }
}
