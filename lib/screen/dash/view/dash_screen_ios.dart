import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/dash/provider/dash_provider_ios.dart';
import 'package:platform_converter_app/screen/view/call/view/call_screen_ios.dart';
import 'package:platform_converter_app/screen/view/chat/view/chat_screen_ios.dart';
import 'package:platform_converter_app/screen/view/detail/view/detail_screen_ios.dart';
import 'package:platform_converter_app/screen/view/settings/view/settings_screen_ios.dart';
import 'package:provider/provider.dart';

class DashScreenIos extends StatefulWidget {
  const DashScreenIos({super.key});

  @override
  State<DashScreenIos> createState() => _DashScreenIosState();
}

class _DashScreenIosState extends State<DashScreenIos> {
  DashIosProvider? providerR;
  DashIosProvider? providerW;

  List<Widget> screen = [
    DetailScreenIos(),
    ChatScreenIos(),
    CallScreenIos(),
    SettingsScreenIos(),
  ];

  @override
  Widget build(BuildContext context) {
    providerR = context.read<DashIosProvider>();
    providerW = context.watch<DashIosProvider>();
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: providerR!.stepIndex,
        onTap: (value) {
          int i = value;
          providerR!.Changestep(i);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'CHATS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'CALLS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'SETTINGS',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return screen [
              providerW!.stepIndex
            ];
          },
        );
      },
    );
  }
}
