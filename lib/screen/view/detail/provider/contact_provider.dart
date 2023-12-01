import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/view/detail/model/model_class.dart';


class ContactProvider  with ChangeNotifier {

  DateTime? Date =DateTime.now();
  TimeOfDay? Time =TimeOfDay.now();
  String? path;
  String? imagePath;

  List<ContactModel>contactlist=[];



  void storedata(cm)
  {
    contactlist.add(cm);
    notifyListeners();
  }

  void updateimagepath(String? newpath)
  {
    path = newpath;
    notifyListeners();
  }

  void changedate(DateTime? d1)
  {
    Date =d1;
    notifyListeners();
  }
  void changeTime(TimeOfDay? d2)
  {
    Time = d2;
    notifyListeners();
  }
}