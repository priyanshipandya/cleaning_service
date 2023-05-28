import 'package:flutter/cupertino.dart';

class Constants{
  static final mediaQueryData  = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  static final height = mediaQueryData.size.height;
  static final width = mediaQueryData.size.width;

  static final orientation = mediaQueryData.orientation;
  static final isPortrait = Orientation.portrait;

  static final keyboardSize = mediaQueryData.viewInsets.bottom;
}