import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
);
CupertinoThemeData lightCupertinoTheme = CupertinoThemeData(
  scaffoldBackgroundColor: CupertinoColors.white,
  brightness: Brightness.light,
);
CupertinoThemeData darkCupertinoTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: CupertinoColors.black,
  textTheme:  CupertinoTextThemeData(
    navLargeTitleTextStyle: TextStyle(color: CupertinoColors.white),
  ),

);
