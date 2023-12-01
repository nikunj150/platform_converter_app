import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/screen/view/detail/model/model_class.dart';
import 'package:platform_converter_app/screen/view/detail/provider/contact_provider.dart';
import 'package:provider/provider.dart';

class DetailScreenAndroid extends StatefulWidget {
  const DetailScreenAndroid({super.key});

  @override
  State<DetailScreenAndroid> createState() => _DetailScreenAndroidState();
}

class _DetailScreenAndroidState extends State<DetailScreenAndroid> {
  ContactProvider? providerR;
  ContactProvider? providerW;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtchat = TextEditingController();
  TextEditingController txttime = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: providerW!.path != null
              ? FileImage(File(providerW!.path!))
              : null,
              ),
              IconButton(onPressed: () async {
                ImagePicker picker =ImagePicker();
                XFile? image = await picker.pickImage(source: ImageSource.gallery);
                providerR!.updateimagepath(image!.path);

              }, icon: const Icon(Icons.image)),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: txtname,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  label: const Text('Full Name'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: txtphone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  label: const Text('Phone Number'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: txtchat,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.chat),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  label: const Text('Chat Conversation'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        DateTime? d1 = await showDatePicker(
                          context: context,
                          initialDate: providerR!.Date!,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        );
                        providerR!.changedate(d1!);
                      },
                      icon: const Icon(Icons.calendar_month)),
                  Text(
                    "${providerW!.Date!.day}/${providerW!.Date!.month}/${providerW!.Date!.year}",
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        TimeOfDay? d2 = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.dial,
                        );
                        providerR!.changeTime(d2!);
                      },
                      icon: const Icon(Icons.access_time_rounded)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${providerW!.Time!.hour} : ${providerW!.Time!.minute} ",
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  ContactModel cm = ContactModel(
                    name: txtname.text,
                    phone: txtphone.text,
                    chat: txtchat.text,
                    imagePath: providerW!.path,
                  );
                  providerR!.storedata(cm);
                  providerR!.updateimagepath(null);
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Contact Saved')),
                    );
                  }
                },
                child: const Text('SAVE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
