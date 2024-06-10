
import 'news_model.dart';

List<CatagoryModel> getCategories() {
  // news category list
  List<CatagoryModel> categories = [];

  CatagoryModel catagory1= CatagoryModel(
      categoryName: 'Science');
  categories.add(catagory1);

  CatagoryModel catagory2= CatagoryModel(
      categoryName: 'Sports');
  categories.add(catagory2);

  CatagoryModel catagory3= CatagoryModel(
      categoryName: 'Business');
  categories.add(catagory3);

  CatagoryModel catagory4= CatagoryModel(
      categoryName: 'General');
  categories.add(catagory4);

  CatagoryModel catagory5= CatagoryModel(
      categoryName: 'Health');
  categories.add(catagory5);

  CatagoryModel catagory6= CatagoryModel(
      categoryName: 'Entertainment');
  categories.add(catagory6);
  return categories;
}