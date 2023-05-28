import 'package:cleaning_service/Screens/payment.dart';
import 'package:cleaning_service/utils/card_details.dart';
import 'package:cleaning_service/utils/constants.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  CardTile({Key? key, required this.cardDesc}) : super(key: key);
  final CardDetails? cardDesc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'asset/images/room1.jpg',
              height: MediaQuery.of(context).orientation == Orientation.portrait ?  Constants.height * 0.35 : Constants.height * 0.6,
              width: Constants.width * 0.65,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Container(
                  width: Constants.width * 0.6,
                  color: Colors.white.withOpacity(0.9),
                  constraints: BoxConstraints(
                    minHeight: Constants.height * 0.105,
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.orange,
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${cardDesc!.title}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("${cardDesc!.work}",textAlign: TextAlign.start,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}