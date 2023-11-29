import 'package:flutter/cupertino.dart';

class DashIosProvider with ChangeNotifier{

  int stepIndex = 0;

  void Changestep(i){
    stepIndex = i;
    notifyListeners();
  }
}