import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  const CardTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'asset/images/room1.jpg',
                height: size.height * 0.35,
                width: size.width * 0.65,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Container(
                    height: size.height * 0.105,
                    width: size.width * 0.5,
                    color: Colors.white.withOpacity(0.9),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon(Icons.circle, size: 10),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.orange,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "House Renovation",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Repairing"),
                            ],
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
      ),
    );
  }
}
