import 'package:cleaning_service/utils/color.dart';
import 'package:cleaning_service/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/inbox_details.dart';

class Inbox extends StatefulWidget {
  Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<InboxDetails> filterlist = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(indicatorColor: cColor.cOrange, tabs: [
              Tab(
                height: 60,
                child: Text(
                  "Inbox",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
              Tab(
                height: 60,
                child: Text(
                  "Call",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            ]),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 5,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                ),
                child: TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  onChanged: (value) {
                    filterlist.clear();
                    for (int i = 0; i < userDetails.length; i++) {
                      if (userDetails[i]
                          .name
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        filterlist.add(userDetails[i]);
                        print(userDetails[i].name);
                        print(filterlist.isEmpty);
                      }
                      setState(() {});
                    }
                    if (filterlist.isEmpty) {
                      Center(
                        child: Text(
                          "No User Found",
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            filterlist.isEmpty
                ? SizedBox(
                    height: Constants.height - 250,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userDetails.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              foregroundImage: AssetImage(
                                  "asset/users/${userDetails[index].image}"),
                            ),
                            title: Text(
                              userDetails[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              userDetails[index].msg,
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(userDetails[index].time),
                                if (userDetails[index].msgNo != null)
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.black,
                                    child: Text(userDetails[index].msgNo!),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userDetails.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              foregroundImage: AssetImage(
                                  "asset/users/${userDetails[index].image}"),
                            ),
                            title: Text(
                              userDetails[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              userDetails[index].msg,
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.video_call, color: Colors.black),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(Icons.call, color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: Constants.height - 250,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filterlist.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              foregroundImage: AssetImage(
                                  "asset/users/${filterlist[index].image}"),
                            ),
                            title: Text(
                              filterlist[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              filterlist[index].msg,
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(filterlist[index].time),
                                if (filterlist[index].msgNo != null)
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.black,
                                    child: Text(filterlist[index].msgNo!),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filterlist.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              foregroundImage: AssetImage(
                                  "asset/users/${filterlist[index].image}"),
                            ),
                            title: Text(
                              userDetails[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              filterlist[index].msg,
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.video_call, color: Colors.black),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(Icons.call, color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}
