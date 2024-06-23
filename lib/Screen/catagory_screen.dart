import 'package:flutter/material.dart';
import 'package:news_app/Screen/news_details.dart';

import '../Model/news_model.dart';
import '../Services/services.dart';


class SelectedCategoryNews extends StatefulWidget {
  String category;
  SelectedCategoryNews({super.key, required this.category});

  @override
  State<SelectedCategoryNews> createState() => _SelectedCategoryNewsState();
}

class _SelectedCategoryNewsState extends State<SelectedCategoryNews> {
  List<NewsModel> articles = [];
  bool isLoadin = true;
  getNews() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.category);
    articles = news.dataStore;
    setState(() {
      isLoadin = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black)),
        title: Text(
          widget.category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
      body: isLoadin
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: ListView.builder(
          itemCount: articles.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final article = articles[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetails(newsdecs: article),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        article.urlToImage!,
                        height: 250,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      article.title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Divider(thickness: 2),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}