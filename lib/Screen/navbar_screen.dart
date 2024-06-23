import 'package:flutter/material.dart';

import 'following_screen.dart';
import 'foryou_screen.dart';
import 'headline_screen.dart';
import 'home_screen.dart';
import 'news_details.dart';
import 'news_stand_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  static final List _pageList = [
    ForYouScreen(),
    HeadLineScreen(),
    FollowingScreen(),
    NewsStandScreen(),


  ];
  int currentIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pageList.elementAt(currentIndex),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          onTap: (value){
            setState(() {
              currentIndex=value;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: 'For you',
                icon: Icon(Icons.api,color: Colors.black87)),
            BottomNavigationBarItem(
                label: 'Headlines',
                icon: Icon(Icons.recycling_outlined,color: Colors.black87,)),
            BottomNavigationBarItem(
                label: 'Following',
                icon: Icon(Icons.grade_outlined,color: Colors.black87)),
            BottomNavigationBarItem(
                label: 'Newsstand',
                icon: Icon(Icons.assessment_outlined,color: Colors.black87)),
          ]),
    );
  }
}
