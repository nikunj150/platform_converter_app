import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/dash/provider/dash_provider_ios.dart';
import 'package:platform_converter_app/screen/view/detail/provider/contact_provider.dart';
import 'package:platform_converter_app/screen/view/settings/provider/settings_provider.dart';
import 'package:platform_converter_app/utils/app_routes.dart';
import 'package:platform_converter_app/utils/app_theme.dart';
import 'package:platform_converter_app/utils/theme_provider.dart';
import 'dart:io' show Platform;

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Settingsprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ContactProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DashIosProvider(),
      )
    ],
    child: Platform.isAndroid
        ? Consumer<ThemeProvider>(builder: (context, value, child) {
            value.changeTheme();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: value.isLight ? lightTheme : darkTheme,
              routes: screen_routes,
            );
          })
        : Consumer<ThemeProvider>(
            builder: (context, value, child) {
              value.changeTheme();
              return CupertinoApp(
                debugShowCheckedModeBanner: false,
               theme: value.isLight ? lightCupertinoTheme : darkCupertinoTheme,
                routes: app_routes,
              );
            },
          ),
  )
      );
}
