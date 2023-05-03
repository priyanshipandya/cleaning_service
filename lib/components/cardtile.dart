import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  const CardTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'asset/images/room1.jpg',
              height: 270,
              width: 230,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 13,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Container(
                  height: 90,
                  width: 200,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon(Icons.circle, size: 10),
                        const Padding(
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
    );
  }
}
