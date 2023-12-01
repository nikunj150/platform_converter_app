import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/view/settings/provider/settings_provider.dart';
import 'package:platform_converter_app/utils/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/share_helper.dart';

class SettingsScreenIos extends StatefulWidget {
  const SettingsScreenIos({super.key});

  @override
  State<SettingsScreenIos> createState() => _SettingsScreenIosState();
}

class _SettingsScreenIosState extends State<SettingsScreenIos> {
  Settingsprovider? providerR;
  Settingsprovider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<Settingsprovider>();
    providerW = context.watch<Settingsprovider>();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('PlatForm Converter'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              Row(
                children: [
                  const Icon(CupertinoIcons.person),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile",
                        style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Update Profile Data"),
                    ],
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    value: providerR!.isSwitch,
                    onChanged: (value) {
                      providerR!.switchStatus(value);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              providerR!.isSwitch == true
                  ? Column(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundColor: CupertinoColors.systemBlue,
                        ),
                        CupertinoButton(
                          child: const Icon(CupertinoIcons.photo),
                          onPressed: () {},
                        ),
                        const CupertinoTextField.borderless(
                          textAlign: TextAlign.center,
                          placeholder: 'Enter your Name',
                        ),
                        const CupertinoTextField.borderless(
                          textAlign: TextAlign.center,
                          placeholder: 'Enter your Bio',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                                onPressed: () {}, child: const Text('SAVE')),
                            CupertinoButton(
                                onPressed: () {}, child: const Text('CLEAR'))
                          ],
                        ),
                      ],
                    )
                  : const Divider(
                      color: Colors.grey,
                    ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.brightness,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Theme",
                        style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5,),
                      Text("Change Theme"),
                    ],
                  ),
                  const Spacer(),
                  Consumer<ThemeProvider>(
                    builder: (context, value, child) => CupertinoSwitch(
                      value: value.isLight,
                      onChanged: (value1) {
                        ShrHelper shr = ShrHelper();
                        shr.setTheme(value1);
                        value.changeTheme();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
