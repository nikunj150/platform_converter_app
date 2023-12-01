import 'package:flutter/material.dart';
import 'package:platform_converter_app/utils/share_helper.dart';

class ThemeProvider with ChangeNotifier{

  bool isLight= false;

  void changeTheme()
  async {
    ShrHelper shr= ShrHelper();
    bool? isTheme = await shr.getTheme();
    isLight= isTheme?? false;
    notifyListeners();
  }
}