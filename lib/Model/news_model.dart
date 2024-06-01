class CatagoryModel{
  String ?categoryName;

  CatagoryModel({required this.categoryName});
}

class NewsModel{

  String? title;
  String? description;

  String? urlToImage;
  String? author;
  String? content;

  NewsModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.author,
    required this.content
  });
}