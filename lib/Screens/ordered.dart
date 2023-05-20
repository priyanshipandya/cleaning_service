import 'package:cleaning_service/utils/color.dart';
import 'package:flutter/material.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    Image.asset(
                      "asset/images/girl.png",
                      height: MediaQuery.of(context).size.height * 0.65,
                      fit: BoxFit.cover,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: cColor.cWhite.withOpacity(0.2),
                      ),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(left: 10, top: 5),

                      child: IconButton(onPressed: () {
                        // Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios)),
                    )
                  ],

                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("Order placed!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
              child: Text(
                "Your order has been placed and our team will be ready soon.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
