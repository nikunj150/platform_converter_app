import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../detail/provider/contact_provider.dart';

class ChatScreenIos extends StatefulWidget {
  const ChatScreenIos({super.key});

  @override
  State<ChatScreenIos> createState() => _ChatScreenIosState();
}

class _ChatScreenIosState extends State<ChatScreenIos> {
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
                  const Text('1/2/2023'),
                  const SizedBox(width: 8,),
                  const Text('5:30'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
