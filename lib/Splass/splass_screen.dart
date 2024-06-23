

import 'package:flutter/material.dart';
import 'package:news_app/Screen/navbar_screen.dart';

class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=>NavbarScreen()),
              (Route<dynamic> route) => false

      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splass.PNG'),
      ),
    );
  }
}
