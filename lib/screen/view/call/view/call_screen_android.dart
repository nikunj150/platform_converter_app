import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/view/detail/provider/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreenAndroid extends StatefulWidget {
  const CallScreenAndroid({super.key});

  @override
  State<CallScreenAndroid> createState() => _CallScreenAndroidState();
}

class _CallScreenAndroidState extends State<CallScreenAndroid> {

  ContactProvider? providerR;
  ContactProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR =context.read<ContactProvider>();
    providerW =context.watch<ContactProvider>();
    return ListView.builder(
      itemCount: providerW!.contactlist.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery
                .sizeOf(context)
                .height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black12,
            ),
            child: Row(
              children: [
                providerW!.contactlist[index].imagePath!= null
                    ? CircleAvatar(
                  radius: 35,
                  backgroundImage: FileImage(
                      File('${providerW!.contactlist[index].imagePath}')),
                ) : CircleAvatar(
                  radius: 35,
                  child: Text(
                    "${providerW!.contactlist[index].name?.substring(0, 1)
                        .toUpperCase()}",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${providerW!.contactlist[index].name}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      '${providerW!.contactlist[index].chat}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () async {
                      Uri uri = Uri.parse("tel:+91${providerR!.contactlist[index].phone}");
                      await launchUrl(uri);

                    },
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
