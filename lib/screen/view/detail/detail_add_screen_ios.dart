import 'package:flutter/cupertino.dart';

class DetailAddScreenIos extends StatefulWidget {
  const DetailAddScreenIos({super.key});

  @override
  State<DetailAddScreenIos> createState() => _DetailAddScreenIosState();
}

class _DetailAddScreenIosState extends State<DetailAddScreenIos> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('PlatForm Converter'),
      ),
      child: Column(
        children: [
          Row(
            children:[
              Icon(CupertinoIcons.person),
              CupertinoTextField(),
            ],
          ),
        ],
      ),
    );
  }
}
