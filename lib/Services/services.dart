import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/news_model.dart';
//https://newsapi.org/v2/top-headlines?country=us&apiKey=ba2fea8e16464905ac5d236f7488631c
//api key : ba2fea8e16464905ac5d236f7488631c
//new developer email

//class
//function
//news element check
//data store with model
class NewsApi {
  // for news home screen
  List<NewsModel> newsStore = [];
  Future<void> getNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ba2fea8e16464905ac5d236f7488631c");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'], // name must be same fron api
            urlToImage: element['urlToImage'],
            description: element['description'],
            author: element['author'],
            content: element['content'],
          );
          newsStore.add(newsModel);
        }
      });
    }
  }
}
//https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=ba2fea8e16464905ac5d236f7488631c
//catagory
class CategoryNews {
  // for news home screen
  List<NewsModel> dataStore = [];
  Future<void> getNews(String category) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=ba2fea8e16464905ac5d236f7488631c");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'], // name must be same fron api
            urlToImage: element['urlToImage'],
            description: element['description'],
            author: element['author'],
            content: element['content'],
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}