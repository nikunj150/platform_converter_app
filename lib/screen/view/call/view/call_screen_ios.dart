import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../detail/provider/contact_provider.dart';

class CallScreenIos extends StatefulWidget {
  const CallScreenIos({super.key});

  @override
  State<CallScreenIos> createState() => _CallScreenIosState();
}

class _CallScreenIosState extends State<CallScreenIos> {
  ContactProvider? providerR;
  ContactProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('PlatForm Converter')),
      child: ListView.builder(
        itemCount:  providerW!.contactlist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.10,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: CupertinoColors.systemBlue,
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
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${providerW!.contactlist[index].chat}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CupertinoButton(
                      onPressed: () async {
                        Uri uri = Uri.parse("tel:+91${providerR!.contactlist[index].phone}");
                        await launchUrl(uri);

                      },
                      child : Icon(
                        CupertinoIcons.phone,
                        color: CupertinoColors.activeGreen,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
