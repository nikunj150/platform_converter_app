import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/view/settings/provider/settings_provider.dart';
import 'package:platform_converter_app/utils/share_helper.dart';
import 'package:provider/provider.dart';

import '../../../../utils/theme_provider.dart';

class SettingsScreenAndroid extends StatefulWidget {
  const SettingsScreenAndroid({super.key});

  @override
  State<SettingsScreenAndroid> createState() => _SettingsScreenAndroidState();
}

class _SettingsScreenAndroidState extends State<SettingsScreenAndroid> {
  Settingsprovider? providerR;
  Settingsprovider? providerW;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<Settingsprovider>();
    providerW = context.watch<Settingsprovider>();
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.person,),
              const SizedBox(width: 15,),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profile",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  Text("Update Profile Data"),
                ],
              ),
              const Spacer( ),
              Switch(value: providerR!.isSwitch, onChanged: (value) {
                providerR!.switchStatus(value);

              },),
            ],
          ),
          const SizedBox(height: 20,),
          providerR!.isSwitch==true?
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.purple.shade100,
                  ),
                  IconButton(onPressed: () {

                  }, icon: const Icon(Icons.photo)),

                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Name'
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Bio'
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextButton(onPressed: () {

                     }, child: const Text('SAVE')),
                     TextButton(onPressed: () {

                     }, child: const Text('CLEAR'))
                   ],
                  ),
                ],
              ):
          const SizedBox(height: 5,),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              const Icon(Icons.light_mode_outlined,size: 30,),
              const SizedBox(width: 15,),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Theme",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  Text("Change Theme"),
                ],
              ),
              const Spacer( ),
              Consumer<ThemeProvider>(
                builder: (context, value, child) => Switch(value: value.isLight, onChanged: (value1) {
                  ShrHelper shr = ShrHelper();
                  shr.setTheme(value1);
                  value.changeTheme();
                },),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
