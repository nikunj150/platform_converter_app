import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settingsprovider with ChangeNotifier {
  bool isSwitch = false;

  void switchStatus(value) {
    isSwitch = value;
    value = isSwitch;
    notifyListeners();
  }
}
