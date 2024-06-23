import 'package:flutter/material.dart';
import 'following_screen.dart';
import 'foryou_screen.dart';
import 'headline_screen.dart';
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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: _pageList.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedFontSize: screenWidth * 0.035, // Adjusted for responsiveness
        unselectedFontSize: screenWidth * 0.03, // Adjusted for responsiveness
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: 'For you',
            icon: Icon(
              Icons.api,
              color: Colors.black87,
              size: screenWidth * 0.07, // Adjusted for responsiveness
            ),
          ),
          BottomNavigationBarItem(
            label: 'Headlines',
            icon: Icon(
              Icons.recycling_outlined,
              color: Colors.black87,
              size: screenWidth * 0.07, // Adjusted for responsiveness
            ),
          ),
          BottomNavigationBarItem(
            label: 'Following',
            icon: Icon(
              Icons.grade_outlined,
              color: Colors.black87,
              size: screenWidth * 0.07, // Adjusted for responsiveness
            ),
          ),
          BottomNavigationBarItem(
            label: 'Newsstand',
            icon: Icon(
              Icons.assessment_outlined,
              color: Colors.black87,
              size: screenWidth * 0.07, // Adjusted for responsiveness
            ),
          ),
        ],
      ),
    );
  }
}
