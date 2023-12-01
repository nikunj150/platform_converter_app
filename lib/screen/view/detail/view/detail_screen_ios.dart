import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/view/detail/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import '../model/model_class.dart';

class DetailScreenIos extends StatefulWidget {
  const DetailScreenIos({super.key});

  @override
  State<DetailScreenIos> createState() => _DetailScreenIosState();
}

class _DetailScreenIosState extends State<DetailScreenIos> {

  ContactProvider? providerR;
  ContactProvider? providerW;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtchat = TextEditingController();
  TextEditingController txttime = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('PlatForm Converter'),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100,),
              const CircleAvatar(
                radius: 70,
                backgroundColor: CupertinoColors.systemBlue,
              ),
              CupertinoButton(
                child: const Icon(CupertinoIcons.photo),
                onPressed: () {},
              ),
               Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(CupertinoIcons.person),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 290,
                    child: CupertinoTextField(
                      placeholder: 'Enter name',
                      controller: txtname,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
               Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(CupertinoIcons.phone),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 290,
                    child: CupertinoTextField(
                      controller: txtphone,
                      keyboardType: TextInputType.phone,
                      placeholder: 'Enter Phone Number',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
               Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(CupertinoIcons.chat_bubble),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 290,
                    child: CupertinoTextField(
                      controller: txtchat,
                      placeholder: 'Chat Conversation',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CupertinoButton(
                    child: const Icon(CupertinoIcons.calendar),
                    onPressed: () {},
                  ),
                  const Text('dd/mm/yy'),
                ],
              ),
              Row(
                children: [
                  CupertinoButton(
                    child: const Icon(CupertinoIcons.clock),
                    onPressed: () {},
                  ),
                  const Text('hh:mm'),
                ],
              ),
              CupertinoButton.filled(child: const Text('SAVE'), onPressed: () {
                ContactModel cm = ContactModel(
                  name: txtname.text,
                  phone: txtphone.text,
                  chat: txtchat.text,
                );
                providerR!.storedata(cm);
                providerR!.updateimagepath(null);
              }, ),
            ],
          ),
        ),
      ),
    );
  }
}
