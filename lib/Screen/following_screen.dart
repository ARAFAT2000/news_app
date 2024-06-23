import 'package:flutter/material.dart';
import 'package:news_app/Model/follow_model.dart';
import 'package:news_app/Model/sport_model.dart';
import 'package:news_app/uri/text_design.dart';
import '../Widget/custom_appber.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppber(
                icon: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_rounded),
                ),
                title: 'Following News',
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ModiFyText(text: 'Recently following', size: 12),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: screenHeight * 0.12, // Adjust height based on screen height
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: followlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenWidth * 0.25, // Adjust width based on screen width
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            followlist[index].icon,
                            SizedBox(height: 5),
                            Text(followlist[index].name),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Divider(thickness: 4),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              sportsList[index].imageUrl,
                              height: screenHeight * 0.25, // Adjust height based on screen height
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02), // Adjust padding based on screen width
                            child: Text(
                              sportsList[index].name,
                              style: TextStyle(
                                fontSize: screenWidth * 0.05, // Adjust font size based on screen width
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Adjust padding based on screen width
                            child: Text(
                              sportsList[index].title,
                              style: TextStyle(
                                fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02), // Adjust padding based on screen width
                            child: Text(
                              sportsList[index].desc,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035, // Adjust font size based on screen width
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: sportsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
