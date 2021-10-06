import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier {
  int currentindex = 0;
  changeindex(int index) {
    currentindex = index;
    notifyListeners();
  }
}
