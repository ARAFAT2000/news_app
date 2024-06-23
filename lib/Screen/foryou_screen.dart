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
  List<NewsModel> articles =[];

  bool isLoading = true;
  getForNewsApi()async{
    ForYouApi forYouApi=ForYouApi();
    await forYouApi.foryouNews();
    articles =forYouApi.foryou;
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
    return Scaffold(
      body:isLoading ? Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppber(
                  icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,), title: 'Update News'),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                        onTap:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>HeadLineScreen()));
                        },
                        child: ModiFyText(text: 'Top Stories', size: 22)),
                    SizedBox(width: 13,),
                    Icon(Icons.arrow_forward_ios,color: Colors.greenAccent[400])
                  ],
                ),
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
                           ModiFyText(text: articles[index].author.toString(), size: 13),
                            SizedBox(
                              height: 10,
                            ),
                            ModiFyText(text: articles[index].title.toString(), size: 17),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(articles[index].publishedAt.toString()))),

                                Row(
                                  children: [
                                    Icon(Icons.bookmarks_outlined),
                                    SizedBox(
                                      width: 15,
                                    ),
                                 GestureDetector(
                                     onTap:(){
                                     showModalBottomSheet(
                                         context: context,
                                         builder: (context){
                                           return SingleChildScrollView(
                                             child: Column(
                                               children: [
                                                 InkWell(
                                                   onTap:()
                                                   {
                                                     ScaffoldMessenger.of(context).showSnackBar(
                                                     SnackBar(
                                                       content: Text('Save for later'),
                                                     ),
                                                   );
                                                   },
                                                     child: Reuseable(icon: Icon(Icons.bookmark), name: 'Save for later')),
                                                 GestureDetector(
                                                   onTap:(){},
                                                     child: Reuseable(icon: Icon(Icons.share), name: 'Share')),
                                                 Reuseable(icon: Icon(Icons.feedback_outlined), name: 'Send feedback'),
                                                 Reuseable(icon: Icon(Icons.flag_outlined), name: 'Report content'),
                                               ],
                                             ),
                                           );
                                         });
                                     },
                                     child: Icon(Icons.arrow_drop_up_outlined))
                                  ],
                                )
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
    );
  }
}




