import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedService extends ChangeNotifier{
  List<bool> isSelected = List.filled(5, false);

  void changeIndexValue(int index){
    isSelected[index] = !isSelected[index];
    notifyListeners();
  }
}