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
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NavbarScreen()),
              (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splass.PNG',
          width: screenWidth * 0.6,  // Adjust image width based on screen size
          height: screenHeight * 0.6,  // Adjust image height based on screen size
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
