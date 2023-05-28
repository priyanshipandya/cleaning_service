import 'package:cleaning_service/components/selectable_services.dart';
import 'package:cleaning_service/utils/color.dart';
import 'package:cleaning_service/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/selected_service.dart';

class OrderBill extends StatelessWidget {
  OrderBill({Key? key}) : super(key: key);
  List items = ["Laundry", "Repairing", "Electrical"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: Constants.orientation == Constants.isPortrait
            ? Constants.height * 0.35
            : Constants.height * 0.80,
        decoration: BoxDecoration(
          color: cColor.cWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date & Time",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Mon, 10 October",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "11:00 AM",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Order Summary",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ...List.generate(
                      items.length,
                      (index) => Row(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 3, right: 8),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: cColor.cOrange,
                          ),
                        ),
                        Text("${items[index]}", style: TextStyle(fontSize: 16),),
                      ]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Enter promo code(optional)",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: cColor.cOrange),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
