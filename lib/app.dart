import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screen/home_screen.dart';

import 'College/home_college.dart';
import 'College/steper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: SteperCollege(),
    );
  }
}