import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List chats = ["Hello", "Noob hai ree tu", "Chup reh noobda"];
  var _chat = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return Text(chats[index]);
        },
      ),
      bottomNavigationBar: Container(
        child: TextFormField(
          controller: _chat,
          onFieldSubmitted: (e) {
            setState(() {
              // chats.add();
              print("Message added");
            });
          },
        ),
      ),
    );
  }
}
