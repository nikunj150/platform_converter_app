import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/view/chat/chat_screen_android.dart';
import 'package:platform_converter_app/screen/view/detail/detail_add_screen_android.dart';
import 'package:platform_converter_app/screen/view/home/home_screen_android.dart';
import 'package:platform_converter_app/screen/view/settings/settings_screen_android.dart';

class DashScreenAndroid extends StatefulWidget {
  const DashScreenAndroid({super.key});

  @override
  State<DashScreenAndroid> createState() => _DashScreenAndroidState();
}

class _DashScreenAndroidState extends State<DashScreenAndroid> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("platform converter"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.person_add_alt),
                ),
                Tab(
                  child: Text("CHATS"),
                ),
                Tab(
                  child: Text("CALLS"),
                ),
                Tab(
                  child: Text("SETTING"),
                ),
              ],
            ),
            centerTitle: true,
          ),
         body: TabBarView(
           children: [
              HomeScreenAndroid(),
              DetailAddAndroid(),
             CallScreenAndroid(),
             SettingsScreenAndroid(),
           ],
         ),
        ),
      ),
    );
  }
}
