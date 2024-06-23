import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/uri/text_design.dart';

import '../Services/services.dart';
import '../Widget/re_useable.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsdecs;
  const NewsDetails({
    super.key,
    required this.newsdecs,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
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
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
        ),
        actions: [
          Icon(Icons.share, size: 25, color: Colors.black87),
          SizedBox(width: 10),
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Save for later'),
                              ),
                            );
                          },
                          child: Reuseable(icon: Icon(Icons.bookmark), name: 'Save for later'),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Reuseable(icon: Icon(Icons.share), name: 'Share'),
                        ),
                        Reuseable(icon: Icon(Icons.feedback_outlined), name: 'Send feedback'),
                        Reuseable(icon: Icon(Icons.flag_outlined), name: 'Report content'),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black87),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(Icons.join_full_sharp),
                SizedBox(width: 10),
                ModiFyText(text: 'Full Coverage', size: screenWidth * 0.04),
              ],
            ),
            SizedBox(height: 20),
            Text(
              widget.newsdecs.title.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  child: Text('_${widget.newsdecs.author.toString()}', maxLines: 1),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: screenHeight * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.newsdecs.urlToImage.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.newsdecs.publishedAt.toString()))),
            SizedBox(height: 20),
            Text(
              widget.newsdecs.content.toString(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: screenWidth * 0.045,
              ),
            ),
            SizedBox(height: 20),
            ModiFyText(text: widget.newsdecs.description.toString(), size: screenWidth * 0.04),
            SizedBox(height: 20),
            Text(
              'Previous News',
              style: TextStyle(
                color: Colors.red,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: screenHeight * 0.35,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
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
                              height: screenHeight * 0.15,
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
                          SizedBox(height: 20),
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ModiFyText(text: articles[index].author.toString(), size: screenWidth * 0.035),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
