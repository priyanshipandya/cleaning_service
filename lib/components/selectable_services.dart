import 'package:cleaning_service/utils/color.dart';
import 'package:cleaning_service/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/selected_service.dart';

class SelectableServices extends StatefulWidget {
  SelectableServices({Key? key}) : super(key: key);

  @override
  State<SelectableServices> createState() => _SelectableServicesState();
}

class _SelectableServicesState extends State<SelectableServices> {
  List items = ["Laundry", "Repairing", "Electrical", "Plumbing", "Wiring"];
  // List<bool> isSelected = List.filled(5, false);
  List itemsImage = [
    "laundry",
    "repairing",
    "electricity",
    "plumbing",
    "coloring"
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedService(),
      builder: (context, child) => Container(
        height: Constants.orientation == Constants.isPortrait ? Constants.height * 0.20 : Constants.height * 0.30,
        constraints: BoxConstraints(
          minHeight: Constants.orientation == Constants.isPortrait ? Constants.height * 0.20 : Constants.height * 0.50,
          minWidth: Constants.orientation == Constants.isPortrait ? Constants.width : double.infinity,
        ),

        child: Consumer<SelectedService>(
          builder: (context, value, child) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                    value.changeIndexValue(index);
                  // isSelected[index] = !isSelected[index];
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: value.isSelected[index] ? cColor.cOrange : Colors.grey),
                ),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  child: Column(
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
        ),
      ),
    );
  }
}
