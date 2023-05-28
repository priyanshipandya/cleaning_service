import 'package:flutter/material.dart';

class InboxDetails {
  String image;
  String name;
  String msg;
  String time;
  String? msgNo;

  InboxDetails({required this.image, required this.name, required this.msg, required this.time, this.msgNo});
}


List<InboxDetails> userDetails = [
   InboxDetails(image: "user8.jpeg", name: "John Carlos", msg: "When will you be here?", time: "12:40 PM", msgNo: "3"),
   InboxDetails(image: "user1.jpeg", name: "Nicky", msg: "Hey Man!", time: "01:40 AM"),
   InboxDetails(image: "user6.jpg", name: "Martin Luther", msg: "Bro Dinner", time: "04:40 PM", msgNo: "3"),
   InboxDetails(image: "user7.jpeg", name: "Steve Smith", msg: "On my way!", time: "09:30 AM"),
   InboxDetails(image: "user2.jpg", name: "Sarah", msg: "How cute! isn't it?", time: "08:40 AM"),
   InboxDetails(image: "user5.jpeg", name: "Nelson Nail", msg: "Meeting off, call me!", time: "10:10 AM", msgNo: "4"),
   InboxDetails(image: "user3.jpeg", name: "Amanda", msg: "Waiting for you mate!", time: "03:25 PM"),
   InboxDetails(image: "user3.jpg", name: "Warner Lems", msg: "can you please pick me up?", time: "07:00 AM", msgNo: "3"),
];