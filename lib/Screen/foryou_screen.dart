import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Screen/headline_screen.dart';
import '../Model/news_model.dart';
import '../Services/services.dart';
import '../Widget/custom_appber.dart';
import '../Widget/re_useable.dart';
import '../uri/text_design.dart';
import 'news_details.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  List<NewsModel> articles = [];

  bool isLoading = true;

  getForNewsApi() async {
    ForYouApi forYouApi = ForYouApi();
    await forYouApi.foryouNews();
    articles = forYouApi.foryou;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getForNewsApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
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
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                  title: 'Update News'),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HeadLineScreen()));
                        },
                        child: ModiFyText(text: 'Top Stories', size: screenWidth * 0.055)),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.greenAccent[400])
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsDetails(newsdecs: articles[index])));
                            },
                            child: Container(
                              height: screenHeight * 0.25,
                              width: screenWidth,
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  articles[index].urlToImage.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ModiFyText(
                              text: articles[index].author.toString(),
                              size: screenWidth * 0.035),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          ModiFyText(
                              text: articles[index].title.toString(),
                              size: screenWidth * 0.045),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DateFormat('yyyy-MM-dd').format(
                                  DateTime.parse(articles[index]
                                      .publishedAt
                                      .toString()))),
                              Row(
                                children: [
                                  Icon(Icons.bookmarks_outlined),
                                  SizedBox(
                                    width: screenWidth * 0.04,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          ScaffoldMessenger.of(
                                                              context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                  'Save for later'),
                                                            ),
                                                          );
                                                        },
                                                        child: Reuseable(
                                                            icon: Icon(
                                                                Icons
                                                                    .bookmark),
                                                            name:
                                                            'Save for later')),
                                                    GestureDetector(
                                                        onTap: () {},
                                                        child: Reuseable(
                                                            icon: Icon(
                                                                Icons
                                                                    .share),
                                                            name:
                                                            'Share')),
                                                    Reuseable(
                                                        icon: Icon(Icons
                                                            .feedback_outlined),
                                                        name:
                                                        'Send feedback'),
                                                    Reuseable(
                                                        icon: Icon(Icons
                                                            .flag_outlined),
                                                        name:
                                                        'Report content'),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child: Icon(
                                          Icons.arrow_drop_up_outlined))
                                ],
                              )
                            ],
                          ),
                          Divider(
                            thickness: 2,
                          ),
                        ],
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
