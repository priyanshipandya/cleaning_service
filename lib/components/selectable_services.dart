import 'package:cleaning_service/utils/color.dart';
import 'package:flutter/material.dart';

class SelectableServices extends StatelessWidget {
  SelectableServices({Key? key}) : super(key: key);

  List items = ["Laundry", "Repairing", "Electrical", "Plumbing", "Wiring"];
  List itemsImage = [
    "laundry",
    "repairing",
    "electricity",
    "plumbing",
    "coloring"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: cColor.cOrange),
            ),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        "asset/images/${itemsImage[index]}.png",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    radius: 40,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(items[index]),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}
