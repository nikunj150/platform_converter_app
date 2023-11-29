import 'package:flutter/material.dart';

class SettingsScreenAndroid extends StatefulWidget {
  const SettingsScreenAndroid({super.key});

  @override
  State<SettingsScreenAndroid> createState() => _SettingsScreenAndroidState();
}

class _SettingsScreenAndroidState extends State<SettingsScreenAndroid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
       children: [
         Row(
           children: [
             Icon(Icons.person,),
             SizedBox(width: 15,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Profile",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                 Text("Update Profile Data"),
               ],
             )
           ],
         ),
         SizedBox(height: 5,),
         Divider(
           color: Colors.grey,
         ),
         SizedBox(height: 5,),
         Row(
           children: [
             Icon(Icons.light_mode_outlined,size: 30,),
             SizedBox(width: 15,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Theme",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                 Text("Change Theme"),
               ],
             )
           ],
         ),
       ],
      ),
    );
  }
}
