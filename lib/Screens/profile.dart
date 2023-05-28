import 'package:cleaning_service/utils/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  Map<IconData, String> firstSelection = {
    Icons.location_on: 'My Address',
    Icons.person: 'Account',
  };

  Map<IconData, String> secondSelection = {
    Icons.notification_important: 'Notifications',
    Icons.phone_android_rounded: 'Devices',
    Icons.key: 'Passwords',
    Icons.message: 'Language',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                height: Constants.orientation == Constants.isPortrait ? Constants.height * 0.4 : Constants.height * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "asset/images/room2.png",
                    ),
                    opacity: 0.6,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      foregroundImage: AssetImage(
                        "asset/users/user1.jpeg",
                      ),
                    ),

                    Text("Markus Horizon", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 2),),
                    Text("It's never too late to make a change", style: TextStyle(fontSize: 18, height: 1.5),),
                  ],
                ),
              )
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Constants.orientation == Constants.isPortrait ?  300 : 700,
              color: Colors.white,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                itemCount: firstSelection.length,
                separatorBuilder: (_, __) {
                  return Divider(
                    height: 1,
                  );
                },
                itemBuilder: (context, index) => ListTile(
                  title: Text("${firstSelection.values.elementAt(index)}"),
                  leading: Icon(firstSelection.keys.elementAt(index)),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Constants.orientation == Constants.isPortrait ?  300 : 700,
              color: Colors.white,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                itemCount: secondSelection.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text("${secondSelection.values.elementAt(index)}"),
                  leading: Icon(secondSelection.keys.elementAt(index)),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                separatorBuilder: (_, __) {
                  return Divider(
                    height: 1,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
