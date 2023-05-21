import 'package:cleaning_service/utils/card_details.dart';
import 'package:cleaning_service/utils/color.dart';
import 'package:cleaning_service/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/cardtile.dart';

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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: cColor.cOrange,
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
                    backgroundColor: cColor.cOrange,
                    child: Image.asset(
                      "asset/images/map.png",
                      height: 25,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: 20,
                    backgroundColor: cColor.cOrange,
                    child: SvgPicture.asset(
                      "asset/vectors/avatar.svg",
                      height: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 35, right: 40),
                child: RichText(
                  text: TextSpan(
                      text: "What services do you need?",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: -1,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        WidgetSpan(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        WidgetSpan(
                          child: Image.asset(
                            "asset/images/design.png",
                            height: 45,
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: "Search Services",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                    filled: true,
                    fillColor: cColor.cWhite,
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
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                    Text(
                      "See more",
                      style: TextStyle(
                          fontSize: 15,
                          color: cColor.cOrange,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: Constants.orientation == Constants.isPortrait
                    ? Constants.height * 0.35
                    : Constants.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CardTile(
                      index: index,
                    ),
                    itemCount: CardDetails.cardDetails.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
