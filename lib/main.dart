import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/utils/app_routes.dart';
import 'dart:io' show Platform;

void main() {
  runApp(
      Platform.isAndroid?MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: screen_routes,
      ):CupertinoApp(
        debugShowCheckedModeBanner: false,
        routes: ,
      ),
  );
}
