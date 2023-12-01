import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/screen/dash/view/dash_screen_android.dart';
import 'package:platform_converter_app/screen/dash/view/dash_screen_ios.dart';

Map<String,WidgetBuilder> screen_routes = {
'/':(context) => DashScreenAndroid(),

};
Map<String,WidgetBuilder> app_routes = {

  '/':(context) => DashScreenIos(),
};