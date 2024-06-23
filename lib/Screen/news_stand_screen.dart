import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Services/services.dart';
import 'package:news_app/uri/text_design.dart';

import '../Model/catagory_model.dart';
import '../Model/news_model.dart';
import '../Widget/custom_appber.dart';
import '../Widget/re_useable.dart';
import 'catagory_screen.dart';
import 'news_details.dart';

class NewsStandScreen extends StatefulWidget {
  const NewsStandScreen({super.key});

  @override
  State<NewsStandScreen> createState() => _NewsStandScreenState();
}

class _NewsStandScreenState extends State<NewsStandScreen> {

  List<CatagoryModel> catagory=[];
  List<NewsModel> articles =[];

  bool isLoading = true;
  getNewsApi()async{
    EverythingApi newsApi = EverythingApi();
    await newsApi.EveryNews();
    articles =newsApi.everything;
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,top: 10),
          child: SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppber(
                    icon: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_rounded)), title: 'Newsstand '),
                ModiFyText(text: 'All News', size: 22),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 105,
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
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green),
                                    child: Center(
                                        child: Text(catagory[index].categoryName.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ))),
                                Positioned(
                                    top: 82,
                                    left: 40,
                                    child: Container(
                                      height: 25,
                                        width: 25,
                    
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Icon(Icons.grade_outlined,))),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    height: 40,
                    width: 200,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)
                    ),
                      child: Center(child: ModiFyText(text: 'More entertainment', size: 17))),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 10,
                ),
            
                ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
            
                                onTap:(){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>
                                          NewsDetails(newsdecs: articles[index])));
                                },
                                child: Container(
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
                              ),
                              SizedBox(
                                height: 15,
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                               Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(articles[index].publishedAt.toString()))),

                                ],
                              ),
            
                              Divider(thickness: 2,),
                            ],
                          ),
                        ),
                      );
                    }),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
