import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Services/services.dart';
import 'package:news_app/uri/text_design.dart';

import '../Model/catagory_model.dart';
import '../Model/news_model.dart';
import '../Widget/custom_appber.dart';
import 'catagory_screen.dart';
import 'news_details.dart';

class NewsStandScreen extends StatefulWidget {
  const NewsStandScreen({super.key});

  @override
  State<NewsStandScreen> createState() => _NewsStandScreenState();
}

class _NewsStandScreenState extends State<NewsStandScreen> {
  List<CatagoryModel> catagory = [];
  List<NewsModel> articles = [];
  bool isLoading = true;

  getNewsApi() async {
    EverythingApi newsApi = EverythingApi();
    await newsApi.EveryNews();
    articles = newsApi.everything;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    catagory = getCategories();
    getNewsApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenHeight * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppber(
                  icon: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_rounded),
                  ),
                  title: 'Newsstand ',
                ),
                ModiFyText(text: 'All News', size: screenWidth * 0.06),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.14,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catagory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectedCategoryNews(category: catagory[index].categoryName!),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(screenWidth * 0.04),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    catagory[index].categoryName.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.045,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: screenHeight * 0.1,
                                left: screenWidth * 0.1,
                                child: Container(
                                  height: screenHeight * 0.04,
                                  width: screenWidth * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(Icons.grade_outlined),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Divider(thickness: 2),
                SizedBox(height: screenHeight * 0.04),
                Center(
                  child: Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.5,
                    margin: EdgeInsets.all(screenWidth * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: ModiFyText(text: 'More entertainment', size: screenWidth * 0.045)),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Divider(thickness: 10),
                ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetails(newsdecs: articles[index]),
                                  ),
                                );
                              },
                              child: Container(
                                height: screenHeight * 0.25,
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    articles[index].urlToImage.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(articles[index].publishedAt.toString()))),
                              ],
                            ),
                            Divider(thickness: 2),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
