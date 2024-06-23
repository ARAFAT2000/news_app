import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Widget/custom_appber.dart';
import '../Model/catagory_model.dart';
import '../Model/news_model.dart';
import '../Services/services.dart';
import '../uri/text_design.dart';
import 'catagory_screen.dart';
import 'news_details.dart';

class HeadLineScreen extends StatefulWidget {
  const HeadLineScreen({super.key});

  @override
  State<HeadLineScreen> createState() => _HeadLineScreenState();
}

class _HeadLineScreenState extends State<HeadLineScreen> {
  List<NewsModel> articles = [];
  List<CatagoryModel> category = [];
  bool isLoading = true;

  getNewsApi() async {
    NewsApi newsApi = NewsApi();
    await newsApi.getNews();
    articles = newsApi.newsStore;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    category = getCategories();
    getNewsApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppber(
                  icon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_rounded)),
                  title: 'Headline News'),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                height: screenHeight * 0.07,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SelectedCategoryNews(category: category[index].categoryName!)));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                    category[index].categoryName.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.045,
                                      color: Colors.black,
                                    ),
                                  ))),
                        ),
                      );
                    }),
              ),
              // news_home
              ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewsDetails(newsdecs: articles[index])));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: screenHeight * 0.25,
                              width: screenWidth,
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  articles[index].urlToImage.toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            ModiFyText(
                                text: articles[index].title.toString(),
                                size: screenWidth * 0.05),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat('yyyy-MM-dd').format(
                                    DateTime.parse(articles[index].publishedAt.toString()))),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                            Divider(
                              thickness: 4,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
