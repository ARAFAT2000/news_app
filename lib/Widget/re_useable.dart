import 'package:flutter/material.dart';

class Reuseable extends StatelessWidget {
  String name;
  Widget icon;
  Reuseable({super.key,
    required this.icon,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(leading: icon,title: Text(name),)
      ],
    );
  }
}