import 'dart:async';

import 'package:cleaning_service/utils/color.dart';
import 'package:cleaning_service/utils/constants.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
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
  FocusNode textFieldFocus = FocusNode();
  bool isKeyboardVisible = false;

  // GlobalKey _popupKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textFieldFocus.addListener(textFieldFocusListener);
  }

  void textFieldFocusListener() {
    setState(() {
      isKeyboardVisible = textFieldFocus.hasFocus;
      print(isKeyboardVisible);
    });
  }

  @override
  void dispose() {
    super.dispose();
    textFieldFocus.removeListener(textFieldFocusListener);
  }

  @override
  Widget build(BuildContext context) {
    String? copiedData;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        toolbarHeight: 65,
        automaticallyImplyLeading: true,
        backgroundColor: cColor.cWhite,
        leadingWidth: 116,
        leading: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                splashRadius: 30,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            CircleAvatar(
              radius: 28,
              foregroundImage: AssetImage(
                "asset/users/${widget.image}",
              ),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.name}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "Online",
              style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
            ),
          ],
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: isKeyboardVisible
                ? EdgeInsets.only(bottom: 70)
                : EdgeInsets.zero,
            shrinkWrap: true,
            controller: scrollController,
            itemCount: myChats.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTapDown: (TapDownDetails details) {
                  print("${details.globalPosition.dx}");
                  print("${details.globalPosition.dy}");
                  print("${details.localPosition.dx}");
                  print("${details.localPosition.dy}");
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                        details.globalPosition.dx,
                        details.globalPosition.dy + 25,
                        details.globalPosition.dx,
                        0),
                    items: [
                      PopupMenuItem(
                          child: Row(
                            children: [
                              Text("Delete"),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.delete),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              myChats.removeAt(index);
                            });
                          }),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Text("Copy"),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.copy),
                          ],
                        ),
                        onTap: () {
                          copiedData = myChats[index].msg;
                          FlutterClipboard.copy(copiedData!);
                          print("data copied");
                        },
                      ),
                    ],
                  );
                },
                child: myChats[index].isSendByMe
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50, 7, 10, 7),
                          child: Container(
                            padding: EdgeInsets.all(13),
                            constraints: BoxConstraints(
                              minHeight: 50,
                            ),
                            decoration: BoxDecoration(
                              color: cColor.cSender,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              copiedData == null
                                  ? "${myChats[index].msg}"
                                  : "${FlutterClipboard.paste()}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 7, 50, 7),
                          child: Container(
                            padding: EdgeInsets.all(13),
                            constraints: BoxConstraints(
                              minHeight: 50,
                            ),
                            decoration: BoxDecoration(
                              color: cColor.cReceiver,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FutureBuilder(
                                future: getData(index),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      "${snapshot.data}",
                                      style: TextStyle(fontSize: 18),
                                    );
                                  } else {
                                    return Icon(Icons.more_horiz);
                                  }
                                }),
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical:
                  Constants.orientation == Constants.isPortrait ? 10.0 : 8,
              horizontal: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextField(
              focusNode: textFieldFocus,
              controller: ctr,
              decoration: InputDecoration(
                hintText: "Type your msg here",
                suffixIcon: IconButton(
                    splashRadius: 25,
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      String? myText = ctr.text.toString().trim();
                      if (myText.isEmpty) {
                        print("Empty");
                      } else {
                        setState(
                          () {
                            myChats.add(
                              ChatDetails(myText, true),
                            );
                            myChats.add(
                              ChatDetails(myText, false),
                            );
                            scrollController.animateTo(
                                scrollController.position.maxScrollExtent + 50,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.bounceIn);
                            ctr.text = "";
                          },
                        );
                        // print(myChats.last.msg);
                      }
                      ;
                    }),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20),
                //   borderSide: BorderSide(color: Colors.black),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<String> getData(int index) async {
    if (index >= myChats.length - 1) {
      await Future.delayed(
        Duration(milliseconds: 1000),
      );
    }
    return "${myChats[index].msg}";
  }
}
