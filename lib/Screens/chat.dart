import 'dart:math';

import 'package:cleaning_service/utils/color.dart';
import 'package:cleaning_service/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/chat_details.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key, required this.image, required this.name})
      : super(key: key);
  final String name;
  final String image;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController ctr = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 65,
        automaticallyImplyLeading: true,
        backgroundColor: cColor.cWhite,
        leading: CircleAvatar(
          radius: 30,
          foregroundImage: AssetImage(
            "asset/users/${widget.image}",
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.name}",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "Online",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: myChats.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: myChats[index].isSendByMe
                  ? Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Container(
                    padding: EdgeInsets.all(13),
                    constraints: BoxConstraints(
                      minHeight: 50,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${myChats[index].msg}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              )
                  : Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Container(
                    padding: EdgeInsets.all(13),
                    constraints: BoxConstraints(
                      minHeight: 50,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${myChats[index].msg}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextField(
              controller: ctr,
              decoration: InputDecoration(
                hintText: "Type your msg here",
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    setState(
                      () {
                        myChats.add(
                          ChatDetails(ctr.text, true),
                        );
                        scrollController.animateTo(scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceIn);
                        ctr.clear();
                      },
                    );
                    print(myChats.last.msg);
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
