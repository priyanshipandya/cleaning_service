import 'package:cleaning_service/Screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/index.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cleaning Services",
      // home: Index(),
      home: Index(),
    );

  }
}
