import 'package:flutter/material.dart';

import '../uri/text_design.dart';

class CustomAppber extends StatelessWidget {
  String title;
  Widget icon;
   CustomAppber({
    super.key,
    required this.icon,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            ModiFyText(text: title, size: 25),

            CircleAvatar(
                backgroundColor: Colors.greenAccent[400],
                radius: 20,
                child:Icon(Icons.person_pin,size: 35,color: Colors.white,) //Text
            ),
          ],
        ),
      ),
    );
  }
}