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
  List<NewsModel> articles =[];
  List<CatagoryModel> catagory=[];
  bool isLoading = true;
  getNewsApi()async{
    NewsApi newsApi = NewsApi();
    await newsApi.getNews();
    articles =newsApi.newsStore;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    catagory=getCategories();
    getNewsApi();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:isLoading? Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppber(
                  icon: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_rounded)), title: 'Headline News'),

              SizedBox(
                height: 15,
              ),
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catagory.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding:EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>
                                    SelectedCategoryNews(category: catagory[index].categoryName!)
                                ));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(catagory[index].categoryName.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ))),
                        ),
                      );
                    }),
              ),
              //news_home
              ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>
                                    NewsDetails(newsdecs: articles[index])));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                width: 400,
                                decoration: BoxDecoration(
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),  // Match this with the Container's borderRadius
                                  child: Image.network(
                                    articles[index].urlToImage.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),

                              ModiFyText(text: articles[index].title.toString(),
                                  size: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(articles[index].publishedAt.toString()))),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                              Divider(thickness: 4,),
                            ],
                          ),
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